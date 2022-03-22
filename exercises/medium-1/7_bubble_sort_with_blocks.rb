def bubble_sort!(array)
  length = array.size
  loop do
    swapped = false
    new_length = 0
    array.each_with_index do |item, idx|
      if idx > 0 && array[idx - 1] > item
        array[idx], array[idx - 1] = array[idx - 1], array[idx]
        new_length = idx
        swapped = true
      end
    end
    length = new_length
    break if swapped == false
  end
  array
end

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)
