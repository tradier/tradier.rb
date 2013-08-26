require 'tradier/api/utils'

module Tradier
  module API
    module Accounts
      include Tradier::API::Utils

      def profile
        object_from_response(Tradier::Profile, :get, '/user/profile', {})
      end
      alias user_profile profile

      def balances(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::Balance, :get, "/accounts/#{account_number}/balances", options)
        else
          object_from_response(Tradier::API::Utils::BalanceCollection, :get, "/user/balances", options).body
        end
      end
      alias balance balances

      def positions(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::API::Utils::Position, :get, "/accounts/#{account_number}/positions", options).body
        else
          object_from_response(Tradier::API::Utils::PositionCollection, :get, '/user/positions', options).body
        end
      end
      alias position positions

      def orders(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::API::Utils::Order, :get, "/accounts/#{account_number}/orders", options).body
        else
          object_from_response(Tradier::API::Utils::OrderCollection, :get, '/user/orders', options).body
        end
      end

      def gainloss(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::API::Utils::Gainloss, :get, "/accounts/#{account_number}/gainloss", options).body
        else
          object_from_response(Tradier::API::Utils::GainlossCollection, :get, '/user/gainloss', options).body
        end
      end

    end
  end
end
