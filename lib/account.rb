# rubocop: disable Style/Documentation
# frozen_string_literal: true

class Account
  # rubocop:enable Style/Documentation
  MAX_NEGATIVE_BALANCE = 50
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

    if amount > (@balance + MAX_NEGATIVE_BALANCE)
      raise "You are unable to go below a negative balance of £50."
    else
      @balance -= amount.round(2)
    end
  end
end
