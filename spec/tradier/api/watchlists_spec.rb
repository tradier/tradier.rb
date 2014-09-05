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
      expect(status).to be_truthy
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
      expect(status).to be_a Tradier::Watchlist
    end
  end

  describe "#update_watchlist" do
    before do
      stub_put("/v1/watchlists/default").
        to_return(:body => fixture('watchlist.json'), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.update_watchlist('default', :symbols => 'AAPL,GOOG')
      expect(a_put("/v1/watchlists/default")).to have_been_made
    end

    it "returns a 'Tradier::Watchlist' object" do
      status = @client.update_watchlist('default', :symbols => 'AAPL,GOOG')
      expect(status).to be_a Tradier::Watchlist
    end
  end

  describe '#watchlist_item' do
    before do
      stub_get("/v1/watchlists/default/symbols/aapl").
        to_return(:body => fixture('watchlist_item.json'), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.watchlist_item('default', 'aapl')
      expect(a_get("/v1/watchlists/default/symbols/aapl")).to have_been_made
    end

    it "returns a 'Tradier::WatchlistItem' object" do
      status = @client.watchlist_item('default', 'aapl')
      expect(status).to be_a Tradier::WatchlistItem
    end
  end

  describe '#add_watchlist_item' do
    before do
      stub_post("/v1/watchlists/default/symbols").
        to_return(:body => fixture('watchlist_item.json'), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.add_watchlist_item('default', :symbols => 'aapl')
      expect(a_post("/v1/watchlists/default/symbols")).to have_been_made
    end

    it "returns a 'Tradier::Watchlist' object" do
      status = @client.add_watchlist_item('default', :symbols => 'aapl')
      expect(status).to be_a Tradier::WatchlistItem
    end
  end

  describe '#remove_watchlist_item' do
    before do
      stub_delete("/v1/watchlists/default/symbols/aapl").
        to_return(:headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.remove_watchlist_item('default', 'aapl')
      expect(a_delete("/v1/watchlists/default/symbols/aapl")).to have_been_made
    end

    it "returns a 'Tradier::WatchlistItem' object" do
      status = @client.remove_watchlist_item('default', 'aapl')
      expect(status).to be_truthy
    end
  end

  describe '#update_watchlist_item' do
    before do
      stub_put("/v1/watchlists/default/symbols/aapl").
        to_return(:body => fixture('watchlist_item.json'), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.update_watchlist_item('default', 'aapl', :shares => 100)
      expect(a_put("/v1/watchlists/default/symbols/aapl")).to have_been_made
    end

    it "returns a 'Tradier::Watchlist' object" do
      status = @client.update_watchlist_item('default', 'aapl', :shares => 100)
      expect(status).to be_a Tradier::WatchlistItem
    end
  end

end
