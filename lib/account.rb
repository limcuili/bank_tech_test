# rubocop: disable Style/Documentation
# frozen_string_literal: true

class Account
  # rubocop:enable Style/Documentation
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    raise ArgumentError, 'Unable to deposit negative amount' if amount.negative?

    @balance += amount.round(2)
  end

  def withdraw(amount)
    raise ArgumentError, 'Please insert a positive amount' if amount.negative?

    @balance -= amount.round(2)
  end
end
