require 'fileutils'
require 'json'

module Fakebook
  module Cache
    class Persist

      def initialize(key, response)
        @key = key
        @response = response
        @path = Fakebook::Cache.cache_directory
      end

      def save
        unless File.directory?(@path)
          FileUtils.mkdir_p(@path)
        end
        
        path = File.join(@path, @key + '.json')
        File.open(path, 'w') { |file| file.write(@response.to_json) }
      end
    end

  end
end
