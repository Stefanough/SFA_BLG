---

title: Nokogiri
date: 2017-12-23 02:29 UTC
tags:

---

**HTML Fragment** - HTML fragment is HTML code that is not a complete document but parsable, user facing code in the `<body>` tags. They generaly lack a `DOCTYPE`, html, and body tags. I think a Document Fragment usualy comes in as a string?

**hi** given an HTML Fragment

```ruby
incoming_fragment ="
<p><strong>HTML Fragment</strong> - HTML fragment is HTML code that is not
a complete document but parseable, user facing code in the
<code>&lt;body&gt;</code> tags. They generally lack a <code>DOCTYPE</code>,
HTML, and body tags. I think a Document Fragment usually comes in as a
string?</p>\n\n<p><strong>hi</strong> given an HTML Fragment</p>\n<div
class=\"highlight\"><pre class=\"highlight ruby\"><code><span
class=\"n\">doc</span> <span class=\"o\">=</span> <span
class=\"no\">Nokogiri</span><span class=\"o\">::</span><span
class=\"no\">HTML</span><span class=\"o\">::</span><span
class=\"no\">DocumentFragment</span><span class=\"p\">.</span><span
class=\"nf\">parse</span><span class=\"p\">(</span><span class=\"s2\">\"html
fragment\"</span><span
class=\"p\">)</span>\n</code></pre></div>\n<p><code>doc</code> is a Nokogirir
HTML dataobject</p>\n<div class=\"highlight\"><pre class=\"highlight
ruby\"><code><span class=\"n\">nodes</span> <span class=\"o\">=</span> <span
class=\"n\">doc</span><span class=\"p\">.</span><span class=\"nf\">css</span>
<span class=\"s2\">\"strong\"</span>\n\n<span class=\"o\">**</span><span
class=\"no\">Node</span><span class=\"c1\">#wrap** -
</span>\n</code></pre></div>"
```

The fragment is block of HTML in a string.

```ruby
doc = Nokogiri::HTML::DocumentFragment.parse("incoming_fragment")
```

`doc` is a Nokogiri::HTML::DocumentFragment dataobject

```ruby
nodes = doc.css 'strong'

nodes.
```

`nodes` is a Nokogiri::XML::NodeSet object. `nodes` has some Enumerable methods.

**NodeSet** - I'm on to something here. A NodeSet is created by parsing an HTML Fragment:

```ruby
> html_fragment = "<h1>Three's Company</h1><div><p><strong>A love triangle.</strong></p><p>
<strong>A good shape.</strong></p></div>"

> doc = Nokogiri::HTML::DocumentFragment.parse(html_fragment)
=>
 #(DocumentFragment:0x13fa984 {
name = "#document-fragment",
children = [
  #(Element:0x17f7f78 { name = "h1", children = [ #(Text "Three's Company")] }),
  #(Element:0x17f7f14 {
    name = "div",
    children = [
      #(Element:0x13f1474 {
        name = "p",
        children = [
          #(Element:0x1804ca0 {
            name = "strong",
            children = [ #(Text "A love triangle.")]
            })]
        }),
      #(Element:0x180db98 {
        name = "p",
        children = [
          #(Element:0x180c0a4 { name = "strong", children = [ #(Text "A good shape.")] })]
        })]
    })]
})
```

Now I'll wrap the `<strong>` tags the content they enclose in `<a>` tags:

```ruby
> doc.css('strong').wrap('<a></a>')

> ndoc
=>
 #(DocumentFragment:0x191372c {
name = "#document-fragment",
children = [
  #(Element:0x19134c0 { name = "h1", children = [ #(Text "Three's Company")] }),
  #(Element:0x191345c {
    name = "div",
    children = [
      #(Element:0x19253b4 {
        name = "p",
        children = [
          #(Element:0x1995858 {
            name = "a",
            children = [
              #(Element:0x1929dd8 {
                name = "strong",
                children = [ #(Text "A love triangle.")]
                })]
            })]
        }),
      #(Element:0x1211c1c {
        name = "p",
        children = [
          #(Element:0x19957cc {
            name = "a",
            children = [
              #(Element:0x1930c28 {
                name = "strong",
                children = [ #(Text "A good shape.")]
                })]
            })]
        })]
    })]
})
```

And the resulting HTML:

```html
> doc.to_html
<h1>Three's Company</h1><div>
  <p>
    <a>
      <strong>A love triangle.</strong>
    </a>
  </p>
  <p>
    <a>
      <strong>A good shape.</strong>
    </a>
  </p>
</div>
=> nil
```

HTML tag attributes are visible as elements inside a Nodogiri data object:

```ruby
#(Element:0x145cabc {
  name = "a",
  attributes = [ #(Attr:0x145c1e8 { name = "href", value = "love" })],
  children = [
    #(Element:0x13a9700 {
      name = "strong",
      children = [ #(Text "A love triangle.")]
      })]
```

Use Nokogiri methods to modify html attributes inside node elements:

```ruby
nodes.each do |node|
  node.attributes["href"].value = node.text
end  

```
