require 'json'

module Fakebook
  module Cache
    mattr_accessor :cache_directory

    def self.cache_directory
      @@cache_directory || 'spec/fakebook_cache'
    end

    def self.dump_to_json
      obj = {}
      Dir.glob("#{cache_directory}/*.json") do |file_name|
        obj[File.basename(file_name, ".*" )] = JSON.parse(File.read(file_name))
      end

      obj.to_json
    end
  end
end
