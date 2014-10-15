require 'spec_helper'

describe Tradier::Account do

  describe "#account_number" do
    it "returns the account_number when set" do
      account = Tradier::Account.new(:account_number => '20130704')
      expect(account.account_number).to eq('20130704')
    end
    it "returns nil when account_number is not set" do
      account = Tradier::Account.new({})
      expect(account.account_number).to be_nil
    end
  end

  describe "#type" do
    it "returns the type when set" do
      account = Tradier::Account.new(:type => 'Margin')
      expect(account.type).to eq('Margin')
    end
    it "returns nil when type is not set" do
      account = Tradier::Account.new({})
      expect(account.type).to be_nil
    end
  end

  describe '#margin?' do
    it 'returns true when account type is margin' do
      account = Tradier::Account.new(:type => 'Margin')
      expect(account.margin?).to be_truthy
    end
  end

  describe '#cash?' do
    it 'returns true when account type is cash' do
      account = Tradier::Account.new(:type => 'Cash')
      expect(account.cash?).to be_truthy
    end
  end

  describe '#positions' do
    it 'returns an array' do
      account = Tradier::Account.new(:positions => { :position => [{ :symbol => 'foo' }]})
      expect(account.positions).to be_an Array
    end

    it 'returns an a collection of Tradier::Position' do
      account = Tradier::Account.new(:positions => { :position => [{ :symbol => 'foo' }]})
      expect(account.positions.first).to be_a Tradier::Position
    end
  end

  describe '#orders' do
    it 'returns an array of orders' do
      account = Tradier::Account.new(:orders => { :order => [{ :id => '123' }]})
      expect(account.orders).to be_an Array
    end

    it 'returns a collection of Tradier::Order' do
      account = Tradier::Account.new(:orders => { :order => [{ :id => '123' }]})
      expect(account.orders.first).to be_a Tradier::Order
    end
  end

  describe '#gainloss' do
    it 'returns an array of closed positions' do
      account = Tradier::Account.new(:gainloss => { :closed_position => [{ :id => '123' }]})
      expect(account.gainloss).to be_an Array
    end

    it 'returns a collection of Tradier::Position' do
      account = Tradier::Account.new(:gainloss => { :closed_position => [{ :id => '123' }]})
      expect(account.gainloss.first).to be_a Tradier::Position
    end
  end

  describe '#history' do
    it 'returns an array of history' do
      account = Tradier::Account.new(:history => { :event => [{ :id => '123' }]})
      expect(account.history).to be_an Array
    end

    it 'returns a collection of Tradier::Event' do
      account = Tradier::Account.new(:history => { :event => [{ :id => '123' }]})
      expect(account.history.first).to be_a Tradier::Event
    end
  end

  describe '#individual_account?' do
    subject { described_class.new(:classification => 'individual') }
    it 'returns true when an individual account' do
      expect(subject.individual_account?).to be_truthy
    end
  end

  describe '#joint_account?' do
    subject { described_class.new(:classification => 'joint') }
    it 'returns true when an joint account' do
      expect(subject.joint_account?).to be_truthy
    end
  end

  describe '#traditional_ira?' do
    subject { described_class.new(:classification => 'traditional_ira') }
    it 'returns true when a traditional_ira account' do
      expect(subject.traditional_ira?).to be_truthy
    end
  end

  describe '#rollover_ira?' do
    subject { described_class.new(:classification => 'rollover_ira') }
    it 'returns true when a rollover_ira account' do
      expect(subject.rollover_ira?).to be_truthy
    end
  end

  describe '#roth_ira?' do
    subject { described_class.new(:classification => 'roth_ira') }
    it 'returns true when a roth_ira account' do
      expect(subject.roth_ira?).to be_truthy
    end
  end

  describe '#ira?' do
    %w(traditional_ira roth_ira rollover_ira).each do |ira_type|
      subject { described_class.new(:classification => ira_type) }
      it "returns true when a #{ira_type} account" do
        expect(subject.ira?).to be_truthy
      end
    end
  end

end
