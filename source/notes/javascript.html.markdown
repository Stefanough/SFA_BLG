---

title: JavaScript
date: 2018-02-02 09:48 UTC
tags:

---

**Array.prototype.sort()** - Sorts the elements of an array in place and returns the array. `sort` can take an optional compare function but by default, it will turn given elements into strings (yes, even numbers are converted into strings) and sort them by their Unicode values from least to greatest:

```javascript
var arr = [20, 3, 1000];

console.log(arr.sort());

// → [1000, 20, 3]
```

When `.sort` is passed a compare function, elements are sorted based on its return value. Values are not actually returned as `true` or `false` but greater than zero, less than zero, or zero?

```javascript
function leastToGreatest(a, b) {
    return a.length > b.length
}

function greatestToLeast(a, b) {
    return a.length < b.length
}

var arr = ["cat", "lizard", "gecko", "me", "I", "face hugger", "bird"]

console.log(arr.sort())
// → [ 'I', 'bird', 'cat', 'face hugger', 'gecko', 'lizard', 'me' ]

console.log(arr.sort(leastToGreatest));
// → [ 'I', 'me', 'cat', 'bird', 'gecko', 'lizard', 'face hugger' ]

console.log(arr.sort(greatestToLeast));
// → [ 'face hugger', 'lizard', 'gecko', 'bird', 'cat', 'me', 'I' ]
```

* For the above example using `leastToGreatest(a, b)`, we are testing whether `a` &gt; `b` where `a` == "cat"  and `b` == "lizard". The statement will evaluate to `false` and a less than zero value will be returned. `a` will be indexed lower than `b` in this case. Replacing `a.length > b.length` with `a.length - b.length` in the function will give the same result.

* For `greatestToLeast(a, b)`, if we are testing whether `a` &lt; `b` where `a` == 'cat' and `b` == 'lizard', the statement will evaluate to `true` and a greater than zero value will be returned. `a` will be indexed higher than `b` in this case. Replacing `a.length < b.length` with `b.length - a.length` in the function will give the same result.


* In general, to sort from 'least' to 'greatest' make sure the comparison involving `a` and `b` evaluates to `false` or a value less than zero. To sort from 'greatest' to 'least' make sure the comparison involving `a` and `b` evaluates to `true` or a value greater than zero.


**Ternary Assignment** - Use the ternary operator `?:` to check if a variable has been assigned and if it has, maintain its value while if it hasn't, assign it a value.

```javascript
var x = 9;
x = x ? x : "was not assigned";

var y;
y = y ? y : "was not assigned";

console.log(x);
// → 9

console.log(y);
// → 'was not assigned'
```

**Arrow Assignment** - I'm used to declaring functions the following way:

```javascript
function gridMe(x) {
    return `${x} ${x}\n${x} ${x}`
}

console.log(gridMe("@"));
// → @ @
//   @ @
```
Arrow notation `=>` is a syntax for declaring functions. The `=>` comes *after* the list of parameters and is followed by the function body. It's kind of 'pointing' or 'directing' the parameters into the function body. Arrow notation provides some other shortcuts as well. If there is only one parameter, no enclosing parenthesis are required and if the function body only contains a single expression, a `return` keyword is not required. The value of the expression is automatically returned (like in Ruby! yay!)

```javascript
gridMe2 x => `${x} ${x}\n${x} ${x}`;

console.log(gridMe2("^"));
// → ^ ^
//   ^ ^
```
Despite the shortcuts, all the pieces of a function declaration (parameter, function body) are present. Function declaration with arrow notation might be really useful for passing in-line functions into methods?

```javascript
let arr = ["cat", "lizard", "gecko", "me", "I", "face hugger", "bird"];

arr.sort((a, b) => a.length > b.length)
// → [ 'I', 'me', 'cat', 'bird', 'gecko', 'lizard', 'face hugger' ]

/*is equivalent to*/

arr.sort(function leastToGreatest(a, b) {
    return a.length > b.length
})
// → [ 'I', 'me', 'cat', 'bird', 'gecko', 'lizard', 'face hugger' ]
```

**EJS Closure** - Stepping the closure example in *Eloquent JavaScript* 3rd ed.

```javascript
function multiplier(factor) {         //declare function multiplier with parameter factor
    return number => number * factor; //return a function created with arrow notation
}

let twice = multiplier(2);
console.log(twice(5));
// → 10
```

The value being returned from the function `multiplier` is a function:

```javascript
console.log(multiplier(2));
// → [Function]
```

When the return value of `multiplier` is bound to `twice`, its not just a number or string that is being wrapped up in the binding but a value that is a function with its own internal logic and environment that is defined at the time of binding.

The function being returned from multiply is equivalent to:

```javascript
function(number) {
    return number * factor;
}
```

The functions environment is set at the time of binding. `factor` is set to `2` when the return value of `multiplier` is bound to `twice` with the line

```javascript
let twice = multiplier(2);
```

Now that `twice` bound to a function, it can be called like one. `console.log(twice(5))` sets the parameter `number` to five and an integer can be returned.


**Object Properties: [] vs . notation** - An objects properties can be accessed with either bracket `obj[property]` notation or dot `object.property` notation. In general, I think bracket notation is used for property names defined or coming from *outside* the object and dot notation is used for property names defined *inside* the object. With bracket notation, the brackets are *evaluating* the property name contained within and if that property name is a string or a binding holding a value it will try to match it to a property in the object. If you want to access an object property or define a new property with a string bracket notation must be used. To access an object property explicitly, dot notation can be used.

```javascript
let obj = {type: "little object"};

console.log(obj.type);
// → 'little object'
console.log(obj["type"]);
// → 'little object'
console.log(obj[type]); //type is not a binding defined outside the object
// → ReferenceError: type is not defined

let t = "type";

console.log(obj[t]);
// → 'little object'
```

**Function Declarations vs Expressions** -

```javascript
function tstFnc() {  // Example of a function DECLARATION
}


let tstFnc = function() { // Example of a function EXPRESSION
}

let tstObj = {
    type: "test object",
    tstFnc() {
        console.log(this);
    }
}
```

**This** - `this` always refers to the wrapping environment of where `this` is being evaluated? `this` is passed implicitly to functions when they are called - in effect telling the function "`this` does not point to the wrapping scope, instead it's pointing to this implicit parameter that's being passed to you."

```javascript
function print(line) {
    console.log(`The ${this.process} prints ${line}`);
}

let thing = {process: thing, print};

thing.print("hi");
// → The thing prints 'hi'

print("hello");
// → The [Object process] prints 'hello'
```

In the above example, the function `print` is declared and takes a string as an argument. It prints a string including the property called `process` of the object that `print` is called on or that is implicitly passed to it. When `print` first called, `this` points to the object (created with the property `process`) it is called on. The second time, `this` points to the wrapping scope(?) which in this case is the Node.js interpretor environment.

**Function declarations and .this binding** -

```javascript
function normalize() {
    console.log(this.coords.map(function(n) {
        console.log(this);
    }));
}

function normalize2() {
  console.log(this.coords.map(() => console.log(this)));
}

normalize.call({coords: [3], length: 5});


normalize2.call({coords: [3], length: 5});
```

**Function.prototype.call()** - Calls a function within the context of a specified object (a specified `this` value).
