require 'tradier/base'

module Tradier
  class Order < Tradier::Base
    attr_reader :id, :order_id, :type, :price, :symbol, :side, :quantity, \
    :status, :time_in_force, :option_type, :exec_inst, :exec_status, :extended_hours, \
    :trailing_limit_type, :trailing_stop_type, :request_date, :response_date, :num_legs, \
    :errors, :result

    def self.from_response(body={})
      new(body[:order])
    end
  end
end
