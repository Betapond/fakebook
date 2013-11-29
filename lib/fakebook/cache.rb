require 'json'

module Fakebook
  module Cache
    mattr_accessor :cache_directory

    def self.cache_directory
      @@cache_directory || 'spec/fakebook_cache'
    end

    def self.dump_to_json
      obj = {}
      current_dir = File.join(cache_directory, Fakebook.cache_subfolder)
      Dir.glob("#{current_dir}/*.json") do |file_name|
        obj[File.basename(file_name, ".*" )] = JSON.parse(ActiveSupport::JSON.decode(File.read(file_name)))
      end

      obj.to_json
    end
  end
end
