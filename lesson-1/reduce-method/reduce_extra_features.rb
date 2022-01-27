def reduce(array, default=nil)
  counter = 0

  if default
    accumulator = default
  else
    accumulator = array[0]
    counter += 1
  end

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }             # => 15
reduce(array, 10) { |acc, num| acc + num }         # => 25
# reduce(array) { |acc, num| acc + num if num.odd? } # => NoMethodError

test1 = reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
test2 = reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p test1
p test2
