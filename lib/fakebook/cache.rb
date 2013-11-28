module Fakebook
  module Cache
    mattr_accessor :cache_directory

    def self.cache_directory
      @@cache_directory || 'spec/fakebook_cache'
    end

    def self.dump_to_json
      
    end
  end
end
