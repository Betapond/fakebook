require 'spec_helper'

module Fakebook
  describe Cache::Persist do
    

    it 'saves the item' do
      item = Cache::Persist.new('me_fields_name', { :name => 'Jordan Rogers-Smith', id: 123456789 })
      item.save
      expect(Dir[@directory].empty?).to be false
    end 
    
    it 'give subdirectory saves there' do
      Fakebook.cache_subfolder = 'example'
      item = Cache::Persist.new('me_fields_name', { :name => 'Jordan Rogers-Smith', id: 123456789 })
      item.save
      expect(Dir["#{@directory}/example/"].empty?).to be false

      Fakebook.cache_subfolder = '' 
    end    
  end
end

