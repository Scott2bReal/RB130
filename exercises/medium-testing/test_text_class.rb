require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text_class'

class TextTest
  def setup
    @sample_file = File.open('text.txt', 'r')
    @text = Text.new(@file.read)
    @expected_file = File.open('expected_text', 'r')
    @expected_text = @expected_file.read
  end

  def teardown
    @sample_text.close
    @expected_file.close
  end

  def test_can_swap_letters
    swapped = @text.swap('a', 'e')
    assert(@expected_text, swapped)
  end

  def test_can_count_words
    words = @text.word_count
    assert_equal(72, words)
  end
end
