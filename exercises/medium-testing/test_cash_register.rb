require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(0)
    @transaction = Transaction.new(10)
  end
  def test_register_accepts_money
    @transaction.amount_paid = 10
    @register.accept_money(@transaction)

    assert_equal(10, @register.total_money)
  end

  def test_register_computes_correct_change
    @transaction.amount_paid = 15

    assert_equal(5, @register.change(@transaction))
  end

  def test_register_gives_accurate_receipt
    receipt = "You've paid $10.\n"

    assert_output(receipt) { @register.give_receipt(@transaction) }
  end
end
