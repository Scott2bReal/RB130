# RB139 Assessment Study Guide

## Closures, Binding, and scope

### What is a closure?

  A closure in Ruby is a chunk of code that can be saved, passed around as an
  object, and executed. Three main ways of creating a closure in Ruby are
  through the use of blocks, procs, and lambdas.

### What is binding?
  
  When a closure is created, all of the objects, variables and methods
  (artifacts) which are in-scope are saved with the closure. These surrounding
  artifacts are called a closure's "binding" 
  
### How do closures interact with variable scope?

  Because closures save their surrounding artifacts as their binding, they can
  access and update variables which are a part of that binding, even if outside
  of the variable's scope.
  
### Methods which use blocks and procs

  #### Blocks

  All methods in Ruby implicitly accept blocks. The use of the `block_given?`
  method of the `Kernel` class is a way to guard against the `yield` keyword
  throwing an error when no block is given. Here is an example of an
  implementation of a select method which utilizes an implicit block:
  
  ```ruby
  def select(array)
    raise ArgumentError unless block_given?
    
    new_array = []
    array.each do |item|
      new_array << item if yield(item) 
    end
    
    new_array
  end
  ```
  
  #### Procs
  
  It is also possible to define a method with an explicit block parameter. This
  is done through the use of the `&` symbol. Prepending a parameter with that
  symbol will convert a block passed to the method to a `Proc` object, which can
  then be called in the method as well as passed to other methods. Here is a
  different example of an implementation of a select method using a `Proc`
  object created through the use of an explicit block parameter:
  
  ```ruby
  def select(array, &block)
    new_array = []
    array.each do |item|
      new_array << item if block.call
    end
    
    new_array
  end
  ```
  
  An example of a more basic method which utilizes a proc:
  
  ```ruby
    def call_a_proc(proc_object)
      proc_object.call
    end
    
    chunk = proc { puts 'hello world!' }
    
    call_a_proc(chunk) # => hello world!
  ```
  
  
