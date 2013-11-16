module RecordLocator
  module ActiveRecord
    module Extension

      extend ActiveSupport::Concern

      included do
        class_attribute :record_locator_by
      end

      module ClassMethods
        def has_record_locator(attribute_name)
          self.record_locator_by = attribute_name
        end

        def record_locator
          @record_locator ||= RecordLocator::ActiveRecord::Finder.new self, self.record_locator_by
        end
      end

      def encoded_record_locator
        RecordLocator::Encoder.encode(self.class.record_locator_by)
      end
    end
  end
end