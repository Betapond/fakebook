require 'spec_helper'
module Fakebook
  describe CacheController do

    it 'is awseome' do
      post :store, key: 'test', response: 'blaa', use_route: :fakebook 
    end
  end
end
