require "fakebook/engine"
require "fakebook/data_injector_middleware"
require "fakebook/cache"
require "fakebook/cache/persist"

module Fakebook

  mattr_accessor :cache_subfolder
  mattr_accessor :turned_off
  
  def self.configure
    yield self
  end
 
  def self.turn_off!
    @@turned_off = true
  end

  def self.turned_off?
    !!@@turned_off
  end 
  
  def self.cache_subfolder
    @@cache_subfolder || ''
  end

  def self.cache_directory=(path)
    Fakebook::Cache.cache_directory = path
  end

end
