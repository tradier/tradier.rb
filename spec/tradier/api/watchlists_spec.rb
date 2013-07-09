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

  describe "#watchlist" do
    before do
      stub_get("/v1/watchlists/default").
        to_return(:body => fixture("watchlist.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.watchlist('default')
      expect(a_get("/v1/watchlists/default")).to have_been_made
    end

    it "returns a 'Tradier::Watchlist' object" do
      watchlist = @client.watchlist('default')
      expect(watchlist).to be_a Tradier::Watchlist
    end
  end

  describe "#delete_watchlist" do
    before do
      stub_delete("/v1/watchlists/default").
        to_return(:body => '', :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.delete_watchlist('default')
      expect(a_delete("/v1/watchlists/default")).to have_been_made
    end

    it "returns a 'Tradier::Watchlist' object" do
      status = @client.delete_watchlist('default')
      expect(status).to be_true
    end
  end

  describe "#create_watchlist" do
    before do
      stub_post("/v1/watchlists").
        to_return(:body => fixture('watchlist.json'), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.create_watchlist(:name => 'default')
      expect(a_post("/v1/watchlists")).to have_been_made
    end

    it "returns a 'Tradier::Watchlist' object" do
      status = @client.create_watchlist(:name => 'default')
      expect(status).to be_true
    end
  end

end
