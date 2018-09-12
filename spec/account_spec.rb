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
end
