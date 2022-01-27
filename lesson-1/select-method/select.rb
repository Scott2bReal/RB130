def select(array)
  counter = 0
  return_array = []

  while counter < array.size
    return_array << array[counter] if yield(array[counter])

    counter += 1
  end

  return_array
end

arr = [1, 2, 3, 4, 5]

puts "Array: #{arr}"

odds = select(arr) { |num| num.odd? } # should return [1, 3, 5]
puts "Odds: #{odds}"

evens = select(arr) { |num| num.even? }
puts "Evens: #{evens}"
