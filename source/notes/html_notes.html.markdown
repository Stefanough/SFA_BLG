---

title: HTML
blog: notes
date: 2017-12-08 18:18 UTC
tags: 

---

**ul vs nav for navigation links** - The `<nav>` tag is an HTML5 sectioning element intended for major blocks of navigation links. A `<nav>` section will always be a subsection of its nearest ancestor. It is also semantically more specific in that `<nav>` implies that it is for navigation and therefore can be ignored by screen readers. The `<ul>` tag is much older, much less semantically informative, and is inteded to display unordered items in a list format. Navigation links can exist in a `<ul>` in a `<nav>`.


**Tag and Element** - 


**Section** - 

**href** - An attribute of the anchor tag, `href` gets its hame from the fact that it is a Hypertext REFerence.


**Header** - Content about the HTML document that is not rendered by the client browser. Content for the header is placed in the `<head></head>` tag

Header content could include information about the document (title, description etc.), external style sheets, script files and more.


**Title** - The title of the web page goes in the <title></title> tag in the header. Title of the web page as it appears in a browser tab, for example.


**Meta** - Data in the <meta> self closing tag in the header describes the page to search engines. Attributes can include `name` and `content`

```html
<head>
        <title>Peanut Butter and Jelly Sandwich</title>
    <meta name="description" content="The best recipe for Peanut Butter and Jelly Sandwich">
</head>
```
Other `meta` attributes include authorship, content-language, social media specific descriptions, and information for browsers about how the page should be served.


**Scripts** - Scripts can either be written in the `<script></script>` tag or a `src` can be provided. The language for scripts defaults to JavaScript, but any language can be set in the attributes. Here is the google analytics script that should be put into the header:

```html
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-12345678-9', 'auto');
    ga('send', 'pageview');

</script>
```

**Link** - The link tag also belongs in the header. This is used to load an external style sheet for the web page. The important attributes for this self closing tag are `rel` which defines the relationship to the page and must have a value of `"stylesheet"` when loading an external stylesheet file, `href` specifies the url of the defined resource, and `type` declares the content language for the file being loaded.


**Footer** -


**Body** - Content that is to be rendered by the client browser.


**Document** -


**DOM** - Document Object Model. The hierarchical structure of a conventional HTML document. The structure can be thought of as tree-like, the trunk being the main html element enclosed in the html tags. `<body>` and `<head>` grow off of `<html>` like branches. `<body>` may sprout many more branches such as `<p>` and `<form>`.


**Element** - A set of matching tags and everything in between. Elements are the basic building blocks of HTML. Elements define the semantic meaning of their content. Elements can contain other elements.


**Attributes** - Attributes are used to add additional information to tags. They reside in the opening of a tag and consist of an attribute name and an attribute value.
  
```html
    <form class="" action="index.html" method="post">

    </form>
```

In the above, `class`, `action`, and `method` are attributes for the form tag.

Some attributes have only two values and are known as `boolean attributes`. They can be shortened to an empty value or just the attribute name.
 
```html
    <input required="required">

    <input required="">

    <input required>
```
All forms of the `required` attribute above have the same meaning.


**Self Closing Tag** - Tags where all the attributes as well as the value are in between the `< >` and there is no closing tag `</tag>` are called *self closing tags*. `<input>`, for example is a self closing tag. Self closing tags contain no content. `<textarea></textarea>` and `<body></body>` are not self closing tags.


**Global Attributes** - HTML attributes that are accessible to all elements.

  * **id** - The id global attribute defines a unique identifier (ID) which must be unique in the whole document. Its purpose is to identify the element when linking (using a fragment identifier), scripting, or styling (with CSS).

      This attribute's value is an opaque string: this means that web author must not use it to convey any information. Particular meaning, for example semantic meaning, must not be derived from the string.
      
      This attribute's value must not contain whitespace (spaces, tabs etc.). Browsers treat non-conforming IDs that contain whitespace as if the whitespace is part of the ID. In contrast to the class attribute, which allows space-separated values, elements can only have one single ID.

  * **class** - Used to group or separate elements for styling purposes. For example you can have special `<p class="special">` elements with different styling than regular `<p>` elements.




```html
    <form action="cat_rental_requests_url" method="post">

      <label for="cat_rental_request_cat_id">Cat:</label>
      <select name="cat_rental_request[cat_id]" id="cat_rental_request_cat_id">
        <option disabled selected>-- Please Select a Cat --</option>
        <% Cat.all.each do |cat| %>
          <% selected = @rental_request.cat_id == cat.id %>
          <option <%= selected ? "selected" : "" %> value="<%= cat.id %>">
            <%= cat.name %>
          </option>

        <% end %>

      </select>
    </form>  
```
  
  In the above:
  
  ```html
  <form action="cat_rental_requests_url" method="post">
  ```

  ```html
  <label for="cat_rental_request_cat_id">Cat:</label>
  ```

  ```html
  <option disabled selected>-- Please Select a Cat --</option>
  ```

  ```html
  <% Cat.all.each do |cat| %>
    <% selected = @rental_request.cat_id == cat.id %>
  ```

  ```html
  <option <%= selected ? "selected" : "" %> value="<%= cat.id %>"> <%= cat.name %> </option>
  ```

  In the above code: the `action="cat_rental_requests_url"` attribute in the form tag contains a helper method that tells Rails that along with the `method="post"` attribute to send the following form data to the `create` action in the `CarRentalRequestController` this is based on the following routes:
 
  ```
      cat_rental_requests GET    /cat_rental_requests(.:format)          cat_rental_requests#index
                          POST   /cat_rental_requests(.:format)          cat_rental_requests#create
   new_cat_rental_request GET    /cat_rental_requests/new(.:format)      cat_rental_requests#new
  edit_cat_rental_request GET    /cat_rental_requests/:id/edit(.:format) cat_rental_requests#edit
       cat_rental_request GET    /cat_rental_requests/:id(.:format)      cat_rental_requests#show
                          PATCH  /cat_rental_requests/:id(.:format)      cat_rental_requests#update
                          PUT    /cat_rental_requests/:id(.:format)      cat_rental_requests#update
                          DELETE /cat_rental_requests/:id(.:format)      cat_rental_requests#destroy
  ```
  Inside the `<label>` tag the `for="cat_rental_request_cat_id"` attribute is linking the label with the unique `id=""` in the `<select>` list below it. Inside the `<select>` tag, the `name="cat_rental_request[cat_id]"` attribute tells rails that it is

  The `<select>` list will have display each cats name with `<%= cat.name %>` but send the cats id with `value="<%= cat.id %>"` as part of the form data package.
