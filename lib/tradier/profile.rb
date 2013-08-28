require 'tradier/base'

module Tradier
  class Profile < Tradier::Base

    def name
      @name ||= @attrs[:profile] && @attrs[:profile][:name]
    end

    def accounts
      @accounts ||= @attrs[:profile] && [@attrs[:profile][:account]].flatten.map { |a| puts a.inspect; Tradier::Account.new(a); }
    end
  end
end
