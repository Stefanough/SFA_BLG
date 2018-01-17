---

title: Ruby
date: 2017-12-08 07:39 UTC
tags:

---

Tricks and One Liners
---------------------

Compare the contents of two Arrays:

```ruby
("a".."d").to_a.any? { |c| ["z", "a"].include? c }
=> true

("a".."d").to_a.any? { |c| ["z", "y"].include? c }
=> false
```


**Procs and Blocks** - 


When defining a method to take blocks, use an ampersand in the parameters where the block will be given. This converts the block to a proc object and assigns it to the name of the parameter. Why write a method to take a block? It allows you to customize a method by injecting some logic into it. The body of the method is where the basic structure is built, where you put loops or iteration or self refference (recursion). 

I think when writing a method that will take a block, you have to assume to know how many arguments the block will take.

```ruby
class Fixnum

    def comparison(n, &the_proc)
        the_proc.call(self, n)
    end

end

> 9.comparison(8) { |a, b| a > b }
> => true
> 
> 9.comparison(8) { |a, b| b < a }
> => false
```

You can design the method to take a short burst of logic (given when the method is called) and apply it where needed.One way this is useful is in writing class methods that generate instance methods with custom logic:

```ruby
class Comparison

    def initialize(&block)
        @block = block
    end

    def compare(a, b)
        @block.call(a, b)
    end

end

> bigger? = Comparison.new { |a, b| a > b }
> bigger?.compare(8, 9)
> => false

```


**Byebug** - Byebug is a gem used for debugging Ruby code. Install Byebug with `gem install byebug`. Require byebug in your Ruby source code `require 'byebug'`. Finally, place the `debugger` keyword where you want byebug to initialize.

use `s` to 'step' into method calls and . `n` to go to next line. `c` continues to end of program or until a breakpoint is reached. `v l`, short for `var local` displays values of all local variables.


Writing Methods
---------------

**Default values for arguments** -

```ruby
def foo(n = 1)
    p n
end

foo
=> 1

foo(100)
=> 100
```


Methods
-------

**Ruby bitwise or | operations**

```ruby
+-------------+------------+
| 9 | 5 => 13 | 2 | 4 => 6 |
+-------------+------------+
|  9:   1001  | 2:   0010  |
|  5:   0101  | 4:   0100  |
|  13:  1101  | 6:   0110  |
+-------------+------------+
```


**<<** - fix `<<` count → integer Shifts fix left count positions, or right if count is negative.

`3 << 4 => 48` double 3 4 times (6, 12, 24, 48)


**Ternary Conditional** - A statement with three operands and two operators in the form of:
`conditional` ? `return if condition = true` ? `return if condition = false`

```ruby
def tern_test(var)
  var == 1 ? 2 : 3
end

tern_test(1)
=> 2

tern_test(2)
=> 3

tern_test(4000)
=> 3
```

**Enumerable#each_cons**

``` ruby
each_cons(n) { ... } => nil
each_cons(n) => an_enumerator

Means `each consecutive`.
```
Iterates a given block for `n` consecutive elements passed as an array Will return an array of length `self.length - 1` no matter the value of `n`.

```ruby
arr = []
(1..10).each_cons(3) { |a| arr << a }
```
An array of 3 consecutive elements passed on each iteration

```ruby
x
=>
[1, 2, 3]
[2, 3, 4]
[3, 4, 5]
[4, 5, 6]
[5, 6, 7]
[6, 7, 8]
[7, 8, 9]
[8, 9, 10]
```


**Enumerator#zip**

```ruby
zip(arg, ...) => #new array
zip(arg, ...) { |arr| block } => nil
```

Called on an array. Takes one or more arguments, converts them to arrays and combines them with `.self` and returns an array of arrays of combined elements.  Generates an array of length *n*, where *n* is 1 more than the number of arguments.  If the arguments are shorter than `.self`, `nil` values will be provided.

```ruby
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]

[1, 2, 3].zip(a, b)
=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

[1, 2].zip(a, b)
=> [[1, 4, 7], [2, 5, 8]]

a.zip([1, 2], [8])
=> [[4, 1, 8], [5, 2, nil], [6, nil, nil]]

a = [2, 3, 4, 5, 6, 7, 8, 9, 10] #9 elements
b = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1] #10 elements

a.zip(b)
=> [[2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1], [8, 1], [9, 1], [10, 1]]
#9 sub arrays
```

**Hash#merge**

```ruby
target_hash.merge(hash1) => nil
```

Merges `target_hash` into `hash1`. Duplicate keys are superseded by the target hash. The order of keys will be `hash1...target_hash`


**Array#each** - The `.each` method accepts a block of code to which each element of the array is passed in turn:

```ruby
def array_copy(source)
   destination = [] #create a new empty array
   source.each do |n| #submit each element in the array to the following block
     destination << n if n < 4 #push n to array ‘destination’ if n is less than 4
   end
   return destination
end
```

**inject** is a method inside of `enumerable` that allows you to get the sum or product of the contents of an array if all the elements are numeric values. `inject` is given a method argument then a block containing two parameters representing the so-far accumulated value and the next element to be operated on. 'inject' will run on each element in the array and then return the final accumulated value.

```ruby
nums = Array(1..10)
nums.inject(0) do |accum, ele| #accum set to given argument 0 but can be any value.
  accum + element
end

stdout:
=> 55

nums.inject(:+ ) #A cool shortcut that does the same as the above code.
nums.inject(:* ) #Also works for returning a product.
nums.inject('')  #Will set the accum value to an empty string.
```

```ruby
inject(initial, sym) => obj
inject(sym) => obj
inject(initial) { |memo, obj| block } => obj
inject { |memo, obj| block } => obj
```

* Combines all elements of an enumerable using a binary operator or named in a method or block passed to #inject. Inject has an accumulator value called *memo* (short for memory?) that takes the accumulator value and each element. *Memo* is held by a block or associated with a symbol passed to inject ( :*, :+, :/)

* Inject the *memo* in inject will be whatever value is present at the end of each iteration of the given block. It can be an array if that’s what is being generated inside the block. Whatever is being done to x...

    *Memo* will be returned in whatever form it is after #inject is done.

```ruby
[1, 2, 3, 4, 5].inject(:+)
=> 15

(1..5).inject(:*)
=> 120

(5..10).inject { |sum, n| sum + n }
=> 45
```

```ruby
longest = %w{ cat sheep bear }.inject do |memo, word|
#generate 3 element array of strings. memo is accumulator value.

    word.length > memo.length ? word : memo
    #if word.length (current accumulator value) is longer than memo.length
    #(previous accumulator value), replace memo with word.

end

longest
=> "sheep"
```

**select** takes elements of an array or a range and tests them against a code block. All the elements that return true are returned in a new array.

```ruby
nums = (1..30)

arr = nums.select do |i|
  i % 2 == 0
end

arr
=>
[2, 4, 6, 8, 10]
```


**include?** - Takes an object as a parameter and returns a Boolean value if any item in the array is equal to that object.

```ruby
nums = (1..10)
nums_arr = Array(1..10)
nums_hsh = {1 => "a", 2 => "b", 3 => "c", 4 => "d", 5 => "e"}

puts nums.include?(5)
=> true

puts nums.include?(11)
=> false

puts nums_arr.include?(5)
=> true

puts nums_arr.include?(11)
=> false

puts nums_hsh.include?(3)
=> true

puts nums_hsh.include?(11)
=> false

puts nums_hsh.include?('c')
=>false #.include? can't access values in a hash. Use .has_value?
```


**any?** **all?** and **none?** return a Boolean based on the given code block for the members in their collection. Check to see if an array has any element greater than zero, any odd/even elements, if all elements are positive etc.

```ruby
nums = [2, 3, 5, 7]

nums.any? do |i| #will return true of any elements are even.
  i % 2 == 0
end
=> true
```


**map** returns a new array with the results of running the called block on each element:

For an array:

```ruby
integers = [1, 2, 3, 4]
integers.map { |i| i*i }
=> [1, 4, 9, 16]
```

For a hash:

```ruby
nato = {:a => "alpha", :b => "bravo"}
nato.map { |key, value| value.upcase }
=> ["ALPHA", "BRAVO"]
```


Basic Data Types
----------------

**Strings** -

To create a new string:

```ruby
empty string:
str = ""
=> ""

populated str:
str = "there’s stuff in this string."
=> "there’s stuff in this string."

str = 1234.to_sa
=> "1234"
```

Add/remove and access characters in a string

```ruby
add to a string:
str = "hello!"

str  += "a"
=> "hello!a"

srt << " world?"
=> "hello!a"
```

access string characters:

```ruby
str = "hello!"

str[4]
=> "o" #Like an array, you can access characters at specific indices.
```

deleting string characters:

```ruby
str = "hello humans!"

str.delete("l")
=> "heo humans!" #Given 1 argument, deletes all instances of the argument

str.delete("he","hu")
=> "ello umans!" #Given 2 arguments, deletes all instances of the intersections
```

You can use #count on a String but unlike on an array you must give an argument #count

```ruby
str = "help me i'm a computer!"
str.count("e") => 3
```

**Arrays** - `[]`, `Array.new, %w(el_1 el_2 el_3`)


To initialize an empty array:

```ruby

arr = Array.new
=> []

arr = []
=> []
```

Create populated arrays:

```ruby

arr = [1, "help", [1, 2], 2]
=> [1, "help", [1, 2], 2]

arr = Array.new(3, "hi")
=> ["hi", "hi", "hi"] #first parameter is size of the array.

arr = Array.new(3) { |i| i * 3}
=> [0, 3, 6] #A block can be passed to Array.new
```

ranges to arrays:

```ruby
Array.new(0..5)
=> [0, 1, 2, 3, 4, 5]

(0..5).to_a
=> [0, 1, 2, 3, 4, 5]

('a'..'f').to_a
=> ["a", "b", "c", "d", "e", "f"]
```

To add elements to an array:

```ruby
arr << "thing" #adds element to the end of an array
arr.push("thing")

arr.unshift("thing") #adds element to the beginning of an array (index 0)

arr.insert(3, "thing") #adds element to the specified index (in this case index 3)
```

Remove from an array:

```ruby
arr.pop
=> last element in array #removes and returns the last element

arr.shift
=> first element in array #removes and returns first element - (index 0)

arr.delete_at(2) # delete element at a particular index in this case 2

#special removal:
arr.compact #removes all nil values from the array
arr.uniq #removes all duplicate values in the array
```

Access array elements:

```ruby
a = ('A'..'G').to_a
=> ["A", "B", "C", "D", "E", "F", "G"]

a[0]
=> "A"

a[-1]
=> "G"

a.first
=> "A"

a.last
=> "G"

a[2..4]
=> ["C", "D", "E"]
```


**Array Methods** - continued

* Transforming arrays. Array#map and Array#collect both have the same effect on arrays.  The (argument?) code within the curly braces following the method determine the effect.  For example:

**Array#map** - The code inside map’s braces (a block) assigns a temporary variable to the array’s elements one at a time and executes code on that variable.

```ruby
[1, 2, 3, 4, 5].map { |i| i + 10 }
=> [10, 11, 12, 13, 14, 15]

```

Array#Filtering an Array an array according to a Boolean expression using Array#select again uses the code in the braces following the method:

```ruby
names = ['rock', 'paper', 'scissors', 'lizard', 'Spock']
names.select {|word| word.length > 5}
=> ["scissors", "lizard"]
```

Again, the code in the braces assigns a temporary variable ‘word’ to the elements in the array. It then measures the length of that element against  an integer returning a Boolean value. A word will only be selected if the block evaluates to true.


An array within an array is sometimes called a 2 dimensional array or a matrix. An array of arrays will print all the elements in each array. To access individual elements inside an array use `arr[outter_arr][inner_arr]`

```ruby
rect1 = [[[1, 1], [8, 4]], [[5, 6], [3, 1]]]

p rect1[0][1][0]
=> 8
```

  * you can flatten these nested arrays by using the method #flatten. To use a method like ‘map’ or ‘each’ on a matrix you have to nest the method the same number of levels that are in the array.

```ruby
rect1 = [[[1, 1], [8, 4]], [[5, 6], [3, 1]]]
rect2 = []
rect2 = rect1.map {|outter_arr| outter_arr.map{|mid_arr| mid_arr.map {|inner_arr|
inner_arr + 2}}}

p rect1
=> [[[1, 1], [8, 4]], [[5, 6], [3, 1]]]

p rect2
=> [[[3, 3], [10, 6]], [[7, 8], [5, 3]]]
```

  * `.max` and `.min` are **enumerable** methods and will find the greatest and least
  values in an array. Same as `.sort.pop` and `.sort.shift`


**Hash** - Hash tables exist in curly braces (like a block of code? Are they a block?) Hash tables are like an array? In an array, the index is invisible but always the same (it is inherent or implied?). They always have the same default index system: `0, 1, 2, 3..`       A hash table’s index can be defined along with the values it contains. If a restaurant menu was represented as a hash table then the index could be made up of the item names and the values they point to could be the price. Index location (called a key) "chicken_sandwich" could point to the value $5.65. In an array you can find a value associated with an index location. In a hash table you find a value associated with it’s key.

Some things to remember about Hash tables:

* all keys in the same level of a Hash table must be unique:

```ruby
pets = {:pet => {:name => 'Steve', :species => 'cat', :age => 8},
        :pet => {:name => 'bill', :species => 'dog', :age => 2}}

# warning: key :pet is duplicated and overwritten on line 1
pets
=> {:pet=>{:name=>"bill", :species=>"dog", :age=>2}}


more_pets = {:cat => {type: :pet, :name => 'bob', :age => 3},
             :dog => {type: :pet, :name => 'frank', :age => 9}}

more_pets
=> {:cat=>{:type=>:pet, :name=>"bob", :age=>3},
    :dog=>{:type=>:pet, :name=>"Ann", :age=>9}}
```


* To create an empty hash:

```ruby
hsh = {}
=> {}

hsh = Hash.new
=> {}
```

* Populated hash:

```ruby
hsh = {"noodles" => 8, "tea" => 3}
=> {"noodles" => 8, "tea" => 3}

hsh = Hash["a", 1, "b", 2]
=> {"a" => 1, "b" => 2}


def artax
  a = [:punch, 0] #two elements to be turned into a key value pair
  b = [:kick, 72]
  c = [:stops_bullets_with_hands, false]
  key_value_pairs = [a, b, c]

  test = Hash[key_value_pairs]
end

artax
=> {:punch=>0, :kick=>72, :stops_bullets_with_hands=>false}


hash_test = {}
hash_test[key1] = 1
hash_test[key2] = 2
p hash_test
=> {key1=>1, key2=>2}
```


* Add/remove and access key value pairs in a hash:

```ruby
#add to a hash:

hsh = {"a" => 1}
hsh["b"] = 2

hsh
=> {"a" => 1, "b" => 2}
```

* Hash default values:

```ruby

normal = {} #creates an empty hash. no keys or values.
not_there = normal[:wig]
#not_there is assigned to the value paired with the key ':wig' inside 'normal'

normal
=> {}

puts "Wasn't there:"
=> "Wasn't there:"

not_there
=> nil
#‘not_there’ points to the hash value of ‘normal’ at its key ‘:wig’ which is nil
#nil is the default value for nonexistent values


usually_brown = Hash.new("brown") #the empty hash is given a default value
pretending = usually_brown[:zig]

puts(usually_brown)
=> {}

pretending
=> "brown"
#the nonexistent hash key contained in ‘pretending’ is evaluated and returns ‘brown’
```

* Make a populated hash using #map method. Creates a Hash called cats with keys from 1 - 100 (generated from a range) pointing to a value (in this case the string "no hat")

```ruby
cats = Hash[(1..100).map { |cat| [cat, "no hat"] }]
cats
=> {1=>"no hat", 2=>"no hat", 3=>"no hat", 4=>"no hat"...100=>"no hat"}
```

General
-------

**Gem** - A Ruby Gem is a packaged Ruby library. Packaging makes it easy to manage, download, install, update, remove, etc. Gems are handled by RubyGems, a package manager of sorts for gems.


**Bundler** - Bundler allows you to make your app more portable by automatically installing required gems listed in your Gemfile. Bundler is itself a gem and uses RubyGems to find, download and install required gems. Bundler is helpful because if you move your application to a new location you can ensure that all required gems will be installed when `bundle install` is run.


**tIDENTIFIER** - or `tINTEGER`, `tSTRING`. These are words in standard Ruby syntax error messages meant to help you debug your code. They hint at the type of object that the interpreter encountered and caused an error They usually appear in a form similar to:

```ruby
> 8 e 9
SyntaxError: unexpected tIDENTIFIER, expecting end-of-input
8 e 9
   ^
```


**Colons Before and After Variables/Attributes** -


**::, #, :** -

* `::` - denote class or module constants,
* `:` - some thing
* `#` - other things


**Private v. Protected Methods** -


**Options Hash** -


**heredoc** - Generally, a Here Document, or heredoc, is an input stream in a programs source code that is treated like a separate file. It is a delimited chunk of text that the program can read in like a string and interpret as code. The benefit of using a heredoc is that the 'body' of the heredoc can be formatted in a way that is native for its content.

In Ruby, begin the input of a heredoc with a`<<`, `<<-` or `<<~`.

* With `<<` the delimiters must start on the first column or they will be included in the heredoc.
* Use `<<-` to begin and end with delimiters starting on any column.
* `<<~` omits common indentation in the heredoc.

Follow the beginning symbol with a delimiter keyword, then write the body of the heredoc appropriately formatted and end it with the same delimiter keyword.

* HTML heredoc

```ruby
@doc = <<-HTML
<body>
    <H1>Your Big Headline</h1>
    <div class="content">
        <p>Your important content</p>
    </div>
</body>
HTML

```

* SQL heredoc

```ruby
query = <<-SQL
SELECT
  *
FROM
  animals
JOIN
  anecdotes ON aecdotes.animal_id = animals.id
SQL
```


**Constants** - Constants are declared in ALL CAPS:

```ruby
CAR_COLORS = ["red", "green", "black"]
```
  Constants are accessible....


**Instance Variables** - Declared using the `@` sigil.

```ruby
@instance_var = 99
```

**Sigils in Ruby** - Sigils are the non-alphanumeric characters that decorate variables in Ruby. They always go before a variable.

* *no sigil* on a variable means it is a plain local variable.

* *@* makes a variable an **instance variable**
These variables are variables that belong to a particular object instance.

* *$* sigil makes a variable global - valid everywhere in the script.
But these are not **Constants**. Call the method `global_variables` to see all assigned global variables.

* *@@* are for **class variables**. These are shared among objects of a class. If one object instance changes the value of the variable, that new value will essentially change for all other object instances.

* *Double Underscores* the double underscores that surround certain variables indicate that the variables are special and should not be overwritten. `__FILE__` is a special variable that reffers to the actual file that is being interpreted. Calling `__FILE__` will prnt the name of the fil.


**begin/rescue/end blocks in Ruby** - In Ruby, the `rescue` clause is used along with `begin` and `end` to define blocks of code that handle exceptions. For example:

```ruby
> begin
>   puts 10 / 0
> rescue
>   puts "You caused an error!"
> end

=> You caused an error!
```

`begin` and `end` define a section of code to be run wherein if an exception occurs, it's handled by the code inside the rescue block. If the following code had been run:

```ruby
> puts 10 / 0

test.rb:1:in `/': divided by 0 (ZeroDivisionError)
```

Which is an error that will crash a program. The `rescue` block prevents a crash by running its code (in this case, just printing a message) instead of exiting the application.

This gets to why using different exception classes is important and why the ability to create custom exception classes is super functional. With `rescue`, different exceptions can be handled differently. For example, the above code causes `ZeroDivisionError` which you might want to trigger a certain message as opposed to a `NameError` which will trigger something else.

```ruby
> begin
>   #code...
> rescue ZeroDivisionError
>   puts "You caused an error!"
> rescue NameError
>   puts "you caused a different error and here's why..."
> end
```

The above code will output different messages depending on what exception is rescued.


**Naked Rescue** - I believe this means rescuing without referencing a specific type of exception?


**Thoughts on Methods** - A *method* is a basic Ruby command. Methods are *called* or *invoked* on to objects. When we call a method, we always use the format *object.method* (like noun.verb). `puts` is one of the most basic Ruby commands. `puts` tells ruby to print out a *string*, numbers, or an *array*.

* `gets`, `to_i`, and `to_s` are also methods. `chomp` is a method that removes the newline character from the end of a string. Methods can be combined by placing a `.` between them.

    `gets.chomp` calls the `gets` method to get user input and then calls the `chomp` method on that input. `gets.chomp.to_s` and `gets.to_s.chomp` give the same result. I don’t know if the order of methods is always arbitrary. Some methods, like `puts` need an argument. `chomp` and `gets` do not need arguments.  `gets().chomp().to_s()` is read the same as `gets.chomp.to_s`.

* More on the `chomp` method. `name = gets.chomp` produces a new string without the newline; it does not modify or change the original string.  After using `name = gets’ using `name.chomp’ and then calling on `name` does not have the same effect. `name.chomp` creates a new string that is not called on when we simply call the variable `name`. `puts("Hello " + name.chomp + "!")` creates a new string and uses it immediately giving the same effect as using ‘name = gets.chomp’ but the original variable ‘name’ still contains the string with the newline character.  In IRB. When I create a new method in the main:Object (top level, "irb(main):01" right after opening a new irb session), it has the following properties:

```ruby
def is_a_string
  string_in_this_method = "Im a string in the \"is a string\" method."
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

* The new method is not in `String.methods` or in `hh".methods` (an instance of string).
* The new method *is* in `String.private_methods` and `hh".private_methods`
* The new method is *not* in `String.instance_methods`
* The new method is in `BasicObject.private_methods`

So where and when can this method be called? I can call it in `main:Object`

```ruby
irb(main):087:0> is_a_string
Im a string in the "is_a_string" method.
=> "Im a string in the \"is_a_string\" method."
irb(main):088:0>
```

So it can be called from within objects??

If I call it on a String object:

```ruby
irb(main):088:0> "literal".is_a_string
NoMethodError: private method 'is_a_string' called for "literal":String
    	from (irb):88
    	from C:/Ruby22/bin/irb:11:in `<main>'
irb(main):089:0>
```

I’m pretty sure the new method is a private method of all classes and objects.

If I open up the String class and make a new method inside of it:

```ruby
irb(main):106:0> class String
    irb(main):107:1> def string_method_test
        irb(main):108:2> is_a_string
        irb(main):109:2> puts self
        irb(main):110:2> "hi there"
    irb(main):111:2> end
irb(main):112:1> end
=> :string_method_test
```

I *can not* call `string_method_test` inside `main:Object`

```ruby
irb(main):113:0> string_method_test
NameError: undefined local variable or method 'string_method_test' for main:Object
    	from (irb):113
    	from C:/Ruby22/bin/irb:11:in `<main>'
```

I *can* call it on a string object:

```ruby
irb(main):114:0> "h".string_method_test
Im a string in the "is_a_string" method.
h <= this is the result of "puts self" inside the method definition.
=> "hi there"
```

The new method `string_method_test` *is* in `String.instance_methods` and *is* in ""string literal".`methods`

The `string_method_test.class` returns String. Because I put it in the String class? Or because the return value is a string? *I think it's because it returns string*.

Make a new method called `method_test_returns_fixnum` inside the String class

```ruby
irb(main):126:0> class String
irb(main):127:1> def method_test_returns_fixnum
irb(main):128:2> is_a_string
irb(main):129:2> puts self
irb(main):130:2> 4 + 4
irb(main):131:2> end
irb(main):132:1> end
=> :method_test_returns_fixnum
```

Running `method_test_returns_fixnum` on a string returns:

```ruby
irb(main):141:0> "string?".method_test_returns_fixnum
Im a string in the "is_a_string" method.
string?  <= this is the result of "puts self" inside the method definition.
=> 8
```

`.class` on the above expression returns `Fixnum`. Of course methods in the String class can return a `Fixnum`. Just like calling `.length` on a string.
Just like running `.to_s` on an integer returns a string, even though "to_s" is a method in the `Fixnum` class ( and an instance method).

Methods have to be called on an object. When I define a method in `main:object`, at the top level of IRB, and call it, it’s being called on the `main:Object`

Methods have a "receiver" , which is the data object to the left of the method being invoked.
* In the expression x.y (object.method) x is the receiver of y.
* For private methods the receiver is always "self"


**Private Methods** - Private methods are always called on `self` in the context of the current object. If i enter `string".private_methods` I can see an array of private methods associated with string objects. These cannot be called on the string object itself ( `string.global_variables` for example ) but must be invoked on self *within the context of the string object*. I think when public or other methods are called on a string object, behind the scenes, Ruby jumps into the context of the string object and invokes its private methods to return the requested data which may be a string, fixnum, or an array. (Integer and Array are both private methods of string objects, btw)

This is why you can use main:Object private methods initially in Ruby. You start off in the context of the main object and can use private methods (like puts and rand) to return data.


**Adding `self` in front of method names when defining** - When adding a method to a class what you are usually making are `instance methods` that can be called on instances of that class. Class methods can be called on the class itself. For example `.new` can be called on a class itself to instantiate an object of that class. When defining methods inside a class, add `self` (for example `self.celsius_to_fahrenheit`) to the front of the method name to make it a class method. Now you can call `Temperature.celsius_to_fahrenheit` (on the class itself as opposed to a temperature object).

**Passing a symbol or a method to a method instead of a block.** - Some methods, like #each, #each_cons and #map, can take blocks of code as a parameter.  As a shortcut, these can also take a unary (only operates on one value(operand). Doesn’t combine or return something from 2 values. Like #succ only increases the value of one number by one. It doesn't need more operands.) method or operator as a symbol to achieve the same effect.  Must be a method or instance method of the object?

For Example:

```ruby
%w(1 2 3 4 5 6 7 8 9).map(&:to_i) == %w(1 2 3 4 5 6 7 8 9).map { |e| e.to_i }

(1..99).map(&:chr) == (1..99).map { |n| n.chr }
```


**Operators** - are traditional mathematical items such as +, -, * and /. These are also *methods*. + = .+ , - = .- etc.

```ruby
10 = 5.+(5)
=> 10 = object.method(argument)
```

**Operands** - These are the objects operated on by operators. In `a + b = c` `a`, `b`, and `c` are operands.

**Modulus** - The `%` operator, called the modulous gives the remainder of two numbers. In Ruby, the following work:

```ruby
8 % 2
=> 0

2 % 8
=> 2

8 % -2
=> 0

-2 % 8
=> 6
```

**Variables** allow you to store data in an *object* (strings, numbers, arrays). *Variables* are  *assigned*. A variable name consists of letters and numbers. It must start with a lowercase letter. It cannot contain spaces. Variables ARE NOT THEMSELVES OBJECTS (They CAN be objects, though?). Variables are names that point to values? The value is the Object.


**Argument** - An *argument* is the data that is passed into a *method*. In `puts("yo!")` `puts` is the method and `` "yo!" `` is the *argument*. If a method requires an argument it must have parentheses ( ‘puts()’ for example). Some methods don’t require an argument and therefore don’t need parentheses (‘gets’ for example can be written by itself.


* *if* statements. The if test is really saying "if true, go to body and run code. If false go to end.

* *code branching* is what allows your program to do different things depending on different conditions. By using `if`, `else`, and `elsif`, for example.

```ruby
puts("Type in a number")

#In one line, we use `gets` to read a string from the user, then
#immediately call `to_i` on the string to return an integer.

num = gets.to_i

if num < 10
  puts("That's not a big number!")
end

puts("Thanks for typing in a number!")
```

* The if has two parts: the *conditional* `num < 10` and the *body* puts `("That's not a big number!")`. The test should be a Ruby expression that returns true or false. The body can be multiple lines long. The special keyword end indicates the end of the body. If the test is true, Ruby will run the code in the body. If the test is false, Ruby will skip it. In this example, if the user types a number less than ten, the program will tell them it is not a big number. Regardless whether the number is big or small, the program will thank them.

```ruby
puts("Type in a number")
num = gets.to_i

if num < 10
  puts("That's not a big number!")
else
  puts("Wow, that's a big number!")
end

puts("Thanks for typing in a number!")
```

* By using the *else* keyword, we create a second body that will run only if the above *if* test is false. *if* false then go to *else* then to end. *if true* then go straight to end. When *if* is true it always goes to the end of it’s body, skipping all the else or `elsif` statements.of it’s body, skipping all the else or `elsif` statements.of it’s body, skipping all the else or `elsif` statements.

* *&&* and *||* are both *logical connectives*. In `if (x) && (y)` the if test will return true only when both x and y are true. We then move straight to the end of the body. In `if (x) || (y)` the *if* test returns true when either x or y are true.

* About expressions in parentheses. Expressions in parentheses are one (object or argument?). ‘number == (7 || 13)’ does not read "Number is equal to 7 or 13". Instead, Ruby will compare ‘number’ to everything in the parentheses at once (similar to the order of operations, or PEMDAS?). In Ruby the || method works left to right, returning when it finds something that reads as true. In ‘(7 || 13) Ruby asks, is the right operand (7) true? Any number besides ‘nil’ or ‘false’ is inherently true, so Ruby returns 7. So, if ‘number’ equals 13 the statement ‘number == (7 || 13)’ will return false because ruby thinks it is being asked if number == 7. The correct if statement is ‘if (number == 7) || (number == 13)’. ‘if (number == 7 || number == 13)’ also seems to work.


* Data structures: integers (numbers) and strings are data structures (types?). Not sure where floats, and other types fall into this.

* An array is another data structure. Arrays store a sequence of objects separated by commas ‘[1, 2,...]’. The index of the array is the position of the items in the array. ‘puts(cool_things[0])’ prints item at index 0, which is the first item in the array. Array indices always start at zero. An array with 4 items will have an item at index 0, 1, 2, and 3.  We can use the length method to return the number of items in a array as an integer ‘array.length’.

* To create a new method we use the method ‘def’ followed by the body and ending with ‘end’. Anything in the body (loops, statements, etc…) will not be run until the method is actually called.

* To return a value from a method we use the `return` keyword before the end of the defined method. `return` goes in the method body. It can go anywhere in the body and will always break us out of the method, whether it’s returning a value or not. In the following:

The caller will give the input `number_of_squares`; this method will return an array consisting of the squares for numbers from 0 up until the number specified by 'number_of_squares'.


```ruby
def first_square_numbers(number_of_squares)
  squares = []

  idx = 0
  while idx < number_of_squares
    squares.push(idx * idx)
    idx = idx + 1
  end

  return squares
end

puts("How many square numbers do you want?")
number_of_desired_squares = gets.to_i
squares = first_square_numbers(number_of_desired_squares)

idx = 0
while idx < squares.length
  puts(squares[idx])
  idx = idx + 1
end

# Output:
#   How many square numbers do you want?
#   7
#   0
#   1
#   4
#   9
#   16
#   25
#   36
```


* The array `squares` is returned by the method `first_square_numbers`.  The variable `squares` is assigned in the actual program after the method is defined. It is populated with whatever the return of the method `first_square_numbers` is. Inside the method, another variable called squares is assigned. This contains the value that is eventually returned but it is actually a whole new variable and could be named anything (a local variable I think?).

* *Breaking out of loops* the `break` command (keyword?) is used to break out of normally infinite loops.


**return** - Returns a value and exits a method. More accurately, `return` is a *keyword* that takes an argument (`nil` by default) and exits the method early with that value.

```ruby
def hi(a)
  b = a * 3
  return "whatever"
  b
end

hi(3)
=> "whatever"
```
A method will always return the value of the most recent evaluated statement inside that method but `return` can be used to exit a method early if a conditional statement is satisfied, for example. You can also `return` multiple values from a method

```ruby
def foo(a, b)
    return a, b
end

foo 3, 5
=> [3, 5]
```


**Interpolation** - Interpret variables and blocks of code inside a string. The string must be enclosed in double quotation marks for interpolation to work

```ruby
a = 1
b = 4
puts "The number #{a} is less than #{b}"

=> "The number 1 is less than 4"


def string_length_interpolater(argument_string)
  "The string you just gave me has a length of #{argument_string.length}"
end

string_length_interpolater("Hello there!")

=> "The string you just gave me has a length of 12"
```


**Placeholders** are not just variables. Any valid block of Ruby code you place inside ``#{ }`` will be evaluated and inserted at that location. A String literal created with single quotes does not support interpolation!


**Concatenating Strings**. Adding two strings together is called concatenation. To create a new string by adding two together:

```ruby
'Ruby' + 'Monk'
stdout:

RubyMonk
```

  * The literal and expressive method for String concatenation is **String#concat:** `'Ruby'.concat(‘Monk’) = ‘RubyMonk'`

  * You can use `<<` just like `+` but in this case the String object `‘Monk’` will be appended to the object represented by `‘Ruby’` itself. In other words, when you run `‘Ruby’ + ‘Monk’` you’re left with a new string `‘RubyMonk’` in addition to the two sub strings. Using `<<` leaves you with just one string. It’s like using **Array#push** to add new elements to an array.

**Regular Expression** or **RegEx**. Used to match particular characters, words, or patterns of characters. In Ruby you specify a RegEx by putting it between a pair of forward slashes ` / `. RegExs seem a little crazy. Apparently all of these work:

```ruby
'RubyMonk'.gsub(/[aeiou]/,'1')
```
replaces all the vowels in the string with the character 1. The RegEx interprets #‘/[aeiou]/’ as an array containing all the vowels? Somehow interprets the pattern?

```ruby
'RubyMonk Is Pretty Brilliant'.gsub(/[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/,'0')
```
replaces all the Uppercase characters in the string with the character 0.

```ruby
'RubyMonk Is Pretty Brilliant'.gsub(/[A-Z]/,'0')
```
This also works and is shorter. Does the RegEx do special interpretation on [A-Z] or is that a standard way to express an array containing characters a through z?

```ruby
'RubyMonk Is Pretty Brilliant'.gsub(/[BIMPR]/,'0')

'RubyMonk Is Pretty Brilliant'.gsub(/[B-R]/,'0')
```
These both work, too.

  * If you want to find something specific but you’re not sure what, RegEx come in handy. The String#match method converts a pattern to a RegEx (if it isn’t one already) and then invokes its match method on the target String object. Here is how you  find the characters from a String which are next to a whitespace:

```ruby
'RubyMonk Is Pretty Brilliant'.match(/ ./)

=> #<MatchData " I">
```

The pattern that `.match` uses in this case is (/ ./) to indicate a character preceded by a whitespace. (‘ .’) will also work because #match converts it into a RegEx

```ruby
'RubyMonk Is Pretty Brilliant'.match(/ ./, 10)
```
You can also pass a second argument to the match method. The second parameter of `10` specifies the position in the string to begin the search.

**Looping** - Using while and then giving a condition will run the loop as long as the while test is true. When  while is false, the program will jump to end. While this thing is true, run the loop and when it is false jump to end.
* The do keyword can be used to initiate loops:

```ruby
def ring(bell, n)
  n.times do
   bell.ring
  end
end
```
 This loop will run n number of times then stop


**Literal**. The term "literal" comes from the fact that you have written data literally into your program, i.e. exactly as written, not hidden behind a variable name. A literal is a notation for  representing a fixed value in source code. It is some data that is presented directly in the code, rather than indirectly through a variable or function call. The data constituting a literal cannot be modified by a program, but it may be copied into a variable. When creating a variable and populating it with the integer 8, the variable is not a literal but the integer that it points to is? In the following, 1 is an integer literal and the three letter string in "cat" is a string literal:

```ruby
int a = 1;
String s = "cat";
```
A literal is hard coded directly into source code as opposed to being called from or created in memory at run time.

**each** enumerable method and keyword `do`. ‘do’ is a keyword for creating loops in Ruby. `String#each_char` and `Array#each` call a block on to each character in the String or each element in the Array. The element or character must be represented in the block as a parameter in between the "double pipes" ||. `do` itself (concluded by `end`) contains the block of code.

```ruby
array = [1, 2, 3, 4, 5]
array.each do |i|
  puts i
end
stdout:
1
2
3
4
5

"hello".each_char {|c| print c, ' ' }

produces:
h e l l o
```

The block can be between braces or inside of `do`.

**Enumerable**. A Ruby module (collection of methods and constants mixed into other classes. See module vs Class here: https://lh4.googleusercontent.com/e_Eml6aYg1udItOLjQCzUKF1L2K1JcjyZTnzYwcP7A=w1530-h800-no (Modules are about providing methods that you can use across multiple classes. Classes are about objects; modules are about functions.) ‘map’ and ‘each’ are inside enumerable. Enumerable is mixed into the Array and Hash classes.


Use map to get a modified array based on the code block. Use ‘each’ for its side effects (such as printing each element or pushing it into another array.)


* A `Range` is a different class than `Array` but also mixes in enumerable. `Range` also works for strings?

```ruby
(1..5).each do |i|
    p i
end
=> 1, 2, 3, 4, 5

(1...5).each do |i|
    p i
end
=> 1, 2, 3, 4
```

```ruby
nums = (1..10)
puts nums
=> 1..10

nums_arr = Array(1..10)
puts nums_arr
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

char = ("a".."e")
puts char
=> a..e

char_arr = Array("a".."e")
puts char_arr
=> [a, b, c, d, e]
```

**Argument vs parameter** - An argument is a single value to give to a method. For example for an array `a.index("x")`  "x" is the argument. A parameter is like a mini variable that will given a new value when iterated over. For example a.each `{|i| puts i}` i is the parameter.
