---

title: JS Cheat Sheet
date: 2018-02-04 03:50 UTC
tags:

---

Don't forget these:

**Array element iteration** - Iterate over and access the actual elements in an array.

```javascript
let myArr = ["a", "z", "b", "y"];

for (let e of myArr) {
    console.log(`${e}`);
}
// → a
//   b
//   z
//   y

myArr.forEach(function(e) {
    console.log(`${e}`);
});
// → a
//   b
//   z
//   y
```

**Array indices iteration** - Iterate over and access the indices of an array.

```javascript
let myArr = ["a", "z", "b", "y"];

for (let i in myArr) {
    console.log(`${i}`);
}
// → 0
//   1
//   2
//   3
```
**Object property iteration** - Iterate over and access properties of an object.

```javascript
let obj = {here: {is: "an"}, object: 2};

for (var prop in obj) {
    console.log(prop);
}
// → here
//   object

for (var prop of obj) {
    console.log(prop);
}
// → TypeError: obj is not iterable
```

**Check if Object contains property** - 

```javascript

let obj = {here: {is: "an"}, object: 2};

"here" in obj;
// → true

"there" in obj;
// → false
```
**Files in your REPL** - 

```javascript
> require('./path/to/file.js');
// or
> .load file.js // inputs a file line by line as if it was entered manually
```

**Comparison Operators** - `==` less strict, typecasting 'abstracted' comparison. `===` strict equality, no typecasting

**Functions** - Different ways to create a function:

```javascript
// function declaration
function tstFnc() {
    console.log("hi");
};

// function expression
let tstFnc() = function() {
    console.log("hello");
}

// function expression from arrow notation
let tstFnc = () => console.log("hey")

// function expression as a method inside an object
let tstObj = {
    type: "test object",
    tstFnc: function() {
        console.log("hi");
    }
};
```

**Read From File** - In the node repl, read data from a plain `.txt` file:

```javascript
var fs = require('fs');
let names;

fs.readFile('names.txt', 'utf8', (err, data) => {
    if (err) throw err;
    names = data;
});
```

`fs` is the file system module which provides an API for interacting with the system's file system. The `readFile` function takes the file name, optional encoding, and a callback. If no encoding scheme is specefied, raw data is returned. Read more about it at the spec [here](https://nodejs.org/api/fs.html#fs_fs_readfile_path_options_callback)
