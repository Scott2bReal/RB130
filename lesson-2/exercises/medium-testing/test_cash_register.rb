# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100) 
  end

  def test_accept_money
    transaction = Transaction.new(1)
    transaction.amount_paid = 1
    @register.accept_money(transaction)
    assert_equal(101, @register.total_money)
  end
end
