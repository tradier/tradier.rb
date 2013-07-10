module Tradier
  class Symbol

    OPTION_SYMBOL_REGEXP = /([a-z]+)(\d?)(\d{2})(\d{2})(\d{2})(C|P)(\d{5})(\d{3})/ix

    MONTHS = {
      1 => 'Jan',
      2 => 'Feb',
      3 => 'Mar',
      4 => 'Apr',
      5 => 'May',
      6 => 'Jun',
      7 => 'Jul',
      8 => 'Aug',
      9 => 'Sep',
      10 => 'Oct',
      11 => 'Nov',
      12 => 'Dec'
    }

    attr_accessor :symbol, :adjustment, :month, :day, :year, :put_call, :dollars, :cents

    def initialize(symbol)
      @symbol = symbol
    end

    def self.parse(symbol)
      symbol.strip!

      sym = if match = symbol.match(OPTION_SYMBOL_REGEXP)
        match = match.to_a
        match.shift

        s = Symbol.new(match[0])
        s.adjustment = match[1]
        s.year       = match[2]
        s.month      = match[3]
        s.day        = match[4]
        s.put_call   = match[5]
        s.dollars    = match[6]
        s.cents      = match[7]
        s
      elsif symbol =~ /\d/
        nil
      elsif symbol =~ /[a-zA-Z]+/
        Symbol.new(symbol)
      else
        nil
      end

      raise ArgumentError.new("Invalid symbol: #{symbol}") unless sym && sym.valid?
      sym
    end

    def adjustment?
      adjustment && adjustment.to_i >= 1
    end

    def put?
      return unless put_call
      put_call.upcase == 'P'
    end

    def call?
      return unless put_call
      put_call.upcase == 'C'
    end

    def option?
      put? || call?
    end

    def equity?
      !option?
    end

    def valid?
      equity? || (option? && valid_month?)
    end

    def to_s
      s = equity? ? underlier : "#{underlier}#{@adjustment if adjustment?}#{@year}#{occ_month}#{occ_day}#{@put_call}#{occ_dollars}#{occ_cents}"
      s.upcase
    end

    def description
      equity? ? underlier : "#{underlier} #{expiration_description} #{strike_description} #{put_call_description}"
    end

    def underlier
      @symbol
    end

    private

    def valid_month?
      @month.to_i <= 12 && @month.to_i >= 1
    end

    def occ_month
      @month.to_i >= 10 ? @month : "0#{@month.to_i}"
    end

    def occ_day
      @day.to_i >= 10 ? @day : "0#{@day.to_i}"
    end

    def occ_cents
      case @cents.size
      when 3 then @cents
      when 2 then "#{@cents}0"
      when 1 then "#{@cents}00"
      when 0 then "000"
      end
    end

    def occ_dollars
      return @dollars if @dollars.size == 5
      ('0' * (5 - @dollars.size)) + @dollars.to_s
    end

    def expiration_description
      "#{MONTHS[@month.to_i]} #{@day} #{year_description}"
    end

    def year_description
      "20#{@year}"
    end

    def strike_description
      "$#{@dollars.to_i}.#{occ_cents[0,2]}"
    end

    def put_call_description
      put? ? 'PUT' : 'CALL'
    end

  end
end
