require 'tradier/base'

module Tradier
  class BaseCollection < Tradier::Base
    include Enumerable

  end
end
