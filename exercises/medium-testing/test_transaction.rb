require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require 'stringio'

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_transaction_prompts_for_payment
    transaction = Transaction.new(10)
    input = StringIO.new("10\n")
    transaction.prompt_for_payment(input: input, output: StringIO.new)

    assert_equal(transaction.item_cost, transaction.amount_paid)
  end
end
