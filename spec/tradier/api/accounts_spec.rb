require 'spec_helper'

describe Tradier::API::Accounts do

  before do
    @client = Tradier::Client.new
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

end
