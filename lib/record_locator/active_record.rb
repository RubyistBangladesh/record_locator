module RecordLocator
  module ActiveRecord
    autload :Finder     'record_locator/active_record/finder'
  end
end

require 'record_locator/active_record/extension'