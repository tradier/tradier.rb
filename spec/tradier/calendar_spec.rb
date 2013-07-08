require 'spec_helper'

describe Tradier::Calendar do

  describe "#month" do
    it "returns the month when set" do
      calendar = Tradier::Calendar.new({ :calendar => { :days => { :month => 6 }}})
      expect(calendar.month).to eq(6)
    end
    it "returns nil when month is not set" do
      calendar = Tradier::Calendar.new({ :calendar => { :days => {}}})
      expect(calendar.month).to be_nil
    end
  end

  describe "#year" do
    it "returns the year when set" do
      calendar = Tradier::Calendar.new({ :calendar => { :days => { :year => 2013 }}})
      expect(calendar.year).to eq(2013)
    end
    it "returns nil when year is not set" do
      calendar = Tradier::Calendar.new({ :calendar => { :days => {}}})
      expect(calendar.year).to be_nil
    end
  end

end
