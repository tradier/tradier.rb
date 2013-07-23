require 'tradier/account'
require 'tradier/balance'
require 'tradier/balance_collection'
require 'tradier/calendar'
require 'tradier/clock'
require 'tradier/gainloss_collection'
require 'tradier/history'
require 'tradier/option_quote'
require 'tradier/order'
require 'tradier/position'
require 'tradier/position_collection'
require 'tradier/profile'
require 'tradier/quote'
require 'tradier/timesales'
require 'tradier/watchlist'

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
        nested_objects_from_response(klass, request_method, path, [:quotes, :quote], options)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def option_quote_objects_from_response(klass, request_method, path, options={})
        nested_objects_from_response(klass, request_method, path, [:options, :option], options)
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
        nested_objects_from_response(klass, request_method, path, [:series, :data], options)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def history_objects_from_response(klass, request_method, path, options={})
        nested_objects_from_response(klass, request_method, path, [:history, :day], options)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def balance_objects_from_response(klass, request_method, path, options={})
        nested_objects_from_response(klass, request_method, path, [:balances, :balance], options)
      end

      def balance_object_from_response(klass, request_method, path, options={})
        nested_object_from_response(klass, request_method, path, [:balances, :balance], options)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def position_objects_from_response(klass, request_method, path, options={})
        nested_objects_from_response(klass, request_method, path, [:positions, :position], options)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def closed_position_objects_from_response(klass, request_method, path, options={})
        nested_objects_from_response(klass, request_method, path, [:gainloss, :closed_position], options)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def order_objects_from_response(klass, request_method, path, options={})
        nested_objects_from_response(klass, request_method, path, [:orders, :order], options)
      end

      def collection_objects_from_response(klass, request_method, path, options={})
        nested_objects_from_response(klass, request_method, path, [:accounts, :account], options)
      end

      def watchlist_objects_from_response(klass, request_method, path, options)
        nested_objects_from_response(klass, request_method, path, [:watchlists, :watchlist], options)
      end

      def watchlist_object_from_response(klass, request_method, path, options={})
        nested_object_from_response(klass, request_method, path, [:watchlist], options)
      end

      def watchlist_item_object_from_response(klass, request_method, path, options={})
        nested_object_from_response(klass, request_method, path, [:item], options)
      end

      def nested_object_from_response(klass, request_method, path, body_path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        klass.new(nested_response_body(response_body, body_path))
      end

      def nested_objects_from_response(klass, request_method, path, body_path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, nested_response_body(response_body, body_path))
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

      def nested_response_body(body, path)
        path.each do |p|
          body = body[p]
        end

        body
      end

    end
  end
end
