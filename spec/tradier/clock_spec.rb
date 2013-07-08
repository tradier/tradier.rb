require 'spec_helper'

describe Tradier::Clock do

  describe "#date" do
    it "returns the date when set" do
      clock = Tradier::Clock.new({ :date => '2013-07-04' })
      expect(clock.date).to be_a Date
      expect(clock.date.to_s).to eq('2013-07-04')
    end
    it "returns nil when symbol is not set" do
      clock = Tradier::Clock.new('clock' => {})
      expect(clock.date).to be_nil
    end
  end

  describe "#time" do
    it "returns the timestamp when set" do
      clock = Tradier::Clock.new({ :timestamp => 1372103978 })
      expect(clock.time).to be_a Time
      expect(clock.time.utc.to_s).to eq('2013-06-24 19:59:38 UTC')
    end
    it "returns nil when symbol is not set" do
      clock = Tradier::Clock.new('clock' => {})
      expect(clock.time).to be_nil
    end
  end

  describe "#description" do
    it "returns the date when set" do
      clock = Tradier::Clock.new({ :description => 'Market is closed.' })
      expect(clock.description).to eq('Market is closed.')
    end
    it "returns nil when symbol is not set" do
      clock = Tradier::Clock.new('clock' => {})
      expect(clock.description).to be_nil
    end
  end

  describe "#next_change" do
    it "returns the date when set" do
      clock = Tradier::Clock.new({ :next_change => '08:00' })
      expect(clock.next_change).to eq('08:00')
    end
    it "returns nil when symbol is not set" do
      clock = Tradier::Clock.new('clock' => {})
      expect(clock.next_change).to be_nil
    end
  end

  describe "#next_state" do
    it "returns the date when set" do
      clock = Tradier::Clock.new({ :next_state => 'premarket' })
      expect(clock.next_state).to eq('premarket')
    end
    it "returns nil when symbol is not set" do
      clock = Tradier::Clock.new('clock' => {})
      expect(clock.next_state).to be_nil
    end
  end

  describe "#state" do
    it "returns the date when set" do
      clock = Tradier::Clock.new({ :state => 'closed' })
      expect(clock.state).to eq('closed')
    end
    it "returns nil when symbol is not set" do
      clock = Tradier::Clock.new('clock' => {})
      expect(clock.state).to be_nil
    end
  end

end
