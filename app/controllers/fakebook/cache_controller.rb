class Fakebook::CacheController < ApplicationController

  def store
    url = params[:url]
    response = params[:response]
    
    render nothing: true    
  end
end
