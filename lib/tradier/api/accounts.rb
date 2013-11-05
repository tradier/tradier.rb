require 'tradier/api/utils'

module Tradier
  module API
    module Accounts
      include Tradier::API::Utils

      # @see https://developer.tradier.com/documentation/user/get-profile
      # @rate_limited Yes
      # @authentication Requires user context
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Tradier::Profile] The user's profile.
      def profile
        object_from_response(Tradier::Profile, :get, '/user/profile', {})
      end
      alias user_profile profile

      # @see https://developer.tradier.com/documentation/user/get-balances
      # @see https://developer.tradier.com/documentation/accounts/get-account-balance
      # @rate_limited Yes
      # @authentication Requires user context
      # @overload balances
      #   Request a user's balances.
      #   @return [Array<Tradier::Balance>] An array of balances.
      # @overload balances(account_number)
      #   Request an individual account's balance.
      #   @param [String] account_number An account number.
      #   @return [Tradier::Balance] The account balance object when a single account is requested.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def balances(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::Balance, :get, "/accounts/#{account_number}/balances", options)
        else
          object_from_response(Tradier::API::Utils::Balance, :get, "/user/balances", options).body
        end
      end
      alias balance balances

      # @see https://developer.tradier.com/documentation/user/get-positions
      # @see https://developer.tradier.com/documentation/accounts/get-account-positions
      # @rate_limited Yes
      # @authentication Requires user context
      # @overload positions
      #   Request a user's positions.
      #   @return [Array<Tradier::Account>] An array of accounts with positions.
      # @overload positions(account_number)
      #   Request an individual account's positions.
      #   @param [String] account_number An account number.
      #   @return [Array<Tradier::Position>] An array of [Tradier::Position] objects for a given account.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def positions(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::API::Utils::Position, :get, "/accounts/#{account_number}/positions", options).body
        else
          object_from_response(Tradier::API::Utils::Account, :get, '/user/positions', options).body
        end
      end
      alias position positions

      # @see https://developer.tradier.com/documentation/user/get-orders
      # @see https://developer.tradier.com/documentation/accounts/get-account-orders
      # @rate_limited Yes
      # @authentication Requires user context
      # @overload orders
      #   Request a user's orders.
      #   @return [Array<Tradier::Account>] An array of accounts with orders.
      # @overload orders(account_number)
      #   Request a specific account's orders.
      #   @param [String] account_number An account number (optional).
      #   @return [Array<Tradier::Order>] An array of [Tradier::Order] objects for a given account.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def orders(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::API::Utils::Order, :get, "/accounts/#{account_number}/orders", options).body
        else
          object_from_response(Tradier::API::Utils::Account, :get, '/user/orders', options).body
        end
      end

      # @see https://developer.tradier.com/documentation/user/get-gainloss
      # @see https://developer.tradier.com/documentation/accounts/get-account-gainloss
      # @rate_limited Yes
      # @authentication Requires user context
      # @overload gainloss
      #   Request a user's cost basis.
      #   @return [Array<Tradier::Account>] An array of accounts with cost-basis.
      # @overload gainloss(account_number)
      #   Request a specific account's cost basis.
      #   @param [String] account_number An account number (optional).
      #   @return [Array<Tradier::Position>] An array of [Tradier::Position] objects for a given account.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def gainloss(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::API::Utils::Gainloss, :get, "/accounts/#{account_number}/gainloss", options).body
        else
          object_from_response(Tradier::API::Utils::Account, :get, '/user/gainloss', options).body
        end
      end

      # @see https://developer.tradier.com/documentation/user/get-history
      # @see https://developer.tradier.com/documentation/accounts/get-account-history
      # @rate_limited Yes
      # @authentication Requires user context
      # @overload events
      #   Request a user's events.
      #   @return [Array<Tradier::Account>] An array of accounts with history.
      # @overload events(account_number)
      #   Request a specific account's events.
      #   @param [String] account_number An account number (optional).
      #   @return [Array<Tradier::Event>] An array of [Tradier::Event] objects for a given account.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def events(account_number=nil, options={})
        if account_number
          object_from_response(Tradier::API::Utils::Event, :get, "/accounts/#{account_number}/history", options).body
        else
          object_from_response(Tradier::API::Utils::Account, :get, '/user/history', options).body
        end
      end

    end
  end
end
