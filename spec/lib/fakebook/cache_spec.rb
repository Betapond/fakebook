require 'spec_helper'

module Fakebook
  describe Cache do
    describe '#dump_to_json' do
      
      before :each do
        Cache::Persist.new('me_key_fun', {valid: "json", more: "fun"}.to_json).save
        Cache::Persist.new('ye_key_foo', {more_valid: "json", even_more: "fun"}.to_json).save
      end

      it 'dumps the json correctly' do
        expect(Cache.dump_to_json).to eq '{"me_key_fun":{"valid":"json","more":"fun"},"ye_key_foo":{"more_valid":"json","even_more":"fun"}}'
      end
    end 
  end
end
