require 'spec_helper'
module Fakebook
  describe CacheController do

    it 'is awseome' do
      post :store, url: 'test', response: 'blaa', use_route: :fakebook 
    end
  end
end
