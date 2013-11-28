require 'spec_helper'

module Fakebook
  describe Cache::Persist do
    
    before :each do
      Fakebook::Cache.cache_directory = 'spec/fakebook_cache'
      @directory = Rails.root.join('..', '..', Fakebook::Cache.cache_directory)

      FileUtils.rm_rf @directory
    end
     
    it 'saves the item' do
      item = Cache::Persist.new('me_fields_name', { :name => 'Jordan Rogers-Smith', id: 123456789 })
      item.save
      expect(Dir[@directory].empty?).to be false
    end 
    
  end
end

