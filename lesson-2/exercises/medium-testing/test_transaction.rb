require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require 'stringio'

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(10)
  end

  def test_prompt_for_payment
    input = StringIO.new("10\n")
    output = StringIO.new("")
    # incorrect_input = StringIO.new("5\n")
    @transaction.prompt_for_payment(input: input, output: output)

    assert_equal(@transaction.amount_paid, 10)
  end
end
