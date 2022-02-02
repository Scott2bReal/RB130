# Write a version of the count method that meets the conditions of this
# exercise, but also does not use each, loop, while, or until.

def count(array)
  counter = 0

  for element in array do
    counter += 1 if yield(element)
  end

  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
