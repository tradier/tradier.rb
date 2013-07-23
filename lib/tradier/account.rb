require 'tradier/base'

module Tradier
  class Account < Tradier::Base
    attr_reader :account_number, :type

    def margin?
      type.downcase == 'margin'
    end

    def cash?
      type.downcase == 'cash'
    end
  end
end
