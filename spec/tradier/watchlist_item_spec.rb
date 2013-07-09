require 'spec_helper'

describe Tradier::WatchlistItem do
  describe '#symbol' do
    it "returns the symbol when set" do
      item = Tradier::WatchlistItem.new({ :symbol => 'AAPL' })
      expect(item.symbol).to eq('AAPL')
    end
    it "returns nil when symbol is not set" do
      item = Tradier::WatchlistItem.new({ :price => 1.00 })
      expect(item.symbol).to be_nil
    end
  end

  describe '#shares' do
    it "returns the shares when set" do
      item = Tradier::WatchlistItem.new({ :shares => 100 })
      expect(item.shares).to eq(100)
    end
    it "returns nil when shares is not set" do
      item = Tradier::WatchlistItem.new({ :symbol => 'AAPL' })
      expect(item.shares).to be_nil
    end
  end

  describe '#purchase_price' do
    it "returns the purchase_price when set" do
      item = Tradier::WatchlistItem.new({ :purchase_price => 100 })
      expect(item.purchase_price).to eq(100)
    end
    it "returns nil when purchase_price is not set" do
      item = Tradier::WatchlistItem.new({ :symbol => 'AAPL' })
      expect(item.purchase_price).to be_nil
    end
  end

  describe "#purchase_date" do
    it "returns the purchase_date when set" do
      clock = Tradier::WatchlistItem.new({ :purchase_date => '2013-07-04' })
      expect(clock.purchase_date).to be_a Date
      expect(clock.purchase_date.to_s).to eq('2013-07-04')
    end
    it "returns nil when purchase_date is not set" do
      clock = Tradier::WatchlistItem.new({ :symbol => 'AAPL' })
      expect(clock.purchase_date).to be_nil
    end
  end
end
