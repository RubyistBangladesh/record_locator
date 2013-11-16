module RecordLocator
  class Finder

    def initialize(model_clazz, record_locator_field)
      @clazz = model_clazz
      @field = record_locator_field
    end

    def find(id)
      find_all(id).first
    end

    def find_all(id)
      # for Rails > 4.0, use ActiveRecord where method
      #@model.where("#{@record_locator_field}=?", Util::Base::decode(id.to_s))

      # supported until rails 4.0 from rails 2.3
      records = @clazz.find(
          :all, :conditions => ["#{@field} = ?", RecordLocator::Encoder::decode(id.to_s)]
      )

      return records if records.present?

      @clazz.find(:all, :conditions => ["#{@field}= ?", id])
    end
  end
end