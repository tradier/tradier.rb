require 'spec_helper'

describe Tradier::Symbol do

  describe '.parse' do
    it 'raises an expection when passed a numeric string' do
      expect { Tradier::Symbol.parse('123') }.to raise_error(ArgumentError)
    end

    it 'raises an expection when passed an unparseable' do
      expect { Tradier::Symbol.parse('#%$@###') }.to raise_error(ArgumentError)
    end

    it 'allows a root symbol to be parsed' do
      symbol = Tradier::Symbol.parse('AAPL')
      expect(symbol).to be_valid
    end
  end

  describe '#description' do
    it 'returns the text description of an option' do
      symbol = Tradier::Symbol.parse('AAPL130622C00280000')
      expect(symbol.description).to eq('AAPL Jun 22 2013 $280.00 CALL')
    end
  end

  describe '#expiration' do
    it 'returns a Date object' do
      symbol = Tradier::Symbol.parse('AAPL130622C00280000')
      expect(symbol.expiration).to be_a(Date)
    end
  end

  describe '#strike_price' do
    it 'returns the strike price as a Fixnum' do
      symbol = Tradier::Symbol.parse('AAPL130622C00280000')
      expect(symbol.strike_price).to eq(280.00)
    end
  end

  describe '#to_s' do
    it 'returns the original symbol' do
      symbol = Tradier::Symbol.parse('AAPL130622C00280000')
      expect(symbol.to_s).to eq('AAPL130622C00280000')
    end
  end

  describe '#underlier' do
    it 'returns the root symbol' do
      symbol = Tradier::Symbol.parse('AAPL130622C00280000')
      expect(symbol.underlier).to eq('AAPL')
    end
  end
end
