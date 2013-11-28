module Fakebook
  module Cache
    mattr_accessor :cache_directory

    extend self

    def cache_directory
      @cache_directory || 'spec/fakebook_cache'
    end
  end
end
