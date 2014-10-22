module Wlog
  # A git commit message
  # @author Simon Symeonidis
  class GitCommit
    attr_accessor :commit, :author, :shortlog, :message

    def initialize
      @commit = @author = @shortlog = @message = ""
    end
  end
end