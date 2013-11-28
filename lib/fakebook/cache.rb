module Fakebook
  module Cache
    mattr_accessor :cache_directory

    def self.cache_directory
      @@cache_directory || 'spec/fakebook_cache'
    end
  end
end
