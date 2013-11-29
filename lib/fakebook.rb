require "fakebook/engine"
require "fakebook/data_injector_middleware"
require "fakebook/cache"
require "fakebook/cache/persist"

module Fakebook

  mattr_accessor :cache_subfolder
  
  def self.configure
    yield self
  end
  
  def self.cache_subfolder
    @@cache_subfolder || ''
  end

  def self.cache_directory=(path)
    Fakebook::Cache.cache_directory = path
  end

end
