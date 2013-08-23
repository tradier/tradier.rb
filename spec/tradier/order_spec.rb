require 'spec_helper'

describe Tradier::Order do
  describe '.from_response' do
    context 'new order' do
      let(:response) { MultiJson.decode(fixture('placed_order.json'), :symbolize_keys => true) }
      let(:order) { Tradier::Order.from_response(response) }

      it 'populates the order id' do
        expect(order.id).to eq(2038)
      end

      it 'populates the order status' do
        expect(order.status).to eq('OK')
      end
    end

    context 'previewed order' do
      let(:response) { MultiJson.decode(fixture('order_with_warnings.json'), :symbolize_keys => true) }
      let(:order) { Tradier::Order.from_response(response) }

      it 'populates the order side' do
        expect(order.side).to eq('Buy')
      end

      it 'populates the order status' do
        expect(order.status).to eq('Bad Request')
      end

      it 'populates the order symbol' do
        expect(order.symbol).to eq('AAPL')
      end

      it 'populates the order time_in_force' do
        expect(order.time_in_force).to eq('Day')
      end

      it 'populates the order type' do
        expect(order.type).to eq('Market')
      end
    end
  end
end
