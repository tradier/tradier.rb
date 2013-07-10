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
    it 'returns true when the option is a put' do
      quote = Tradier::OptionQuote.new(:symbol => 'AAPL150117P01000000')
      expect(quote.put?).to be_true
    end

    it 'returns false when the option is a call' do
      quote = Tradier::OptionQuote.new(:symbol => 'AAPL150117C01000000')
      expect(quote.put?).to be_false
    end
  end

  describe '#call?' do
    it 'returns true when the option is a call' do
      quote = Tradier::OptionQuote.new(:symbol => 'AAPL150117C01000000')
      expect(quote.call?).to be_true
    end

    it 'returns false when the option is a call' do
      quote = Tradier::OptionQuote.new(:symbol => 'AAPL150117P01000000')
      expect(quote.call?).to be_false
    end
  end

  describe '#expiration_date' do
    it "returns the expiration_date when set" do
      quote = Tradier::OptionQuote.new(:expiration_date => '2013-07-04')
      expect(quote.expiration_date).to be_a Date
      expect(quote.expiration_date.to_s).to eq('2013-07-04')
    end
    it "returns nil when expirationdate is not set" do
      quote = Tradier::OptionQuote.new(:symbol => 'AAPL150117P01000000')
      expect(quote.expiration_date).to be_nil
    end
  end

  describe '#underlier' do
    it 'returns the underlying symbol for the option' do
      quote = Tradier::OptionQuote.new(:symbol => 'AAPL150117C01000000')
      expect(quote.underlier).to eq('AAPL')
    end
  end

end
