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

  describe '#cancel_order' do
    context 'when passed an account number' do
      before do
        stub_delete("/v1/accounts/123456789/orders/54321").
          to_return(:body => fixture("order.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.cancel_order(:account => 123456789, :id => 54321)
        expect(a_delete("/v1/accounts/123456789/orders/54321")).to have_been_made
      end
      it "returns a Tradier::Order" do
        order = @client.cancel_order(:account => 123456789, :id => 54321)
        expect(order).to be_a Tradier::Order
      end
    end
  end

  describe '#order' do
    context 'when passed an account number' do
      before do
        stub_get("/v1/accounts/123456789/orders/54321").
          to_return(:body => fixture("order.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.order(:account => 123456789, :id => 54321)
        expect(a_get("/v1/accounts/123456789/orders/54321")).to have_been_made
      end
      it "returns a Tradier::Order" do
        order = @client.order(:account => 123456789, :id => 54321)
        expect(order).to be_a Tradier::Order
      end
    end
  end

  describe '#update_order' do
    context 'when passed an account number' do
      before do
        stub_put("/v1/accounts/123456789/orders/54321").
          to_return(:body => fixture("order.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.update_order(:account => 123456789, :id => 54321, :price => 4.00)
        expect(a_put("/v1/accounts/123456789/orders/54321")).to have_been_made
      end
      it "returns a Tradier::Order" do
        order = @client.update_order(:account => 123456789, :id => 54321, :price => 4.00)
        expect(order).to be_a Tradier::Order
      end
    end
  end

end
