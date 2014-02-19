require 'spec_helper'

describe Tradier::Expiration do

  describe "#date" do
    it "returns the date when set" do
      exp = described_class.new({ :date => '2013-07-04' })
      expect(exp.date).to be_a Date
      expect(exp.date.to_s).to eq('2013-07-04')
    end
    it "returns nil when date is not set" do
      exp = described_class.new({})
      expect(exp.date).to be_nil
    end
  end

  describe '#strikes' do
    it 'returns an array of strikes when set' do
      exp = described_class.new({ :strikes => [2, 3, 4, 5, 6] })
      expect(exp.strikes).to be_an Array
      expect(exp.strikes.size).to eq(5)
    end
    it 'returns an empty array when not set' do
      exp = described_class.new({})
      expect(exp.strikes).to be_an Array
      expect(exp.strikes.size).to eq(0)
    end
  end

end
