require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text_class'

class TextTest < MiniTest::Test
  def setup
    @sample_file = File.open('text.txt', 'r')
    @expected_file = File.open('expected_text.txt', 'r')
    @sample_text = Text.new(@sample_file.read)
    @expected_text = @expected_file.read
  end

  def teardown
    @sample_file.close
    @expected_file.close
  end

  def test_swap
    assert_equal(@expected_text, @sample_text.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72, @sample_text.word_count)
  end
end
