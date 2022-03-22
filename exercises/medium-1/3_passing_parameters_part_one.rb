# Modify the method below so that the display/output of items is moved to a
# block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

# Original
# def gather(items)
#   puts "Let's start gathering food."
#   puts "#{items.join(', ')}"
#   puts "Nice selection of food we have gathered!"
# end

# Solution
def gather(items)
  puts "Let's start gathering food"
  puts yield(items) if block_given?
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| items.join(', ') }
