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

helpers do
  def whatsup
    p 'whatup im on the internet'
  end

  # List the files in a public GitHub repository directory.
  #
  # The original implementation scraped github.com's HTML, which broke the
  # build whenever a repository was renamed, deleted, or GitHub changed its
  # markup. Use the contents API instead, and degrade to an empty list rather
  # than failing the whole build.
  def gh_links(url, _css = nil)
    require 'cgi'
    require 'json'
    require 'open-uri'

    parts = URI.parse(url).path.split('/').reject(&:empty?)
    owner, repo = parts.shift(2)
    return [] unless owner && repo

    ref = nil
    path = nil
    if parts[0] == 'tree' && parts[1]
      ref = parts[1]
      path = parts[2..].join('/')
    elsif parts.any?
      path = parts.join('/')
    end

    api_url = "https://api.github.com/repos/#{owner}/#{repo}/contents"
    api_url += "/#{path}" if path && !path.empty?
    api_url += "?ref=#{CGI.escape(ref)}" if ref

    headers = {
      'Accept' => 'application/vnd.github+json',
      'User-Agent' => 'stefanarmijo-blog-build'
    }
    headers['Authorization'] = "Bearer #{ENV['GITHUB_TOKEN']}" if ENV['GITHUB_TOKEN']

    body = URI.open(api_url, headers).read
    entries = JSON.parse(body)
    entries = [entries] unless entries.is_a?(Array)

    entries.select { |entry| entry['type'] == 'file' }.map do |entry|
      { name: entry['name'], uri: entry['html_url'] }
    end
  rescue StandardError => e
    warn "gh_links: skipping #{url} (#{e.class}: #{e.message})"
    []
  end

  # is the the current object an article in the 'notes' blog?
  def is_note?
    notes = []
    blog('notes').articles.each do |article|
      notes << article
    end
    true if is_blog_article? & notes.include?(current_article)
  end
end

# Ignore drafts dir
ignore 'drafts/*'

# Activate two blogs for notes and articles
# blog one - articles ('scribbles')
activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = 'scribbles'
  blog.name = 'scribbles'

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

  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 2
  blog.page_link = 'page/{num}'
end

# blog two - notes
activate :blog do |blog|
  blog.layout = 'notes_layout'
  # This will add a prefix to all links, template references and source paths
  blog.prefix = 'notes'
  blog.name = 'notes'

  # See blog config above for all the options
  # custom file naming template
  blog.sources = '{title}.html'

  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 2
  blog.page_link = 'page/{num}'
end

# Realtime results durring development
activate :livereload

# Activave directory indexes
activate :directory_indexes

# Allow syntax highlighting
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    strikethrough: true,
    smartypants: true,
    highlight: true,
    superscript: true,
    tables: true
activate :syntax

page '/feed.xml', layout: false
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
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
