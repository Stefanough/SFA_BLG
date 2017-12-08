###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Want to keep articles in an article directory
# set :article_dir, 'articles/'

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Activate two blogs for notes and articles
# blog one - articles ('scribbles')
activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
    blog.prefix = "scribbles"
    blog.name = "scribbles"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 2
  blog.page_link = "page/{num}"
end

# blog two - notes
activate :blog do |blog|
# This will add a prefix to all links, template references and source paths
  blog.prefix = "notes"
  blog.name = "notes"

# See blog config above for all the options
  blog.sources = "{title}.html"  
 
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 2
  blog.page_link = "page/{num}"
end

# Realtime results durring development
activate :livereload

# Allow syntax highlighting
set :markdown_engine, :redcarpet
set :markdown,
  :fenced_code_blocks => true,
  # disable_indented_code_blocks: true,
  strikethrough: true,
  :smartypants => true,
  highlight: true,
  # lax_spacing: true,
  superscript: true
activate :syntax

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
