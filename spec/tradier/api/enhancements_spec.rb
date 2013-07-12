require 'spec_helper'

describe Tradier::API::Enhancements do

  before do
    @client = Tradier::Client.new
  end

  describe '#combined_quote' do
    it 'makes requests to both quote and option_quote endpoints' do
      @client.should_receive(:quotes).with(['AAPL']).and_return(Tradier::Quote.new({}))
      @client.should_receive(:option_quotes).with(['AAPL130622C00280000']).and_return(Tradier::Quote.new({}))

      @client.combined_quote(['AAPL', 'AAPL130622C00280000'])
    end

    it 'makes requests to quotes when no option symbols are requested' do
      @client.should_receive(:quotes).with(['AAPL','GE']).and_return(Tradier::Quote.new({}))
      @client.should_not_receive(:option_quotes)

      @client.combined_quote(['AAPL', 'GE'])
    end

    it 'returns an array of Tradier::Quote and Tradier::OptionQuote' do
      stub_get("/v1/markets/quotes").
        with(:query => {:symbols => "AAPL"}).
        to_return(:body => fixture("quote.json"), :headers => {:content_type => "application/json; charset=utf-8"})

      stub_get("/v1/markets/options/quotes").
        with(:query => {:symbols => "AAPL130622C00280000"}).
        to_return(:body => fixture("option_quotes.json"), :headers => {:content_type => "application/json; charset=utf-8"})


      results = @client.combined_quote(['AAPL', 'AAPL130622C00280000'])

      expect(results).to be_an Array
      expect(results.first).to be_a Tradier::Quote
      expect(results[1]).to be_a Tradier::OptionQuote
    end
  end
end
