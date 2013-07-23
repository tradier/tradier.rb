require 'tradier/api/utils'

module Tradier
  module API
    module Accounts
      include Tradier::API::Utils

      def profile
        object_from_response(Tradier::Profile, :get, '/user/profile', {})
      end
      alias user_profile profile

      def balances(account_number=nil)
        if account_number
          balance_object_from_response(Tradier::Balance, :get, "/accounts/#{account_number}/balances")
        else
          collection_objects_from_response(Tradier::BalanceCollection, :get, "/user/balances")
        end
      end
      alias balance balances

      def positions(account_number=nil)
        if account_number
          position_objects_from_response(Tradier::Position, :get, "/accounts/#{account_number}/positions")
        else
          collection_objects_from_response(Tradier::PositionCollection, :get, '/user/positions')
        end
      end
      alias position positions

      def orders(account_number=nil)
        if account_number
          order_objects_from_response(Tradier::Order, :get, "/accounts/#{account_number}/orders")
        else
          collection_objects_from_response(Tradier::OrderCollection, :get, '/user/orders')
        end
      end

      def gainloss(account_number=nil)
        if account_number
          closed_position_objects_from_response(Tradier::Position, :get, "/accounts/#{account_number}/gainloss")
        else
          collection_objects_from_response(Tradier::GainlossCollection, :get, '/user/gainloss')
        end
      end

    end
  end
end
