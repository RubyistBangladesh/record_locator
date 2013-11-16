module RecordLocator
  autload :Encoder, 'record_locator/encoder'
end

require 'record_locator/active_record' if defined?(ActiveRecord)