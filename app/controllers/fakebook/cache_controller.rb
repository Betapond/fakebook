module Fakebook
  class CacheController < ApplicationController

    def store
      item = Cache::Persist.new(params[:key], params[:response]) 
      item.save

      render nothing: true    
    end
  end
end
