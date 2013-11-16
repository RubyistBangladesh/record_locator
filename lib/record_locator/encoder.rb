module RecordLocator
  class Encoder

    ENCODER = Hash.new do |h, k|
      h[k] = Hash[k.chars.map.enum_for(:each_with_index).to_a.map(&:reverse)]
    end

    DECODER = Hash.new do |h, k|
      h[k] = Hash[k.chars.map.enum_for(:each_with_index).to_a]
    end

    BASE27 = "234679ACDEFGHJKLMNPRTUVWXYZ"

    class << self
      def encode(value)
        ring   = ENCODER[BASE27]
        base   = BASE27.length
        result = []
        until value == 0
          result << ring[value % base]
          value /= base
        end
        result.reverse.join
      end

      def decode(string)
        string = string.to_s
        return string if string.split('').include?('1') || string.split('').include?('0') # as 0 and 1 are included into exceptional chars
        ring = DECODER[BASE27]
        base = BASE27.length
        string.reverse.chars.enum_for(:each_with_index).inject(0) do |sum, (char, i)|
          sum + ring[char] * base**i
        end
      end
    end
  end
end