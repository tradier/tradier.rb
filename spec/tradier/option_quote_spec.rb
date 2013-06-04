require 'spec_helper'

describe Tradier::OptionQuote do

  describe "#==" do
    it "returns true when objects symbols are the same" do
      quote = Tradier::OptionQuote.new(:symbol => 'AAPL150117C01000000')
      other = Tradier::OptionQuote.new(:symbol => 'AAPL150117C01000000')
      expect(quote == other).to be_true
    end
    it "returns false when objects IDs are different" do
      quote = Tradier::OptionQuote.new(:symbol => 'AAPL150117C01000000')
      other = Tradier::OptionQuote.new(:symbol => 'AAPL150117P01000000')
      expect(quote == other).to be_false
    end
  end

  describe '#put?' do
    pending
  end

  describe '#call?' do
    pending
  end

  describe '#expiration' do
    pending
  end

  describe '#underlier' do
    pending
  end

end
