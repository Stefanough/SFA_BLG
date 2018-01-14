---

title: CSS
date: 2017-12-14 22:02 UTC
tags:

---

<br>**CSS** - Stands for Cascading Style Sheets. CSS is a domain specific language for the presentation layer of webpages (as opposed to the structural layer which is written in HTML). They are called *Style Sheets* because they're obviously stylish but the term *Cascading* is used because property values will 'cascade' down to child elements (more specific elements) in an HTML doc.


<br>**syntax** - The basic structure of CSS.

```css
selector {
    property: value;
}
/* this is a comment in CSS */
```
The `selector` selects matching HTML elements in a document. If `selector` is an HTML tag, this selects *all* the elements with that tag on the page.


<br>**Multiple Element Selection** - Select multiple elements at once and and apply some styling:

```css
selector, other-selector {
    color: red;
}
```


<br>**Child Element Selection** - Drill down to specific children of an element by listing them one after another:

```css
selector child child-of-child {
    text-decoration: none;
}
```
This selection will only remove text decoration from the `child-of-child` elements, ie the third level of content on the document. The selection will not affect the first or second level of elements (`selector` and `child`)


<br>**Class Selection '.'** - Multiple elements in an HTML document can be grouped together in a class for styling purposes. Select a class of elements with `.` then `classname`. Would you ever need to include the element name?

```css
.main {
    font-size: 1.5em;
}
```

```html
<section>Will have default text size</section>

<section class="main">This section will have larger text</section>
```

<br>
**id selection '#'** - Ideally, an ID attribute should be unique to its element. Select an element by it's ID with `#` then `idname`. This is a very specific way of styling elements that should be singular on a page. Perhaps you should have a different strategy for styling, one that doesn't require such specificity. 

```css
#note {
    background-color: black;
}
```

<br>
**Pseudo-Class Selectors ':'** - Select a pseudo-class using the single colon `:` notation. For example, to select anchor links with a specific state (of having been visited):

```css
a:visited {
    color: red;
}
```

The `:first-child` pseudo-class can be used to select only the first `p` elements in a div, for example.

```css
/* select all <p> that are the first child of another element */
p:first-child {
    font-style: italic;
}

/* apply style to all but the first child <li> of another element */
li:not(:first-child) {
    margin-top: 0.25rem;
}
```

In the last example, the styling rule will only be visible in a browser inspector for 2nd (or greater) children.

<br>
**Pseudo-Element Selectors '::'** -

<br>**Inline Styling** - Adding style properties directly to elements in the HTML document. This will override all selection and styling found in an external stylesheet in the style tag unless the `!important` flag is used.

```html
<section style="font-style:italic;color:red;">Italic Red Text Here</section>
```

<br>
**Display property** - If every HTML element on a web page is a rectangular box (it is), the `display` property tells that box how to behave. Even before being called in stylesheet, every element has a display property, mostly defaulting to `display: block;` or `display: inline`.

<br>
**Box Modeling in CSS** - Everything can be visualized as a box? The `<div>` tag, for example, if it contains zero content It will still be a 'box' of height and width zero.


<br>
**DOM** - 

<br>**Visualise Elements** - Add this to `<head>` of an HTML document or use in a browser inspector to wrap all rendered html elements in a solid green border. Thicker borders indicate nested elements.

```html
<style> * { border: 1px solid red !important } </style>
```

alternatively in a stylesheet or inspector style rules:

```css
* {
    border: 1px solid red !important
}
```

   The `*` is pretty much the universal 'select everything' symbol in software development.

<br>
**px, pt, em, rem, %** - 

* Pixels (px) are absolute units for on-screen media - they are invariant and fixed to a unit of space on the screen (or browser window) like inches or centimeters would be on a physical surface. Because *px* are an absolute unit despite the size of the browser window, they do not scale with differently sized browser windows. Using *px* is a way to create elements that are fixed-size.

    <br>For example, a square that is 50px on a side might look huge when rendered on a low-resolution display and tiny when rendered on a very high-resolution display but in each instance it remains 50px on a side.


    <br>Traditionally, 1px is fixed is 1/96th of an inch. This may not always be the case anymore?
<br>
<br>
* Points (pt) are analogous to pixels in print media. They are fixed units where 1pt equals 1/72 of an inch. You can always remember 16px = 12pt on screen.
<br>
<br>
* Em - an *em* is a relative measurement equal to the current chosen font size. The current chosen font size can be set and modified by the browser or OS. For Example, if the browser sets the base font size to 12pt (16px) that is what 1em will be equal to inside the document. Use *em* to size elements relative to the current font size.
<br>
<br>
* rem - Essentially the same as an *em*, an *rem* is relative to the root font size while *em* is relative to the font size of it's parent.
<br>
<br>
* % - like *em* % is a relative measurement. It is relative to the height or width of the parent element.

<br>
**!important** - The `!important` flag...

<br>
**Order of Attribute Values** - For attributes with multiple possible values (`padding`, `margin` for example) values are read in a clockwise order: top, right, bottom, left.

```css
p {
    margin: 1px 2px 3px 4px;
}
/* 1px top, 2px right, 3px bottom, 4px left */
```

If only 2 values are used:

```css
p {
    margin: 5px 10px;
}
/* 5px top and bottom, 10px left and right */
```

If only one value is used, it populates all four positions.

<br>
**Margin, Padding, Border** - 

