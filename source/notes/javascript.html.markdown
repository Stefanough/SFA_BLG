---

title: JavaScript
date: 2018-02-02 09:48 UTC
tags:

---

**Array.prototype.sort()** - Sorts the elements of an array in place and returns the array. `sort` can take an optional compare function but by default, it will turn given elements into strings (yes, even numbers are converted into strings) and sort them by their Unicode values from least to greatest:

```javascript
var arr = [20, 3, 1000];

console.log(arr.sort());

> [1000, 20, 3]
```

When `.sort` is passed a compare function, elements are sorted based on its return value. Values are not actually returned as `true` or `false` but greater than zero, less than zero, or zero?

```javascript
function leastToGreatest(a, b) {
    return a.length > b.length
}

function greatestToLeast(a, b) {
    return a.length < b.length
}

var arr = ["cat", "lizard", "gecko", "me", "I", "facehugger", "bird"]

console.log(arr.sort(leastToGreatest));
> [ 'I', 'me', 'cat', 'bird', 'gecko', 'lizard', 'facehugger' ]

console.log(arr.sort(greatestToLeast));
> [ 'facehugger', 'lizard', 'gecko', 'bird', 'cat', 'me', 'I' ]
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
> 9

console.log(y);
"was not assigned"
```
