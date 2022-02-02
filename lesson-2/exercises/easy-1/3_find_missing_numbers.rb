# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.
#
# Data Structure: Array
#
# Algorithm:
#   - Initialize empty array
#   - Make a Range of first to last num in input array
#   - For each num in range
#     - if input array does not include num, add to return array
#   - Return array

def missing(input)
  missing = []
  range = (input.first..input.last)

  range.each { |num| missing << num unless input.include?(num) }

  missing
end

# Examples:

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
