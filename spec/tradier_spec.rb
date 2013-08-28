require 'spec_helper'

describe Tradier do

  after do
    Tradier.reset!
  end

  context "when delegating to a client" do

    before do
      stub_get("/v1/markets/quotes").
        with(:query => {:symbols => "AAPL"}).
        to_return(:body => fixture("quote.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      Tradier.quotes('AAPL')
      expect(a_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL"})).to have_been_made
    end

    it "returns the same results as a client" do
      expect(Tradier.quotes('AAPL')).to eq Tradier::Client.new.quotes('AAPL')
    end

  end

  describe ".respond_to?" do
    it "delegates to Tradier::Client" do
      expect(Tradier.respond_to?(:quotes)).to be_true
    end
    it "takes an optional argument" do
      expect(Tradier.respond_to?(:quotes, true)).to be_true
    end
  end

  describe ".client" do
    it "returns a Tradier::Client" do
      expect(Tradier.client).to be_a Tradier::Client
    end

    context "when the options don't change" do
      it "caches the client" do
        expect(Tradier.client).to eq Tradier.client
      end
    end
    context "when the options change" do
      it "busts the cache" do
        client1 = Tradier.client
        Tradier.configure do |config|
          config.access_token = 'abc'
        end
        client2 = Tradier.client
        expect(client1).not_to eq client2
      end
    end
  end

  describe ".configure" do
    Tradier::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        Tradier.configure do |config|
          config.send("#{key}=", key)
        end
        expect(Tradier.instance_variable_get(:"@#{key}")).to eq key
      end
    end

    context "when invalid credentials are provided" do
      it "raises a ConfigurationError exception" do
        expect {
          Tradier.configure do |config|
            config.access_token = [12345, 54321]
          end
        }.to raise_error
      end
    end

    context "when no credentials are provided" do
      it "does not raise an exception" do
        expect {
          Tradier.configure do |config|
            config.access_token = nil
          end
        }.to_not raise_error
      end
    end
  end

  describe ".credentials?" do
    it "returns true if all oauth credentials are present" do
      Tradier.configure do |config|
        config.access_token = 'OT'
      end
      expect(Tradier.credentials?).to be_true
    end
    it "returns false if any credentials are missing" do
      Tradier.configure do |config|
        config.version = 'v2'
      end
      expect(Tradier.credentials?).to be_false
    end
  end

end
