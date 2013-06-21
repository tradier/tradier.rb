require 'tradier/balance'
require 'tradier/balance_collection'
require 'tradier/calendar'
require 'tradier/clock'
require 'tradier/history'
require 'tradier/option_quote'
require 'tradier/order'
require 'tradier/position'
require 'tradier/position_collection'
require 'tradier/quote'
require 'tradier/timesales'

module Tradier
  module API
    module Utils

      private

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def quote_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response_body[:quotes][:quote])
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def option_quote_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response_body[:options][:option])
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def expiration_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        date_objects_from_array(klass, response_body[:expirations][:date])
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def date_objects_from_array(klass, response)
        response.map do |element|
          Date.parse(element)
        end
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def strike_objects_from_response(request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        response_body[:strikes][:strike]
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def timesales_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response_body[:series][:data])
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def history_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response_body[:history][:day])
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def balance_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response_body[:balances][:balance])
      end

      def balance_object_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        klass.new(response_body[:balances][:balance])
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def position_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response_body[:positions][:position])
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def order_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response_body[:orders][:order])
      end

      def collection_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response_body[:accounts][:account])
      end

      def object_from_response(klass, request_method, path, options)
        response_body = send(request_method.to_sym, path, options)[:body]
        klass.new(response_body)
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def objects_from_array(klass, response)
        if response.is_a?(Array)
          response.map do |element|
            klass.new(element)
          end
        else
          [klass.new(response)]
        end
      end

    end
  end
end
