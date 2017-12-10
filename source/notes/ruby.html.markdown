---

title: Ruby
date: 2017-12-08 07:39 UTC
tags: 

---

**Ruby bitwise or | operations**
   
        +-------------+------------+
        | 9 | 5 => 13 | 2 | 4 => 6 |
        +-------------+------------+
        |  9:   1001  | 2:   0010  |
        |  5:   0101  | 4:   0100  |
        |  13:  1101  | 6:   0110  |
        +-------------+------------+


.  |. 
--- | ---
"hi" | "there"

**Gem** - A Ruby Gem is a packaged Ruby library. Packaging makes it easy to manage, download, install, update, remove, etc. Gems are handled by RubyGems, a package manager of sorts for gems.

**Bundler** - Bundler allows you to make your app more portable by automaticaly installing required gems listed in your Gemfile. Bundler is itself a gem and uses RubyGems to find, download and install required gems. Bundler is helpful because if you move your application to a new location you can ensure that all required gems will be installed when `bundle install` is run.



**<<** -  fix `<<` count → integer Shifts fix left count positions, or right if count is negative.

  `3 << 4 => 48` double 3 4 times (6, 12, 24, 48)

**tIDENTIFIER** -

**Colons Before and After Variables/Attributes** -

**::, #, :** -

this | means this
---:|---
    ::   | -denote class or module constants,
    `:` | -some thing
    `#` | -other things

**Private v. Protected Methods** -

**Options Hash** -

**Here Doc** -

**Constants** - Constants are declared in ALL CAPS:
  
         CAR_COLORS = ["red", "green", "black"]

  Constants are accessible....

**Instance Variables** - Declared with `@`
   
         @instance_var = 99

**Arrays** - [], Array.new, %w(el_1 el_2 el_3)

**Ternary Conditional** -

if var equals this | do this | else do this
:---:|:---:|:---:
var == | ? | :
`condition` | `result if condition is true` | `result if condition is false`
   
        def tern_test(var)
          var == 1 ? 2 : 3
        end
   
        tern_test(1)
        => 2
   
        tern_test(2)
        => 3
   
        tern_test(4000)
        => 3


**Sigils in Ruby** - Sigils are the non-alphanumeric characters that decorate variables in Ruby. They always go before a variable.

* **no sigil** on a variable means it is a plain local variable.

* **@** makes a variable an **instance variable**
These
variables are variables that belong to a particular object instance.

* **$** sigil makes a variable global - valid everywhere in the script.
But
these are not **Constants**.

* **@@** are for **class variables**. These are shared among objects of a class. If one object instance changes the value of the variable, that new value will essentially change for all other object instances.


**begin/rescue/end blocks in Ruby** - In Ruby, the `rescue` clause is used along with `begin` and `end` to define blocks of code that handle exceptions. For example:

```ruby
> begin
>   puts 10 / 0
> rescue
>   puts "You caused an error!"
> end
```
will output:

```
You caused an error!
```

`begin` and `end` define a section of code to be run wherein if an exception occurs, it's handled by the code inside the rescue block. If the following code had been run:

```ruby
> puts 10 / 0
```
the output would be:

```
test.rb:1:in `/': divided by 0 (ZeroDivisionError)
```
which is an error that will crash a program. The `rescue` block prevents a crash by running its code (in this case, just printing a message) instead of exiting the application.

This gets to why using different exception classes is important and why the ability to create custom exception classes is super functional. With `rescue`, different exceptions can be handled differently. For example, the above code causes `ZeroDivisionError` which you might want to trigger a certain message as opposed to a `NameError` which will trigger something else.

```ruby
> begin
>   # code...
> rescue ZeroDivisionError
>   puts "You caused an error!"
> rescue NameError
>   puts "you coused a different error and here's why..."
> end
```
The above code will output different messages depending on what exception is rescued.

**Naked Rescue** - I believe this means rescuing without referencing a specific type of exception?

**Thoughts on Methods** - In IRB. When I create a new method in the main:Object (top level, "irb(main):01" right after opening a new irb session), it has the following properties:

```ruby
def is_a_string
  string_in_this_method = "I'm a string in the \"is a string\" method."
  puts string_in_this_method
  string_in_this_method
end
```

* If I call `methods` it *is not* in the returned list
* If I call `private_methods` it *is* in the returned list
* If I call `class` on the new method

```ruby
is_a_string.class
```

`String` is returned. This is because the last expression in the method definition is the variable pointing at a string, so the method always returns a string.

* The new method is not in `String.methods` or in `hh”.methods` (an instance of string).
* The new method **is** in `String.private_methods` and `hh”.private_methods`
* The new method is *not* in `String.instance_methods`
* The new method is in `BasicObject.private_methods`

So where and when can this method be called? I can call it in `main:Object`

```ruby
irb(main):087:0> is_a_string
I'm a string in the "is_a_string" method.
=> "I'm a string in the \"is_a_string\" method."
irb(main):088:0>
```

So it can be called from within objects??

If I call it on a String object:

    irb(main):088:0> "literal".is_a_string
    NoMethodError: private method `is_a_string' called for "literal":String
        	from (irb):88
        	from C:/Ruby22/bin/irb:11:in `<main>'
    irb(main):089:0>

I’m pretty sure the new method is a private method of all classes and objects.

If I open up the String class and make a new method inside of it:

    irb(main):106:0> class String
              irb(main):107:1> def string_method_test
                           irb(main):108:2> is_a_string
                           irb(main):109:2> puts self
                           irb(main):110:2> "hi there"
              irb(main):111:2> end
    irb(main):112:1> end
    => :string_method_test


I can not call `string_method_test` inside `main:Object`

    irb(main):113:0> string_method_test
    NameError: undefined local variable or method `string_method_test' for main:Object
        	from (irb):113
        	from C:/Ruby22/bin/irb:11:in `<main>'


I *can* call it on a string object:

    irb(main):114:0> "h".string_method_test
    I'm a string in the "is_a_string" method.
    h <= this is the result of "puts self" inside the method definition.
    => "hi there"

The new method `string_method_test` *is* in `String.instance_methods` and *is* in ““string literal”.`methods`

The `string_method_test.class` returns String. Because I put it in the String class? Or because the return value is a string? *I think it's because it returns string*.

Make a new method called `method_test_returns_fixnum` inside the String class

    irb(main):126:0> class String
    irb(main):127:1> def method_test_returns_fixnum
    irb(main):128:2> is_a_string
    irb(main):129:2> puts self
    irb(main):130:2> 4 + 4
    irb(main):131:2> end
    irb(main):132:1> end
    => :method_test_returns_fixnum


Running `method_test_returns_fixnum` on a string returns:

    irb(main):141:0> "string?".method_test_returns_fixnum
    I'm a string in the "is_a_string" method.
    string?  <= this is the result of "puts self" inside the method definition.
    => 8


`.class` on the above expression returns `Fixnum`. Of course methods in the String class can return a `Fixnum`. Just like calling `.length` on a string.  
Just like running `.to_s` on an integer returns a string, even though “to_s” is a method in the `Fixnum` class ( and an instance method).

Methods have to be called on an object. When I define a method in `main:object`, at the top level of IRB, and call it, it’s being called on the `main:Object`

Methods have a "receiver" , which is the data object to the left of the method being invoked.
* In the expression x.y (object.method) x is the receiver of y.
* For private methods the receiver is always "self"


**Private Methods** - Private methods are always called on `self` in the context of the current object. If i enter `string”.private_methods` I can see an array of private methods associated with string objects. These cannot be called on the string object itself ( `string.global_variables` for example ) but must be invoked on self **within the context of the string object**. I think when public or other methods are called on a string object, behind the scenes, Ruby jumps into the context of the string object and invokes its private methods to return the requested data which may be a string, fixnum, or an array. (Integer and Array are both private methods of string objects, btw)

This is why you can use main:Object private methods initially in Ruby. You start off in the context of the main object and can use private methods (like puts and rand) to return data.

**Adding `self` infront of method names when defining**

When adding a method to a class what you are usually making are `instance methods` that can be called on instances of that class. Class methods can be called on the class itself. For example `.new` can be called on a class itself to instantiate an object of that class. When defining methods inside a class, add `self` (for example `self.celsius_to_fahrenheit`) to the front of the method name to make it a class method. Now you can call `Temperature.celsius_to_fahrenheit` (on the class itself as opposed to a temperature object).

Enumerable#inject
-----------------

    inject(initial, sym) → obj
    inject(sym) → obj
    inject(initial) { |memo, obj| block } → obj
    inject { |memo, obj| block } → obj

* Combines all elements of an enumerable using a binary operator or named in a method or block passed to #inject. Inject has an accumulator value called *memo* (short for memory?) that takes the accumulator value and each element. *Memo* is held by a block or associated with a symbol passed to inject ( :*, :+, :/)

* Inject the *memo* in inject will be whatever value is present at the end of each iteration of the given block. It can be an array if that’s what is being generated inside the block. Whatever is being done to x...

  *Memo* will be returned in whatever form it is after #inject is done.



```
+-------------------------------------+---------+
| [1, 2, 3, 4, 5].inject(:+)          | #=> 15  |
| (1..5).inject(:*)                   | #=> 120 |
| (5..10).inject { |sum, n| sum + n } | #=> 45  |
+-------------------------------------+---------+
```

```
+-------------------------------------------------------+--------------------------------------------------------------+
| longest = %w{ cat sheep bear }.inject do |memo, word| | #gen 3 element arr of strings. memo is accumulator value.    |
|   memo.length > word.length ? memo : word             | Word is element passed if length of string currently in memo |
| end                                                   | currently in memo is longer than the passed element,         |
|                                                       | memo = memo. If not, memo = word                             |
+-------------------------------------------------------+--------------------------------------------------------------+
```

**Enumerable#each_cons**  

    each_cons(n) { ... } → nil
    each_cons(n) → an_enumerator

    Means `each consecutive`.

Iterates a given block for (n) consecutive elements passed as an array
Will return an array of length *self.length - 1* no matter the value of *n*.

```
+----------------------------------+--------------------------------------------------------------+
| (1..10).each_cons(3) { |a| p a } | #an array of 3 consecutive elements passed on each iteration |
|                                  |                                                              |
| [1, 2, 3]                        | <= outputs                                                   |
| [2, 3, 4]                        |                                                              |
| [3, 4, 5]                        |                                                              |
| [4, 5, 6]                        |                                                              |
| [5, 6, 7]                        |                                                              |
| [6, 7, 8]                        |                                                              |
| [7, 8, 9]                        |                                                              |
| [8, 9, 10]                       |                                                              |
+----------------------------------+--------------------------------------------------------------+
```

**Passing a symbol or a method to a method instead of a block.**  

Some methods, like #each, #each_cons and #map, can take blocks of code as a parameter.
As a shortcut, these can also take a unary (only operates on one value(operand). Doesn’t
combine or return something from 2 values. Like #succ only increases the value of one number by
one. It doesn't need more operands.) method or operator as a symbol to achieve the same effect.
Must be a method or instance method of the object?  

For Example:

```
%w(1 2 3 4 5 6 7 8 9).map(&:to_i) == %w(1 2 3 4 5 6 7 8 9).map { |e| e.to_i }

(1..99).map(&:chr) == (1..99).map { |n| n.chr }
```

**Enumerator#zip**

    zip(arg, ...) → new_ary
    zip(arg, ...) { |arr| block } → nil

	Called on an array. Takes one or more arguments, converts them to arrays and combines them with
  `.self` and returns an array of arrays of combined elements.
	Generates an array of length *n*, where *n* is 1 more than the number of arguments.
	If the arguments are shorter than `.self`, `nil` values will be provided.

```
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].zip(a, b)   #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
[1, 2].zip(a, b)      #=> [[1, 4, 7], [2, 5, 8]]
a.zip([1, 2], [8])    #=> [[4, 1, 8], [5, 2, nil], [6, nil, nil]]

a = [2, 3, 4, 5, 6, 7, 8, 9, 10] # 9 elements

b = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1] # 10 elements
a.zip(b)
=> [[2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1], [8, 1], [9, 1], [10, 1]] # 9 sub arrays
```

**Hash #merge**

    target_hash.merge(hash1) → nil

Merges target hash into has1. Duplicate keys are superseded by the target hash. The order of keys will be `hash1...target_hash`
