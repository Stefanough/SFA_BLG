---

title: Ruby
date: 2017-12-08 07:39 UTC
tags: 

---


* **Gem** - A Ruby Gem is a packaged Ruby library. Packaging makes it easy to manage, download, install, update, remove, etc. Gems are handled by RubyGems, a package manager of sorts for gems.

* **Bundler** - Bundler allows you to make your app more portable by automaticaly installing required gems listed in your Gemfile. Bundler is itself a gem and uses RubyGems to find, download and install required gems. Bundler is helpful because if you move your application to a new location you can ensure that all required gems will be installed when `bundle install` is run.



* **<<** -  fix `<<` count → integer Shifts fix left count positions, or right if count is negative.

  `3 << 4 => 48` double 3 4 times (6, 12, 24, 48)

* **tIDENTIFIER** -

* **Colons Before and After Variables/Attributes** -

* **::, #, :** -
  `::` denote class or module constants,
  `:`
  `#`

* **Private v. Protected Methods** -

* **Options Hash** -

* **Here Doc** -

* **Constants** - Constants are declared in ALL CAPS:
  ```ruby
    CAR_COLORS = ["red", "green", "black"]
  ```
  Constants are accessible....

* **Instance Variables** - Declared with `@`
  ```ruby
    @instance_var = 99
  ```

* **Arrays** - [], Array.new, %w(el_1 el_2 el_3)

* **Ternary Conditional** -
  ```ruby
    var == if_var_equals_this ?            do_this            :        else_do_this
             <condition>      ? <result if condition is true> : <result if condition is false>

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

