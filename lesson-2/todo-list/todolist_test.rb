require 'simplecov'
SimpleCov.start
require 'minitest/reporters'
require 'minitest/autorun'
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
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
    output = <<~MSG.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    MSG

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<~MSG.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    MSG

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~MSG.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    MSG

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    test_array = []
    @list.each { |todo| test_array << todo }
    assert_equal([@todo1, @todo2, @todo3], test_array)
  end

  def test_each_returns_original_object
    test_return = @list.each
    assert_equal(@list, test_return)
  end

  def select
    @todo1.done!
    list = Todo.new(@list.title)
    list << @todo1

    assert_equal(list.title, @list.select(&:done?).title)
    assert_equal(list.to_s, @list.select(&done?).to_s)
  end

  def test_find_by_title
    test_todo = Todo.new("Buy milk")

    assert_equal(test_todo, @list.find_by_title("Buy milk"))
  end

  def test_mark_done
    output = <<~MSG.chomp
        ---- Today's Todos ----
        [X] Buy milk
        [ ] Clean room
        [ ] Go to gym
        MSG

    @list.mark_done("Buy milk")

    assert_equal(output, @list.to_s)
  end

  def test_all_done
    output = <<~MSG.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    MSG

    @list.done!

    assert_equal(output, @list.all_done.to_s)
  end

  def test_all_not_done
    output = <<~MSG.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    MSG

    assert_equal(output, @list.all_not_done.to_s)
  end

  def test_mark_all_done
    output = <<~MSG.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    MSG

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_mark_all_undone
    output = <<~MSG.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    MSG

    @list.done!
    @list.mark_all_undone
    assert_equal(output, @list.to_s)
  end
end
