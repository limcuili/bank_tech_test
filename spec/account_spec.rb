# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { described_class.new }

  context 'on initialization of account' do
    it 'has zero balance' do
      expect(account.balance).to eq 0
    end
  end
end
