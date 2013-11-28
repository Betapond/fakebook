require "fakebook/engine"
require "fakebook/data_injector_middleware"
require "fakebook/cache"
require "fakebook/cache/persist"

module Fakebook
  
  
  extend self
  def configure
    yield self
  end

  def cache_directory=(path)
    Fakebook::Cache.cache_directory = path
  end

end
