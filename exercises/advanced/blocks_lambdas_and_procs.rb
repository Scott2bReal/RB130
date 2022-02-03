=begin

This exercise covers material that you do not have to master. We provide the
exercise as a way to explore the differences between procs, lambdas, and blocks.

For this exercise, we'll be learning and practicing our knowledge of the arity
of lambdas, procs, and implicit blocks. Two groups of code also deal with the
definition of a Proc and a Lambda, and the differences between the two. Run each
group of code below: For your answer to this exercise, write down your
observations for each group of code. After writing out those observations, write
one final analysis that explains the differences between procs, blocks, and
lambdas.

=end

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." } # => Proc object
# puts my_proc                                          # => Proc object
# puts my_proc.class                                    # => Proc
# my_proc.call                                          # => This is a .
# my_proc.call('cat')                                   # => This is a cat.

# Observations:
# Makes an object of the Proc class using the proc keyword (?). When the proc is
# called with no argument, it doesn't throw an error and just outputs "This is a
# ." Makes it look like nil is substituted when no argument is supplied. Looks
# like lenient arity

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }    # => Proc object
# my_second_lambda = -> (thing) { puts "This is a #{thing}." } # => Proc object
# puts my_lambda                                               # => Proc object
# puts my_second_lambda                                        # => Proc object
# puts my_lambda.class                                         # => Proc
# my_lambda.call('dog')                                        # => This is a dog.
# my_lambda.call                                               # => error
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # => error

# Observations:
# Uses the lambda keyword(?) to make an object of the Proc class. The last line
# also throws an error, looks like there is no such thing as a Lambda class...
# The arity seems strict, as calling the lambda with no argument throws an error
# when the block is defined with one parameter.

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # => This is a seal
# block_method_1('seal')                                     # => error

# Observations:
# This defines a method which needs a block to run properly. Behaves as expected
# when passed an block. The yield keyword looks like it automatially takes the
# argument passed to the method and passes it along to the block, as it is
# available for use. Lenient arity? Called without a block an exception is
# raised.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # => This is a turtle
block_method_2('turtle') do |turtle, seal|                       # => This is a turtle and a .
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}          # => error

# Observations:
# The first call is much like the first, but the argument passed to the method
# is explicitly passed to the block. In the second example, only one argument is
# passed to the block, but the block is defined with two block parameters. This
# shows the lenient arity of blocks. The first argument is assigned to the first
# block parameter in the block, and the second block parameter is just nil,
# without throwing an error. In the third example however, it is apparent that a
# block needs to be defined with a parameter for an argument passed to it to be
# in scope.

# Summary:
# Blocks, procs and lambdas are three ways of creating closures in Ruby. Their
# rules regarding arguments and parameters is called their arity. Blocks and
# procs have more lenient arity than lambdas, as evidenced above. Procs can be
# defined with a parameter, but if they do not receive an argument there is no
# error. If the parameter is referenced, it just returns nil. This is in
# contrast to lambdas, which will throw an error if they do not receive the
# correct number of arguments. Blocks are similar to procs in that they can be
# defined with a parameter, but if they receive no argument they run without
# error. However, if a block receives an argument it must have a parameter
# defined for it.
