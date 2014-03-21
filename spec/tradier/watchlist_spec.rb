require 'spec_helper'

describe Tradier::Watchlist do
  describe '#id' do
    it "returns the id when set" do
      watchlist = Tradier::Watchlist.new({ :id => 'default' })
      expect(watchlist.id).to eq('default')
    end
    it "returns nil when id is not set" do
      watchlist = Tradier::Watchlist.new({ :name => 'Default' })
      expect(watchlist.id).to be_nil
    end
  end

  describe '#name' do
    it "returns the name when set" do
      watchlist = Tradier::Watchlist.new({ :name => 'Default' })
      expect(watchlist.name).to eq('Default')
    end
    it "returns nil when name is not set" do
      watchlist = Tradier::Watchlist.new({ :id => 'default' })
      expect(watchlist.name).to be_nil
    end
  end

  describe '#items' do
    it "returns an array of watchlist items" do
      response = {:items => { :item => [{:symbol => 'AAPL'}, { :symbol => 'GE'}]}}
      watchlist = Tradier::Watchlist.new(response)
      expect(watchlist.items).to be_an Array
      expect(watchlist.items.size).to eq(2)
      expect(watchlist.items.first).to be_a Tradier::WatchlistItem
    end

    it "returns an array of watchlist items" do
      response = {:items => { :item => {:symbol => 'AAPL'}}}
      watchlist = Tradier::Watchlist.new(response)
      expect(watchlist.items).to be_an Array
      expect(watchlist.items.size).to eq(1)
      expect(watchlist.items.first).to be_a Tradier::WatchlistItem
    end
  end
end
