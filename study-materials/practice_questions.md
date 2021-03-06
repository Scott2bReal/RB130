# RB139 Assessment Practice Questions

## Blocks

1. What are closures?

  Closures in ruby are a way to save a chunk of code for later use. It builds an
  "enclosure" around all of its "artifacts" (variables, methods, objects). This
  is referred to as "binding" -- a closure "binds" to its surrounding context,
  or its "binding"

2. What are blocks?

  Blocks are a way of creating a closure in Ruby. They are commonly created
  using the `do..end` syntax. They have lenient arity. All methods can
  implicitly accept a block as an argument, and the `yield` keyword can be used
  to execute a block passed as an argument.

3. What are Procs and lambdas? How are they different?

  Procs and lambdas are the two other ways to create closures in Ruby aside from
  blocks. The main difference between Procs and lambdas are that Procs have
  lenient arity, while lambdas have strict arity.

4. How do closures interact with variable scope?

  Closures keep track of in-scope variables which are assigned prior to the
  creation of the closure. They can use and update these variables even if the
  closure is executed from outside the scope of those variables. Local variables
  defined within a closure (inner scope) will not be available outside of that
  closure (outer scope). Blocks can be defined with **block parameters**. These
  become **block local variables** and are scoped at the level of the closure.

5. What are blocks used for? Give examples of specific use cases

  Blocks are used for two main purposes: deffering implementation to the method
  caller, and for sandwiching code. Examples of these two use cases are:
    
    - Deffering implementation: a method is defined by the method implementor,
      and the person or program calling the method is called the method caller.
      Sometimes a method iplementor wont know how a method will be called, so to
      make a method more flexible they can allow the method to yield to a block
      and have the method caller take it the rest of the way. An
      easy-to-understand example in code would be the commonly used `select`
      method:

      ```ruby
      array = [1, 2, 3]
      array.select { |num| num.odd? } # allows method caller to define which
      elements they would like to select
      ```
      Obivously, we as programmers would like to use the `select` method for
      other purposes than selecting odd numbers from an array. This is why
      deferring implementation to the method caller is a useful way to use
      blocks.

    - Sandwiching code: yielding to a block allows the method implementor to
      define the "bread" of the code, and leave the "meat" to the method caller.
      For example:
      
      ```ruby
      def transform(item)
        item_class_before = item.class
        new_item = yield(item) if block_given?
        item_class_after = new_item.class 
        
        puts "It was a #{item_class_before}, now it is a #{item_class_after}"
      end
      ```
      
      This code allows a user to change the class of an item

6. How do we write methods that take a block? What errors and pitfalls can arise
   from this and how do we avoid them?

  - A method can be defined to execute a block using the `yield` keyword. If
    `yield` is used but no block is passed to the method, a `LocalJumpError` will be
    thrown. This can be avoided by the use of `Kernel#block_given?` in a guard
    clause. Another way to write a method that takes a block is to define the
    method with a parameter with a leading `&` symbol. This will convert the
    argument passed in for that parameter to a `Proc` object, which can be
    executed in the method by calling the `call` method on the local variable
    assigned to that `Proc` object. For example:
    
    ```ruby
    def takes_a_block(&closure)
      closure.call(closure)
    end
    
    takes_a_block { |_| puts "This is the closure!" }
    takes_a_block { |block| puts "The block is a #{block}" }
    ```

7. How do we utilize the return value of a block? How can methods that take a
   block pass pieces of data to that block?

  We can utilize the return value of a block by saving the return of the `yield`
  keyword to a local variable in a method. We can pass arguments to those blocks
  by passing arguments to either the `yield` keyword or the `call` method call,
  depending on which is being used.

8. What is `Symbol#to_proc` and how is it used?

  `Symbol#to_proc` is a method which will convert a `Symbol` object and convert
  it to a `Proc`. It is commonly used in the following syntax:
  
  ```ruby
    [1, 2, 3].select(&:odd?) # => [1, 3]
  ```
  
  In this example, the `&` operator attempts to convert the symbol `:odd?` to a
  `Proc`. This allows `select` to execute the resulting `Proc` as if the block
  `{ |n| n.odd? }` was passed to it.

9. How do we specific a block argument explicitly?

  A block argument can be specified by prepending a `&` symbol to a parameter.
  For example:
  
  ```ruby
  def takes_a_block(&block)
    block.call
  end
  ```
  
  If a method is defined in this way it *must* receive a closure as an argument,
  or an `ArgumentError` will be raised.

10. How can we return a `Proc` from a method or block?

  `Procs` are just objects, so we can return a `Proc` object just as we would
  return any other object from a method or block. Here is an example of a method
  which returns a `Proc`:
  
  ````ruby
  def keep_track
    counter = 0
    Proc.new { counter += 1 }
  end
  ```
  
  If we were to save the returned `Proc` from `keep_track` in a local variable,
  every time we execute that `Proc` by calling the `call` method on it via that
  local variable `counter` will be incremented.
  
11. What is arity? What kinds of things in Ruby exhibit arity? Give explicit examples.

  Arity refers to the rules for how a method, block, proc or lambda handles
  arguments in Ruby. Arity can be either strict or lenient. Blocks and Procs
  have lenient arity in Ruby, while methods and lambdas have strict arity.
  Strict arity means that the number of arguments passed in *must* match the
  number of parameters. This is not true for lenient arity. An example of the
  difference between strict and lenient arity is as follows:

  Strict:
  ```ruby
  def a_method(argument)
    puts argument
  end

  a_method              # => ArgumentError
  a_method("Argument!") # => "Argument!"
  ```

  Lenient:
  ```ruby
  def a_method(argument)
    yield(argument) # => block is passed an argument
  end

  # The block is defined with no parameters, but it is passed an argument
  a_method('argument') { puts "This is the block!" } # => This is the block!
  ```

## Testing

1. What is Minitest? How do we get access to it?

  Minitest is a testing framework for Ruby. It is a Gem, so we can access it by
  running the command `gem install minitest`

2. What are the different styles of Minitest?

  The different styles of Minitest are expectation (spec-style) and assertion
  (assert-style). They are different syntaxes which accomplish the same goal.

3. What is RSpec? How does it differ from Minitest?

  RSpec is another popular Ruby testing framework which uses a DSL (domain
  specific language) and a spec-style syntax.

4. What is a test suite? What is a test?

  A test suite is all of the tests for a project. A test is a situation in which
  tests are run. Tests can contain multiple assertions and are used to determine
  whether or not a portion of code is functioning as intended.

5. What are assertions? How do they work?

  Assertions are a step in the testing process that verifies whether a test is
  successful. An assertion includes a supplied expected result which is compared
  to the result of some code from the code being tested.
  
6. Give some examples of common assertions and how they are used.

  The most common assertion is `assert_equal`. It utilizes the `==` method to
  compare two values. An example of using `assert_equal`:
  
  ```ruby
  assert_equal(2, 1 + 1) # => This test will pass
  ```
  
  Another common assertion is `assert_nil`. This will check to see if the
  resulting code is `nil`:
  
  ```ruby
  assert_nil([][0]) # => this will pass.
  ```
7. What is the SEAT approach?

  The SEAT approach is an approach to creating a test suite for larger projects.
  It consists of four steps:

  **Set up** the necessary objects
  **Execute** code against the object we're testing
  **Assert** the results of the execution
  **Tear down** and clean up any lingering artifacts

8. What is code coverage and how is it used? What tools can you use to gauge
   code coverage for yourself?

  Code coverage is a way to measure how much of the code is actually being
  tested by your test suite. A tool to gauge code coverage in Ruby is called
  `simplecov`. Placing the line `SimpleCov.start` in your test suite will
  generate an `html` file that will display a coverage report.

## Core Ruby Tools

1. What are RubyGems? How are they used? Where can you find them? How do you
   manage them in your own environment? How do you include them in projects you
   create?

  RubyGems are packages of code which can be installed on your system for use in
  Ruby programs or the terminal. Gems are found in the remote library, which by
  default is the RubyGems Library found at https://rubygems.org/gems. Additional
  remote libraries can be specified using the `gem install` command. Once a gem
  is installed, it can be found in the 'local library'. The precise location on
  your system can be found using the `gem env` command. They can be included in
  your projects by using the `require` keyword.

2. What is the RubyGems format for projects?

  
3. What are Ruby Version Managers? Why do we need them? Give some examples of
   available Ruby Version Managers and what they can do for you.

  Ruby version managers are programs which will allow for the intallation and
  use of multiple different versions of Ruby on one system. `RVM` and `rbenv`
  are two of the most popular version managers for Ruby. We need them because
  sometimes a Ruby program will use certain features of the language that
  operate in a certain way in one version, and that feature may change in
  upcoming version. Another reason to use a specific version of Ruby is to
  maintain compatibility with any required gems.
  
4. What is Bundler? What does it do and why is it useful?

  Bundler is a gem which manages dependencies for a ruby program. It helps to
  organize all of the required files needed to run a Ruby program. It uses a
  `Gemfile` to know which version of Ruby and gems to use. Using the command
  `bundle install` will use the `Gemfile` to download and install the proper
  version of Ruby and gems. This generates a `Gemfile.lock` file which displays
  those files, as well as any files those depend on.

5. What is Rake? What does it do and why is it useful?

  Rake is a gem which automates common development tasks, such as incrementing
  version numbers or making making commits to a git repo. It is useful because
  it saves developer time and effort in completing these tasks, and the
  automation guards against human error.

6. What is a `.gemspec` file?

  A `.gemspec` file provides information about a RubyGem. It is necessary if the
  gem is to be released (published on a remote Gem libaray)

7. How do the Ruby tools relate to one another?

  Ruby version managers will manage gem and Ruby versions. Bundler uses the
  `Gemfile` to know which versions of gems and ruby a project needs. Bundler
  will generate a `Gemfile.lock`  that will ensure the proper dependencies are
  in place. Rake is a gem that automates repetitive developer tasks.

## Regex

1. What are patterns?

  Patterns are the components of a regular expression. They are used to search
  for certain characters or groups of characters within strings.

2. How do you define a regex?

  A regex can be defined by placing characters of interest with two `/` symbols.

3. What is concatenation in regex? How is it achieved?

  Concatentation is the combining of multiple patterns. It is achieved by, for
  example, placing more than once character between `/`  symbols. The regex will
  find those characters when they appear together in a string

4. What is alternation in regex? How is it achieved?

  Alternation is a simple way to match one of two or more patterns defined in
  the regex. An example of alternation is: `/(ab|cd)/`

5. What are a few examples of the most basic kind of regex patterns?

  `/a/`
  `/bat/`

6. What is a meta-character? How do you deal with them in regex? List a few examples.
  
  A meta-character is a character which has a specific meaning to a regex
  engine. They are dealt with by either using them as intended in your regex, or
  by "escaping" them by using a \ symbol.

  `/\./`
  `/ca\*/`
  
7. What is a character class? How are they created? Give specific examples.

  Character classes are regex which all certain characters to be matched without
  needing them to be together. They are created by defining a list of characters
  between `[]` symbols.
  
8. How are meta-characters different inside and outside of a character class?

  Normal regex meta-characters can mostly be handled normally within character
  classes. The list of meta-characters inside character classes is much smaller:
  `^-/[]`

9. What is an anchor? What, specifically, do you have to watch out for with anchors when it comes to Ruby regex?

  Anchors are characters which will confine regex results to certain places in
  the string (like the beginning and end of a line). When using the `\z` anchor,
  it will match up to and including any `\n` characters at the end of a string.

10. What is a quantifier? How do they operate? Give explicit examples.


11. What is a capture group and how is it used?
12. How do you test a string against a regex?
13. How can you split strings into multiple items with a regex?
14. How do you construct new strings from existing strings?
