require "fakebook/engine"
require "fakebook/cache"

module Fakebook
  mattr_accessor :cache_directory
  
  extend self
  def configure
    yield self
  end

  

end
