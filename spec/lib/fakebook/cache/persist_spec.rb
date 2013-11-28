require 'spec_helper'

module Fakebook
  describe Cache::Persist do
    
    before :each do
      FileUtils.rm_rf Rails.root.join(Fakebook::Cache.cache_directory)
    end
     
    it 'exists' do
      
    end 
    
  end
end

