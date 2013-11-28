require 'spec_helper'

module Fakebook
  describe 'Fakebook' do
    describe '#configure' do
      before (:each) do
        Fakebook.configure do |c|
          c.cache_directory = 'spec/fakebook_cache_different'
        end
      end

      it 'sets the cache directory' do
        expect(Fakebook::Cache.cache_directory).to eq 'spec/fakebook_cache_different'
      end
    end
  end

end 
