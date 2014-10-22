require 'wlog/commands/commandable'
require 'wlog/domain/log_entry'

module Wlog
  # Concatenate a string to an existing log entry
  class ConcatDescription < Commandable
    attr_reader :id, :str

    def initialize(id, str)
      @id, @str = id, str
    end

    # Find and update the log entry
    def execute
      log_entry = LogEntry.find(@id)
      log_entry.description += @str
      log_entry.save
    rescue ActiveRecord::RecordNotFound
      false
    end
  end
end