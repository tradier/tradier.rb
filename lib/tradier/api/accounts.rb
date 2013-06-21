require 'tradier/api/utils'

module Tradier
  module API
    module Accounts
      include Tradier::API::Utils

      def balances(account_number=nil)
        if account_number
          balance_object_from_response(Tradier::Balance, :get, "/accounts/#{account_number}/balances")
        else
          balance_objects_from_response(Tradier::Balance, :get, "/user/balances")
        end
      end
      alias balance balances

      def positions(account_number=nil)
        if account_number
          position_objects_from_response(Tradier::Position, :get, "/accounts/#{account_number}/positions")
        else
          position_collection_objects_from_response(Tradier::PositionCollection, :get, '/user/positions')
        end
      end
      alias position positions

    end
  end
end
