# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence you
# wish.
#
# Data Structure: Array

# Algorithm:
#  - Init return array
#  - Add 1 and input to return array
#  - Make range of 2 thru square root of input
#  - For each in 2 range
#   - If input % num is 0
#     - Add num to return array
#     - add input / num to return array
include Math

def divisors(input)
  divisors = []
  divisors << 1
  divisors << input
  range = (2..sqrt(input).to_i)

  range.each do |num|
    next unless (input % num).zero?

    divisors << num
    divisors << input / num
  end

  divisors.uniq.sort
end

# Examples

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
