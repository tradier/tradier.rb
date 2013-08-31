require 'spec_helper'

describe Tradier::API::Accounts do

  before do
    @client = Tradier::Client.new
  end

  describe '#profile' do
    context 'when passed an account number' do
      before do
        stub_get("/v1/user/profile").
          to_return(:body => fixture("user_profile.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.profile
        expect(a_get("/v1/user/profile")).to have_been_made
      end
      it "returns a Tradier::Profile" do
        profile = @client.profile
        expect(profile).to be_a Tradier::Profile
      end
    end
  end

  describe '#balances' do
    context 'when passed an account number' do
      before do
        stub_get("/v1/accounts/123456789/balances").
          to_return(:body => fixture("account_balances.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.balances("123456789")
        expect(a_get("/v1/accounts/123456789/balances")).to have_been_made
      end
      it "returns a Tradier::Balance object" do
        balance = @client.balances("123456789")
        expect(balance).to be_a Tradier::Balance
      end

      it "has populated attributes" do
        balance = @client.balances("123456789")
        expect(balance.attrs).to_not be_nil
      end
    end
    context 'when no account number' do
      before do
        stub_get("/v1/user/balances").
          to_return(:body => fixture("user_balances.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.balances
        expect(a_get("/v1/user/balances")).to have_been_made
      end
      it "returns an array of Tradier::Balance objects" do
        balances = @client.balances
        expect(balances).to be_an Array
        expect(balances.first).to be_a Tradier::Balance
      end
    end
  end

  describe '#positions' do
    context 'when passed an account number' do
      before do
        stub_get("/v1/accounts/123456789/positions").
          to_return(:body => fixture("account_positions.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.positions("123456789")
        expect(a_get("/v1/accounts/123456789/positions")).to have_been_made
      end
      it "returns a Tradier::Position" do
        positions = @client.positions("123456789")
        expect(positions).to be_an Array
        expect(positions.first).to be_a Tradier::Position
      end
    end
    context 'when no account number' do
      before do
        stub_get("/v1/user/positions").
          to_return(:body => fixture("user_positions.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.positions
        expect(a_get("/v1/user/positions")).to have_been_made
      end
      it "returns an array of Tradier::Position" do
        positions = @client.positions
        expect(positions).to be_an Array
        expect(positions.first).to be_a Tradier::Account
      end
    end
  end

  describe '#orders' do
    context 'when passed an account number' do
      before do
        stub_get("/v1/accounts/123456789/orders").
          to_return(:body => fixture("account_orders.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.orders("123456789")
        expect(a_get("/v1/accounts/123456789/orders")).to have_been_made
      end
      it "returns a Tradier::Order" do
        orders = @client.orders("123456789")
        expect(orders).to be_an Array
        expect(orders.first).to be_a Tradier::Order
      end
    end
    context 'when no account number' do
      before do
        stub_get("/v1/user/orders").
          to_return(:body => fixture("user_orders.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.orders
        expect(a_get("/v1/user/orders")).to have_been_made
      end
      it "returns an array of Tradier::Order" do
        orders = @client.orders
        expect(orders).to be_an Array
        expect(orders.first).to be_a Tradier::Account
      end
    end
  end

  describe '#gainloss' do
    context 'when passed an account number' do
      before do
        stub_get("/v1/accounts/123456789/gainloss").
          to_return(:body => fixture("account_gainloss.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.gainloss("123456789")
        expect(a_get("/v1/accounts/123456789/gainloss")).to have_been_made
      end
      it "returns an array of Tradier::Position" do
        gainloss = @client.gainloss("123456789")
        expect(gainloss).to be_an Array
        expect(gainloss.first).to be_a Tradier::Position
      end
    end
    context 'when no account number' do
      before do
        stub_get("/v1/user/gainloss").
          to_return(:body => fixture("user_gainloss.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.gainloss
        expect(a_get("/v1/user/gainloss")).to have_been_made
      end
      it "returns an array of Tradier::Position" do
        gainloss = @client.gainloss
        expect(gainloss).to be_an Array
        expect(gainloss.first).to be_a Tradier::Account
      end
    end
  end

end
