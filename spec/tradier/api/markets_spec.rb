require 'spec_helper'

describe Tradier::API::Markets do

  before do
    @client = Tradier::Client.new
  end

  describe "#quotes" do
    context "when a single symbol passed" do
      before do
        stub_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL"}).to_return(:body => fixture("quote.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.quotes("AAPL")
        expect(a_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL"})).to have_been_made
      end
      it "returns an array of quotes" do
        quotes = @client.quotes("AAPL")
        expect(quotes).to be_an Array
        expect(quotes.size).to eq(1)
        expect(quotes.first).to be_a Tradier::Quote
        expect(quotes.first.symbol).to eq 'AAPL'
      end
    end
    context "when multiple symbols passed as a comma delimited string" do
      before do
        stub_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL,GE"}).to_return(:body => fixture("quotes.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.quotes("AAPL,GE")
        expect(a_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL,GE"})).to have_been_made
      end
      it "returns an array of quotes" do
        quotes = @client.quotes("AAPL,GE")
        expect(quotes).to be_an Array
        expect(quotes.size).to eq(2)
        expect(quotes.first).to be_a Tradier::Quote
        expect(quotes.first.symbol).to eq 'AAPL'
      end
    end

    context "when multiple symbols passed as an array" do
      before do
        stub_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL,GE"}).to_return(:body => fixture("quotes.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.quotes(["AAPL","GE"])
        expect(a_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL,GE"})).to have_been_made
      end
      it "returns an array of quotes" do
        quotes = @client.quotes(["AAPL","GE"])
        expect(quotes).to be_an Array
        expect(quotes.size).to eq(2)
        expect(quotes.first).to be_a Tradier::Quote
        expect(quotes.first.symbol).to eq 'AAPL'
      end
    end
  end

  describe "#chains" do
    before do
      stub_get("/v1/markets/options/chains").with(:query => {:symbol => "AAPL", :month => '6', :year => 2013}).to_return(:body => fixture("chain.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.chains("AAPL", :month => 6, :year => 2013)
      expect(a_get("/v1/markets/options/chains").with(:query => {:symbol => "AAPL", :month => '6', :year => 2013})).to have_been_made
    end
    it "returns an array of quotes" do
      chain = @client.chains("AAPL", :month => 6, :year => 2013)
      expect(chain).to be_an Array
      expect(chain.size).to eq(330)
      expect(chain.first).to be_a Tradier::OptionQuote
      expect(chain.first.symbol).to eq 'AAPL150117C01000000'
    end
  end

  describe "#expirations" do
    before do
      stub_get("/v1/markets/options/expirations").with(:query => {:symbol => "AAPL"}).to_return(:body => fixture("expirations.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.expirations("AAPL")
      expect(a_get("/v1/markets/options/expirations").with(:query => {:symbol => "AAPL"})).to have_been_made
    end
    it "returns an array of dates" do
      expirations = @client.expirations("AAPL")
      expect(expirations).to be_an Array
      expect(expirations.size).to eq(12)
      expect(expirations.first).to be_a Date
    end
  end

  describe "#strikes" do
    before do
      stub_get("/v1/markets/options/strikes").with(:query => {:symbol => "AAPL"}).to_return(:body => fixture("strikes.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.strikes("AAPL")
      expect(a_get("/v1/markets/options/strikes").with(:query => {:symbol => "AAPL"})).to have_been_made
    end
    it "returns an array of strikes" do
      strikes = @client.strikes("AAPL")
      expect(strikes).to be_an Array
      expect(strikes.size).to eq(167)
      expect(strikes.first).to be_a Float
    end
  end

  describe "#option_quotes" do
    before do
      stub_get("/v1/markets/options/quotes").with(:query => {:symbols => "AAPL150117C00440000,AAPL150117C00395000"}).to_return(:body => fixture("option_quotes.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.option_quotes("AAPL150117C00440000,AAPL150117C00395000")
      expect(a_get("/v1/markets/options/quotes").with(:query => {:symbols => "AAPL150117C00440000,AAPL150117C00395000"})).to have_been_made
    end
    it "returns an array of option quotes" do
      quotes = @client.option_quotes("AAPL150117C00440000,AAPL150117C00395000")
      expect(quotes).to be_an Array
      expect(quotes.size).to eq(2)
      expect(quotes.first).to be_a Tradier::OptionQuote
    end
  end

  describe '#clock' do
    before do
      stub_get("/v1/markets/clock").
        to_return(:body => fixture("clock.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.clock
      expect(a_get("/v1/markets/clock")).to have_been_made
    end
    it "returns a clock object" do
      clock = @client.clock
      expect(clock).to be_a Tradier::Clock
    end
  end

end
