---

title: CSS
date: 2017-12-14 22:02 UTC
tags:

---

<br>**CSS** - Stands for Cascading Style Sheets. CSS is a domain specific language for the presentation layer of webpages (as opposed to the structural layer which is written in HTML). They are called *Style Sheets* because they're obviously stylish but the term *Cascading* is used because property values will 'cascade' down to child elements in an HTML doc.


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


<br>**Class Selection** - Multiple elements in an HTML document can be grouped together in a class for styling purposes. Select a class of elements with `.` then `classname`. Would you ever need to include the element name?

```css
.main {
    font-size: 1.5em;
}
```

```html
<section>Will have default text size</section>

<section class="main">This section will have larger text</section>
```


<br>**id selection** - Ideally, an ID attribute should be unique to its element. Select an element by it's ID with `#` then `idname`. This is a very specific way of styling elements that should be singular on a page. Perhaps you should have a different strategy for styling, one that doesn't require such specificity. 

```css
#note {
    background-color: black;
}
```


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


<br>**px, pt, em, rem, %** - 

* Pixels (px) are absolute units for on-screen media - they are invariant and fixed to a unit of space on the screen (or browser window) like inches or centimeters would be on a physical surface. Because *px* are an absolute unit despite the size of the browser window, they do not scale with differently sized browser windows. Using *px* is a way to create elements that are fixed-size.

    For example, a square that is 50px on a side might look huge when rendered on a low-resolution display and tiny when rendered on a very high-resolution display but in each instance it remains 50px on a side.

    Traditionally, 1px is fixed is 1/96th of an inch. This may not always be the case anymore?

* Points (pt) are analogous to pixels in print media. They are fixed units where 1pt equals 1/72 of an inch. You can always remember 16px = 12pt on screen.

* Em - an *em* is a relative measurement equal to the current chosen font size. The current chosen font size can be set and modified by the browser or OS. For Example, if the browser sets the base font size to 12pt (16px) that is what 1em will be equal to inside the document. Use *em* to size elements relative to the current font size.

* rem - Essentially the same as an *em*, an *rem* is relative to the root font size while *em* is relative to the font size of it's parent.

* % - like *em* % is a relative measurement. It is relative to the height or width of the parent element.


<br>**!important** - The `!important` flag...



