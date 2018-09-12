# rubocop: disable Metrics/BlockLength
# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { described_class.new }

  context 'on initialization of account' do
    it 'has zero balance' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'is adds a positive amount into the balance' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end

    it 'is unable to accept a negative deposit' do
      expect { account.deposit(-7) }.to raise_error(ArgumentError)
    end

    it 'shows error message when a negative deposit is made' do
      expect { account.deposit(-1) }.to raise_error(
        'Unable to deposit negative amount'
      )
    end

    it 'rounds any amount to 2 decimal places' do
      account.deposit(1.99999999)
      expect(account.balance).to eq 2
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'decreases a positive amount of the balance' do
      expect { account.withdraw(10) }.to change { account.balance }.by(-10)
    end

    it 'is unable to accept a negative withdrawl amount' do
      expect { account.withdraw(-3) }.to raise_error(ArgumentError)
    end

    it 'shows error message when a negative withdrawal is made' do
      expect { account.withdraw(-1) }.to raise_error(
        'Please insert a positive amount'
      )
    end

    context 'There exist maximum negative balance' do
      let(:account_with_100) { described_class.new(100) }
      max_negative = Account::MAX_NEGATIVE_BALANCE

      it 'allows withdraw to a balance of -50' do
        expect { account_with_100.withdraw(150) }.not_to raise_error
      end

      it 'throws an error if you withdraw to a balance of -51' do
        expect { account_with_100.withdraw(151) }.to raise_error(
          "You are unable to go below a negative balance of £#{max_negative}."
        )
      end
    end
  end
end

# rubocop: enable Metrics/BlockLength
