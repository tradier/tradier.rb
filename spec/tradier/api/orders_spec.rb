require 'spec_helper'

describe Tradier::API::Accounts do

  before do
    @client = Tradier::Client.new
  end

  describe '#create_order' do
    context 'when passed an account number' do
      before do
        stub_post("/v1/accounts/123456789/orders").
          to_return(:body => fixture("order.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.create_order(:account => 123456789)
        expect(a_post("/v1/accounts/123456789/orders")).to have_been_made
      end
      it "returns a Tradier::Order" do
        order = @client.create_order(:account => 123456789)
        expect(order).to be_a Tradier::Order
      end
    end
  end

  describe '#preview_order' do
    context 'when passed an account number' do
      before do
        stub_post("/v1/accounts/123456789/orders").
          to_return(:body => fixture("order.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.preview_order(:account => 123456789)
        expect(a_post("/v1/accounts/123456789/orders").with(body: 'preview=true')).to have_been_made
      end
      it "returns a Tradier::Order" do
        order = @client.preview_order(:account => 123456789)
        expect(order).to be_a Tradier::Order
      end
    end
  end

end
