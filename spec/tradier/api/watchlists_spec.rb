require 'spec_helper'

describe Tradier::API::Watchlists do

  before do
    @client = Tradier::Client.new
  end

  describe "#watchlists" do
    before do
      stub_get("/v1/watchlists").
        to_return(:body => fixture("watchlists.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.watchlists
      expect(a_get("/v1/watchlists")).to have_been_made
    end

    it "returns an array of 'Tradier::Watchlist' objects" do
      watchlists = @client.watchlists
      expect(watchlists).to be_an Array
      expect(watchlists.size).to eq(3)
      expect(watchlists.first).to be_a Tradier::Watchlist
    end
  end

end
