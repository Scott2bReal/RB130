=begin
In our Ruby course content on blocks, we learn about "symbol to proc" and how
it works. To review briefly, consider this code:

comparator = proc { |a, b| b <=> a }

and the Array#sort method, which expects a block argument to express how the
Array will be sorted. If we want to use comparator to sort the Array, we have
a problem: it is a proc, not a block. The following code:

array.sort(comparator)

fails with an ArgumentError. To get around this, we can use the proc to block
operator & to convert comparator to a block:

array.sort(&comparator)

This now works as expected, and we sort the Array in reverse order.

When applied to an argument object for a method, a lone & causes ruby to try
to convert that object to a block. If that object is a proc, the conversion
happens automatically, just as shown above. If the object is not a proc, then
& attempts to call the #to_proc method on the object first. Used with symbols,
e.g., &:to_s, Ruby creates a proc that calls the #to_s method on a passed
object, and then converts that proc to a block. This is the "symbol to proc"
operation (though perhaps it should be called "symbol to block").

Note that &, when applied to an argument object is not the same as an &
applied to a method parameter, as in this code:

def foo(&block)
  block.call
end

While & applied to an argument object causes the object to be converted to a
block, & applied to a method parameter causes the associated object to be
converted to a proc. In essence, the two uses of & are opposites.

Did you know that you can perform a similar trick with methods? You can apply
the & operator to an object that contains a Method; in doing so, Ruby calls
Method#to_proc.

Using this information, together with the course page linked above, fill in
the missing part of the following code so we can convert an array of integers
to base 8 (octal numbers). Use the comments for help in determining where to
make your modifications, and make sure to review the "Approach/Algorithm"
section for this exercise; it should prove useful.
=end

def convert_to_base_8(n)
  n.method_name.method_name # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(argument).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8, 10, 12, 14, 16, 33].map(&a_proc)

# The expected return value of map on this number array should be:

[10, 12, 14, 16, 20, 41]
