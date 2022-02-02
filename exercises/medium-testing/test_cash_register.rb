# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100) 
  end

  def test_accept_money
    transaction = Transaction.new(1)
    transaction.amount_paid = 1
    previous = @register.total_money
    @register.accept_money(transaction)

    assert_equal(previous + 1, @register.total_money)
  end

  def test_change
    transaction = Transaction.new(10)
    transaction.amount_paid = 20
    correct_change = 20 - 10
    change_given = @register.change(transaction)
    
    assert_equal(correct_change, change_given)
  end

  def test_give_receipt
    transaction = Transaction.new(10)
    transaction.amount_paid = 10

    assert_output("You've paid $10.\n") { @register.give_receipt(transaction) }
  end
end
