module RecordLocator
  module ActiveRecord
    autload :Finder     'record_locator/active_record/finder'
    autload :Extension  'record_locator/active_record/extension'
  end
end