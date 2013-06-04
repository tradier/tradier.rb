require 'spec_helper'

describe Tradier::Client do

  subject do
    Tradier::Client.new(:access_token => "AT")
  end

  context "with module configuration" do

    before do
      Tradier.configure do |config|
        Tradier::Configurable.keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Tradier.reset!
    end

    it "inherits the module configuration" do
      client = Tradier::Client.new
      Tradier::Configurable.keys.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq key
      end
    end

    context "with class configuration" do

      before do
        @configuration = {
          :connection_options => {:timeout => 10},
          :access_token => "AT",
          :endpoint => 'https://api.tradierbrokerage.com/',
          :middleware => Proc.new{},
          :version => 'v2'
        }
      end

      context "during initialization" do
        it "overrides the module configuration" do
          client = Tradier::Client.new(@configuration)
          Tradier::Configurable.keys.each do |key|
            expect(client.instance_variable_get(:"@#{key}")).to eq @configuration[key]
          end
        end
      end

      context "after initialization" do
        it "overrides the module configuration after initialization" do
          client = Tradier::Client.new
          client.configure do |config|
            @configuration.each do |key, value|
              config.send("#{key}=", value)
            end
          end
          Tradier::Configurable.keys.each do |key|
            expect(client.instance_variable_get(:"@#{key}")).to eq @configuration[key]
          end
        end
      end

    end
  end

  describe "#delete" do
    before do
      stub_delete("/v1/custom/delete").with(:query => {:deleted => "object"})
    end
    it "allows custom delete requests" do
      subject.delete("/custom/delete", {:deleted => "object"})
      expect(a_delete("/v1/custom/delete").with(:query => {:deleted => "object"})).to have_been_made
    end
  end

  describe "#put" do
    before do
      stub_put("/v1/custom/put").with(:body => {:updated => "object"})
    end
    it "allows custom put requests" do
      subject.put("/custom/put", {:updated => "object"})
      expect(a_put("/v1/custom/put").with(:body => {:updated => "object"})).to have_been_made
    end
  end

  describe "#credentials?" do
    it "returns true if all credentials are present" do
      client = Tradier::Client.new(:access_token => "AT")
      expect(client.credentials?).to be_true
    end
    it "returns false if any credentials are missing" do
      client = Tradier::Client.new
      expect(client.credentials?).to be_false
    end
  end

  describe "#connection" do
    it "looks like Faraday connection" do
      expect(subject.send(:connection)).to respond_to(:run_request)
    end
    it "memoizes the connection" do
      c1, c2 = subject.send(:connection), subject.send(:connection)
      expect(c1.object_id).to eq c2.object_id
    end
  end

  describe "#request" do
    it "encodes the entire body when no uploaded media is present" do
      stub_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL"}).to_return(:body => fixture("quote.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      subject.quotes("AAPL")
      expect(a_get("/v1/markets/quotes").with(:query => {:symbols => "AAPL"})).to have_been_made
    end
    it "catches Faraday errors" do
      subject.stub!(:connection).and_raise(Faraday::Error::ClientError.new("Oops"))
      expect{subject.send(:request, :get, "/path")}.to raise_error Tradier::Error::ClientError
    end
    it "catches MultiJson::DecodeError errors" do
      subject.stub!(:connection).and_raise(MultiJson::DecodeError.new("unexpected token", [], "<!DOCTYPE html>"))
      expect{subject.send(:request, :get, "/path")}.to raise_error Tradier::Error::DecodeError
    end
  end

end
