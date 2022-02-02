=begin
This exercise covers material that you do not have to master. We provide the
exercise as a way to demonstrate how Enumerator objects work.

Thus far, we've used iterators often. You've seen the use of #each and #map used
on various data structures, such as Arrays and Hashes. These methods make
writing certain code a bit easier, at least when compared to a while or for
loop. Yet, what we've seen thus far is only part of what is available.

Whenever we use map or each on something like an Array, we're using something
called "Internal Iteration". It's called that because the process and
implementation of that iteration is hidden from us, and the process that allows
us to progress through a collection is part of that hidden implementation.

There's also "External Iteration". This is iteration that takes place at the
behest of the user. Ruby gives us the option to use this type of iteration with
the Enumerator class. For this exercise, lets take a bit of a tour of the
capabilities of Enumerator. While we do that, let's make something interesting
with it.

In this exercise, your task is to create a new Enumerator object. When creating
a new Enumerator, you may define what values are iterated upon. We'll want to
create an Enumerator that can iterate over an infinite list of factorials. Once
you make this new Enumerator, test it out by printing out the first 7 factorial
values, starting with zero factorial.

More specifically, print the first 7 factorials by using an "External Iterator".
Once you have done so, see what happens if you print 3 more factorials (the
results won't be correct). Now, reset your Enumerator (use the rewind method).
Finally, print 7 more factorials.

You can find almost everything you need for this exercise in the documentation
for Enumerator. In particular, check out the ::new method; it should prove a
good starting point for this exercise. Some further details about internal vs
external iterators are mentioned at the start of that documentation, so make
sure to read that section. That section is a bit dense at places; if you don't
understand everything about it, that's ok.

A factorial is a mathematical operation that involves multiplying a bunch of
sequential positive numbers together. They are usually written as a non-negative
integer followed by an exclamation point, e.g., 4!. The values look like this:

n 	n! 	notes
0 	1 	By definition, 0! is 1
1 	1 	By definition, 1! is 1
2 	2 	2! = 2 * 1
3 	6 	3! = 3 * 2 * 1
4 	24 	4! = 4 * 3 * 2 * 1
5 	120 	5! = 5 * 4 * 3 * 2 * 1

The factorial values (0!, 1!, 2!, etc.) follow a simple pattern. First, 0! and
1! are both defined to be 1. All subsequent factorials are the result of
multiplying all the integers from 1 up to the n value together. Thus, 5! is 5 *
4 * 3 * 2 * 1, or 120.

The wikipedia page on factorials may also be of some use.

Two final hints:

    You'll only need 3 Enumerator methods to complete this exercise. An
    Enumerator also implements the Enumerable module. Keep this in mind, as it
    may make certain parts of this exercise easier to write.
=end
require 'pry'

factorial_iterator = Enumerator.new
