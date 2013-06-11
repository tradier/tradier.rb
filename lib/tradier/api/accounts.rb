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

    end
  end
end
