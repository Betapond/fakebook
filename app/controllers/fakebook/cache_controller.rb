module Fakebook
  class CacheController < ApplicationController

    def store
      item = Cache::Persist.new(params[:url], params[:response]) 
      item.save

      render nothing: true    
    end
  end
end
