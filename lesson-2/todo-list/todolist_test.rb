require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy Milk")
    @todo2 = Todo.new("Clean Room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # tests go here. must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raises_error
    assert_raises(TypeError) { @list.add('1') }
  end

  def test_shovel_adds_item
    new_todo = Todo.new('test')
    @list << new_todo
    assert_equal(new_todo, @list.pop)
  end

  def test_add_and_shovel_same
    new_todo = Todo.new('test')
    @list.add  new_todo
    assert_equal(new_todo, @list.pop)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(999) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_raises(IndexError) { @list.mark_done_at(999) }
  end

  def test_mark_undone_at
    @list.mark_done_at(0)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_raises(IndexError) { @list.mark_undone_at(999) }
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(999) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
---- Today's Todos ----
[ ] Buy milk
[ ] Clean room
[ ] Go to gym
OUTPUT

    assert_equal(output, @list.to_s)
  end

  # def test_to_s_one_done
  # end

  # def test_to_s_all_done
  # end

  # def test_each
  # end

  # def test_each_returns_original_object
  # end

  # def select
  # end
end
