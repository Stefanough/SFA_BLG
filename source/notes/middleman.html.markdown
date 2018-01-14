---

title: This Site & Middleman
blog: notes
date: 2017-12-08 07:40 UTC
tags:

---

Using these resources:
----------------------

**tutorials:**

<https://medium.com/@ryanswapp/build-a-blog-with-middleman-and-host-on-github-pages-aab82a7fc56e>

<http://12devs.co.uk/articles/204/>

<https://adrianching.com/how-to-build-a-website-using-middleman-and-github-pages/>

<https://www.youtube.com/watch?v=yoGielteT64>

<http://juliepagano.com/blog/2013/11/10/site-redesign-using-middleman/>

<https://webdesign.tutsplus.com/articles/how-to-setup-a-static-website-with-middleman--cms-25275>

*middleman with two blogs:*
<https://billyfung.com/writing/2017/01/multiple-blogs-with-middleman/>

**official docs:**

<http://www.rubydoc.info/github/middleman/middleman>

<http://www.rubydoc.info/github/middleman/middleman-blog>


**Blog inspiration (style):**
<https://vgpena.github.io/>

<https://ashfurrow.com/>

<https://dana.lol/>

<http://billyfung.com/>

<http://epochwolf.com/>

<https://cole.money/blog/>

<https://sheep.horse/>

<https://benhur07b.github.io/index.html>

<http://idlewords.com/>

<https://www.steveklabnik.com/>

<http://andre.arko.net/>

<http://errtheblog.com/>

<http://ruby-doc.org/docs/ruby-doc-bundle/Tutorial/part_01/first_steps.html#numbers>

<http://basecase.org/>

<http://coldewey.cc/>

<https://qntm.org/>

**Blog inspirations (content):**
some overlap, of course

<https://www.koszek.com/>

<https://jvns.ca/about/>

<http://ozmm.org/>

<https://meteuphoric.wordpress.com/>


**Site inspiration (style):**

<https://www.nytimes.com/>

<https://logicmag.io/>

<http://o-r-g.com/>

<https://www.dickgrune.com/>

<http://eric.young.li/#>

<http://text.npr.org/>

<http://ryder-ripps.com/>

<https://sfbay.craigslist.org/>

<http://stallman.org/>

<http://pascalwyse.net/sound/>

<http://www.econlib.org/>

<http://www.paulgraham.com/index.html>

<http://chriswanstrath.com/>

**site inspiration (content):**

Configuration notes:
--------------------

* Install middleman on a cloud9 virtual machine
    * `$ sudo gem install middleman`
      `$ middleman init <some_project_name> --template=blog` to create the skeleton. `--template=blog` is optional.
            - Add `"middleman-livereload", "~> 3.4.3"` to Gemfile, `activate: livereload` in config.rb to use livereload
            - Add `'middleman-deploy', '~> 2.0.0.pre.alpha'` to Gemfile, `deploy.deploy_method =:git` in config.rb. Replace `:git` if needed.
    * Start test server with `$ middleman server $IP -p $PORT`
      View at `http://<workspace_name>-<user_name>.c9users.io:8080/`
    * `$ middleman build`
    * Upload files from `/build` to s3 bucket and view.
* How to integrate with GitHub?????
* Associate www.stefanarmijo.com with the blog
* Deploy to Amazon s3
    * install awscli on cloud9
        * new virtual workspace configured for python development
        * use instructions here: <https://docs.c9.io/docs/deploying-via-cli>
        * `$ aws configure` - configure awscli

Design Ideas/goals:
-------------------

**Want**
    - ~~vertica nav bar~~ No, horizontal for now.
        - blog
        - notes
        - projects (notes in here? or projects in notes?)
        - project Euler/code_something? (put in notes?)
        - photos
        - about
    - front page with just latest updates

articles and notes that are really pretty when rendered and really human readable when viewed in pure markup.

#### Plan for notes page:
* main notes page will have links to different subject (Ruby, Rails, SQL, Vim, Etc...)
    * each link goes to a markdown file of that subjects notes. One markdown file per subject?
    * different sections for programming related notes and others?
    * add front matter to each notes page? subject and whatnot?
* List of notes:
    * ~~Git~~
    * ~~CSS~~
    * ~~Rails~~
    * ~~HTML~~
    * ~~Middleman~~
    * ~~Ruby~~
    * ~~SQL~~
    * ~~Database~~
    * ~~Networking~~
    * ~~Unix and Linux~~
    * ~~Vim (cheatsheet)~~
    * Javascript
    * Algorithms
    * ~~Regex~~
    * ~~Jargon (General)~~


Todo
----
* What do I need to do right now? What am I working on RIGHT NOW?
   * clean up css
   * How does this site work? article.
   * display photos.
   * 

* ~~**ToDo**: Partial out nav bar~~
* **ToDo**: Notes pulled from GitHub instead of stored locally.
* **ToDo**: remove 'recent articles' on bottom of page
* ~~**ToDo**: use nokogiri to parse links for CodeEval projects~~
   * ~~**Todo**: ^^^ the same for project euler~~
   * ~~**ToDo**: clean up link names~~
* ~~**ToDo**: refactor code for CodeEval into helper method~~
* **Todo**: Better title and name
* **ToDo**: link to github and linkedin on the page
* **ToDo**: Write  more filled out 'about me' article
* **Todo**: 'How this blog works' article
* **ToDo**: Write article for front page
* **ToDo**: fix how tables are displayed
* **ToDo**: contact me page
* ~~**ToDo**: Deploy to Amazon s3 bucket~~
* ~~**ToDo**: Simple projects page~~
    ~~* keep it simple to get live. link to repos on git hub.~~
* ~~**ToDo**: styling make styling dead simple. Get site live ASAP!~~
    * Very confused about how this site is pulling fonts from the web. In my stylesheet there are links to fonts in the `et-book` family. None of these fonts are stored locally in structure of the site. I don't think the links are pointing to anything remote. Does the `@font-face` somehow parse it's contained links?
    * ~~content kept at half? page width.~~
    * ~~Better mononspace font for code~~
    * ~~About me on front page~~
* ~~**ToDo**: Blog article title on article page~~
* ~~**ToDo**: all links working in build.~~
* ~~**ToDo**: 'About Notes' on the notes page. Reference the Jargon file...~~
* **ToDo**: RecentArticles only on frontpage.
* ~~**ToDo**: import all notes.~~
* ~~**ToDo**: site links to directories propper, not `.html` files~~
* ~~**ToDo**: Two seperate 'Blogs'. One for writing and one for notes.~~
* ~~**ToDo**: "cloud" of note top~~ics (like bottom of <http://ezyang.com/>) (halfway there)


Defered Todo
------------
* **ToDo**: Searchable notes.
* ~~**ToDo**: have a drafts tab visible when in `.development`~~
   * **ToDo**: draft state read from file name instead of article tag.
* **ToDo**: create footer
   * copyright
   * built with
* **ToDo**: display projects and code on the site
    * how to go about this properly
* ~~**ToDo**: Can I use nokogiri to look inside my notes files and generate links to each bullet point?~~
   * ~~Pull note 'sections' out with Nokogiri search on css `strong` tag~~
   * ~~Display sections as links in the note document.~~
   * Modify the note document so that 'sections' are surounded with `<a name="section title"></a>` tags
   * Modiffy the section links to reference the section names: `<a href="#sectoin name">`.
      * `<p><strong>Section</strong></p>` >> `<p><a name="Section"><strong>Section</strong></a></p>`


Timeline:
---------

* **ToDo**: Name ideas -
   * Disparate Interests
      * Maybe says to the viewer that I am not focused?
      * Disparate Interests but here I focus on one
   * SFA BLG
   * STFN BLG
   * Build Process
   * Dream Ape
   * A. Human
      * From Flatland's A. Square.
   * A. Stefan
   * DreamAbout
   * I'm here
   * Stefan Armijo


* ~~**ToDo**: site links to directories propper, not `.html` files~~
    * Links on danalol:

        ```
        <li><%= link_to 'Archives', '/browse' %></li>
        ```
    * Links on STFNBLG:

        ```
        <%= link_to 'blog', 'blog.html' %>
        ```
      Solved with `activate :directory_indexes` in configure.rb

* different layouts for blog page and front page
* just created two blogs in the 'basic_blog' project - "scribbles" and "notes"
    * use <https://billyfung.com/writing/2017/01/multiple-blogs-with-middleman/>
    * how do I render pages from both blogs where I want them?
* Current error when launching MM server and loading front page: `you must either use the flag --blog (ex. --blog 'myBlog') when calling this method, or add blog: [blog_name] to your page's frontmatter`
    * What is causing this error? There is a `blog_controller` method in the middleman-blog gem.
    * Changed `page_articles.each`... method to `blog('scribbles').page_articles.each`... method
         * new error: `undefined method page_articles' for #<Middleman::Blog::BlogData:0x00000003a32958>`
         * Solved above error. Cause was another call to `blog.articles` method with out specifing blog name. changed to `blog('scribbles').articles`.
*   ~~**ToDo**: change how articles are generated. Want to generate 'notes articles' without the date in the filename.~~
*       Solved by changing blog configuration in `config.rb` with the option `blog.sources = "{title}.html"`


    fixed error. `blog.articles` method in feed.xml file. have to specify which blog when working with multiple blogs.

    `middleman build` runs successfully but code blocks still not highlighted. Requires styling?

* ~~**ToDo**: Render available methods, and constants on a page.~~
   * ~~use `<% p .methods %>` in the `index.erb` page and they're curedly printed on the page.~~


* **ToDo**: The "note cloud" is a `ul` here is the css from <ezyang.com>

```css
ul.compact {
    margin: 1em auto 1em;
    padding: 0;
    text-align: center;
    font-size: 80%;
    width: 80%;
}
```

* **ToDo**: deploy to s3
   * add 's3_website' to Gemfile and configure

      * follow instructions: [here](https://github.com/laurilehmijoki/s3_website/blob/master/additional-docs/setting-up-aws-credentials.md) and [here](https://github.com/laurilehmijoki/s3_website)
      * create a `.env` file and populate with `s3_id: <%= ENV['AWS_ACCESS_KEY_ID'] %>`, `s3_secret: <%= ENV['AWS_SECRET_ACCESS_KEY'] %>`, `s3_bucket: <%= ENV['STATIC_SITE_BUCKET'] %>`.
      * `s3_website cfg apply` to www.stefanarmijo.com gave error: `Applying the configurations in s3_website.yml on the AWS services ... The bucket you are attempting to access must be addressed using the specified endpoint. Please send all future requests to this endpoint. (Aws::S3::Errors::PermanentRedirect)`
      * ~~Create two buckets: 'www.stefanarmijo.com', 'stefanarmijo.com'. Website build content will be pushed to 'stefanarmijo.com'.~~
         * Endpoint for 'stefanarmijo.com': http://stefanarmijo.com.s3-website-us-east-1.amazonaws.com
         * Endpoint for 'www.stefanarmijo.com': http://www.stefanarmijo.com.s3-website-us-east-1.amazonaws.com

      * ~~'www.stefanarmijo.com' will redirect to 'stefanarmijo.com'.~~
      * Configure Logging for Website Traffic

   * Create and Configure Amazon Route 53 to use a custom url to direct traffic to your bucket.
      * Migrate DNS Service for an Existing Domain to Amazon Route 53
         * ~~Create hosted zone~~
         * ~~Create records~~


   * Can view site at `stefanarmijo.com` but as soon as I visit `www.stefanarmijo.com` I get an error.
      * Solved! created *two* aliases in my hosted zone in route 53. One for `stefanarmijo.com` and ond for `www.stefanarmijo.com`.


Notes:
------

* **layout files** - Should have only the template language extension. In this case `.erb`

* **template files** - Will be rendered in html and should have the extension `.html.erb`

* **Deploy to s3** - From Dlol "You will need domain name (like example.com), a blog domain name (like www.example.com), and an AWS ACM Certificate ARN str"

    Things I need:
   * domain: stefanarmijo.com
   * AWS ACM Certificate ARN str
   * Gem 's3_website'


Middleman methods:
------------------
Taken by calling self.methods and pulling from the server log

```
[
    [  0]                                                                 !()                                                #<Class:0x000000050a7670> (BasicObject)
    [  1]                                                                !=(arg1)                                            #<Class:0x000000050a7670> (BasicObject)
    [  2]                                                                !~(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [  3]                                                               <=>(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [  4]                                                                ==(arg1)                                            #<Class:0x000000050a7670> (BasicObject)
    [  5]                                                               ===(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [  6]                                                                =~(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [  7]                                                          Contract(*args)                                           #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [  8]                                                       __binding__()                                                #<Class:0x000000050a7670> (Object)
    [  9] __contracts_ruby_original__render_with_all_renderers_jb4l4udj5e2j(path, locs, context, opts, &block)               #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 10]             __contracts_ruby_original_locate_partial_jb4l4udj9j7p(partial_path, *try_static)                       #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 11]                __contracts_ruby_original_render_file_jb4l4udj803f(file, locs, opts, &block)                        #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 12]                     __contracts_ruby_original_render_jb4l4udj97ad(_, name, *options, &block)                       #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 13]                                                            __id__()                                                #<Class:0x000000050a7670> (BasicObject)
    [ 14]                                                          __send__(*arg1)                                           #<Class:0x000000050a7670> (BasicObject)
    [ 15]                                        _render_with_all_renderers(*args, &blk)                                     #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 16]                                                        acts_like?(duck)                                            #<Class:0x000000050a7670> (Object)
    [ 17]                                                                ai(*options)                                        #<Class:0x000000050a7670> (Kernel)
    [ 18]                                                               app()                                                #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 19]                                                        asset_path(kind, source, *options)                          #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 20]                                                       asset_stamp()                                                #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 21]                                                         asset_url(path, *prefix, *options)                         #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 22]                                          auto_find_proper_handler(&block)                                          #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 23]                                       auto_javascript_include_tag()                                                #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 24]                                          auto_stylesheet_link_tag()                                                #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 25]                                                          auto_tag(asset_ext, *asset_dir)                           #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 26]                                                   awesome_inspect(*options)                                        #<Class:0x000000050a7670> (Kernel)
    [ 27]                                                     awesome_print(object, *options)                                #<Class:0x000000050a7670> (Kernel)
    [ 28]                                                            blank?()                                                #<Class:0x000000050a7670> (Object)
    [ 29]                                                    block_is_haml?(block)                                           #<Class:0x000000050a7670> (Haml::Helpers)
    [ 30]                                                block_is_template?(block)                                           #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [ 31]                                                              blog(*blog_name)                                      #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [ 32]                                                   blog_controller(*blog_name)                                      #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [ 33]                                                     blog_day_path(year, month, day, *blog_name)                    #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [ 34]                                                    blog_instances()                                                #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [ 35]                                                   blog_month_path(year, month, *blog_name)                         #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [ 36]                                                    blog_year_path(year, *blog_name)                                #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [ 37]                                                            build?(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 38]                                                        button_tag(caption, *options)                               #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [ 39]                                                         button_to(*args, &block)                                   #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [ 40]                                                           capture(*args, &block)                                   #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [ 41]                                                      capture_haml(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [ 42]                                        capture_haml_with_haml_xss(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [ 43]                                     capture_haml_without_haml_xss(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers)
    [ 44]                                                      capture_html(*args, &block)                                   #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 45]                                                     check_box_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [ 46]                                                             class()                                                #<Class:0x000000050a7670> (Kernel)
    [ 47]                                                        class_eval(*args, &block)                                   #<Class:0x000000050a7670> (Kernel)
    [ 48]                                                             clone()                                                #<Class:0x000000050a7670> (Kernel)
    [ 49]                                                              code(*language, *options, &block)                     #<Class:0x000000050a7670> (#<Module:0x0000000365c4c8>)
    [ 50]                                                        collection(*args, &blk)                                     #<#<Class:0x000000050a7670>:0x000000057a2178 @app=#<Middleman::Application:0x32393280...>>
    [ 51]                                                   color_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [ 52]                                                            concat(*text)                                           #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [ 53]                                                    concat_content(*text)                                           #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [ 54]                                               concat_safe_content(*text)                                           #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [ 55]                                                            config(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 56]                                                    content_blocks()                                                #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [ 57]                                                       content_for(key, *content, *options, &block)                 #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [ 58]                                                      content_for?(key)                                             #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [ 59]                                                       content_tag(name, *content, *options, &block)                #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [ 60]                                                    csrf_meta_tags()                                                #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers::Security)
    [ 61]                                                        csrf_param()                                                #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers::Security)
    [ 62]                                                        csrf_token()                                                #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers::Security)
    [ 63]                                                  csrf_token_field()                                                #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers::Security)
    [ 64]                                                   current_article()                                                #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [ 65]                                                    current_engine()                                                #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 66]                                                   current_engine=(arg1)                                            #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 67]                                                      current_page()                                                #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 68]                                                      current_path()                                                #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 69]                                                  current_resource()                                                #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 70]                                                              data()                                                #<#<Class:0x000000050a7670>:0x000000057a2178 @app=#<Middleman::Application:0x32393280>...>
    [ 71]                                                    date_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [ 72]                                                datetime_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [ 73]                                          datetime_local_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [ 74]                                                          deep_dup()                                                #<Class:0x000000050a7670> (Object)
    [ 75]                                           define_singleton_method(*arg1)                                           #<Class:0x000000050a7670> (Kernel)
    [ 76]                                                      development?(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 77]                                                           display(*arg1)                                           #<Class:0x000000050a7670> (Kernel)
    [ 78]                                         distance_of_time_in_words(from_time, *to_time, *include_seconds, *options) #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [ 79]                                                               dup()                                                #<Class:0x000000050a7670> (Kernel)
    [ 80]                                                       duplicable?()                                                #<Class:0x000000050a7670> (Object)
    [ 81]                                                   email_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [ 82]                                                          enum_for(*arg1)                                           #<Class:0x000000050a7670> (Kernel)
    [ 83]                                                       environment(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 84]                                                      environment?(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 85]                                                              eql?(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [ 86]                                                            equal?(arg1)                                            #<Class:0x000000050a7670> (BasicObject)
    [ 87]                                                  error_message_on(object, field, *options)                         #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers::Errors)
    [ 88]                                                error_messages_for(*objects)                                        #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers::Errors)
    [ 89]                                                       escape_html(text)                                            #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [ 90]                                                 escape_javascript(html_content)                                    #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [ 91]                                                       escape_link(link)                                            #<Class:0x000000050a7670> (Padrino::Helpers::TagHelpers)
    [ 92]                                                       escape_once(*args)                                           #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [ 93]                                         escape_once_with_haml_xss(*args)                                           #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [ 94]                                      escape_once_without_haml_xss(text)                                            #<Class:0x000000050a7670> (Haml::Helpers)
    [ 95]                                                            extend(*arg1)                                           #<Class:0x000000050a7670> (Kernel)
    [ 96]                                                        extensions(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [ 97]                                              extract_option_tags!(options)                                         #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers::Options)
    [ 98]                                                       favicon_tag(source, *options)                                #<Class:0x000000050a7670> (Padrino::Helpers::AssetTagHelpers)
    [ 99]                                                          feed_tag(mime, url, *options)                             #<Class:0x000000050a7670> (Padrino::Helpers::AssetTagHelpers)
    [100]                                                     field_set_tag(*args, &block)                                   #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [101]                                                        fields_for(object, *options, &block)                        #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [102]                                                    file_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [103]                                                 find_and_preserve(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [104]                                   find_and_preserve_with_haml_xss(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [105]                                find_and_preserve_without_haml_xss(*input, *tags, &block)                           #<Class:0x000000050a7670> (Haml::Helpers)
    [106]                                               find_proper_handler()                                                #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [107]                                                         flash_tag(*args)                                           #<Class:0x000000050a7670> (Padrino::Helpers::AssetTagHelpers)
    [108]                                                           flatten(*input, &block)                                  #<Class:0x000000050a7670> (Haml::Helpers)
    [109]                                                          form_for(object, url, *options, &block)                   #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [110]                                                          form_tag(url, *options, &block)                           #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [111]                                                            freeze()                                                #<Class:0x000000050a7670> (Kernel)
    [112]                                                           frozen?()                                                #<Class:0x000000050a7670> (Kernel)
    [113]                                                          functype(funcname)                                        #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [114]                                                               gem(dep, *reqs)                                      #<Class:0x000000050a7670> (Kernel)
    [115]                                      generate_content_class_names()                                                #<Class:0x000000050a7670> (Haml::Helpers::ActionViewExtensions)
    [116]                                                                 h(text)                                            #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [117]                                                                h!(text, *blank_text)                               #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [118]                                                       haml_concat(*text)                                           #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [119]                                         haml_concat_with_haml_xss(*text)                                           #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [120]                                      haml_concat_without_haml_xss(*text)                                           #<Class:0x000000050a7670> (Haml::Helpers)
    [121]                                                       haml_indent()                                                #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [122]                                         haml_indent_with_haml_xss()                                                #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [123]                                      haml_indent_without_haml_xss()                                                #<Class:0x000000050a7670> (Haml::Helpers)
    [124]                                                          haml_tag(name, *rest, &block)                             #<Class:0x000000050a7670> (Haml::Helpers)
    [125]                                                       haml_tag_if(condition, *tag)                                 #<Class:0x000000050a7670> (Haml::Helpers)
    [126]                                                              hash()                                                #<Class:0x000000050a7670> (Kernel)
    [127]                                                  hidden_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [128]                                          hidden_form_method_field(desired_method)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [129]                                                         highlight(text, words, *args)                              #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [130]                                                        html_attrs(*lang)                                           #<Class:0x000000050a7670> (Haml::Helpers)
    [131]                                                       html_escape(text)                                            #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [132]                                         html_escape_with_haml_xss(text)                                            #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [133]                                      html_escape_without_haml_xss(text)                                            #<Class:0x000000050a7670> (Haml::Helpers)
    [134]                                                        html_safe?()                                                #<Class:0x000000050a7670> (Object)
    [135]                                                         image_alt(src)                                             #<Class:0x000000050a7670> (Padrino::Helpers::AssetTagHelpers)
    [136]                                                        image_path(src)                                             #<Class:0x000000050a7670> (Padrino::Helpers::AssetTagHelpers)
    [137]                                                  image_submit_tag(source, *options)                                #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [138]                                                         image_tag(path, *params)                                   #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [139]                                                 init_haml_helpers()                                                #<Class:0x000000050a7670> (Haml::Helpers)
    [140]                                                         input_tag(type, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::TagHelpers)
    [141]                                                           inspect()                                                #<Class:0x000000050a7670> (Kernel)
    [142]                                                     instance_eval(*arg1)                                           #<Class:0x000000050a7670> (BasicObject)
    [143]                                                     instance_exec(*arg1)                                           #<Class:0x000000050a7670> (BasicObject)
    [144]                                                      instance_of?(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [145]                                        instance_variable_defined?(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [146]                                             instance_variable_get(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [147]                                             instance_variable_set(arg1, arg2)                                      #<Class:0x000000050a7670> (Kernel)
    [148]                                                instance_variables()                                                #<Class:0x000000050a7670> (Kernel)
    [149]                                                             is_a?(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [150]                                                  is_blog_article?()                                                #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [151]                                                          is_haml?()                                                #<Class:0x000000050a7670> (Haml::Helpers)
    [152]                                           is_protected_from_csrf?()                                                #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers::Security)
    [153]                                                            itself()                                                #<Class:0x000000050a7670> (Kernel)
    [154]                                            javascript_include_tag(*sources)                                        #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [155]                                                    js_escape_html(html_content)                                    #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [156]                                                          kind_of?(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [157]                                                         label_tag(name, *options, &block)                          #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [158]                                                           link_to(*args, &block)                                   #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [159]                                                           list_of(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [160]                                             list_of_with_haml_xss(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [161]                                          list_of_without_haml_xss(enum, *opts, &block)                             #<Class:0x000000050a7670> (Haml::Helpers)
    [162]                                                    locate_partial(*args, &blk)                                     #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [163]                                                            logger(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [164]                                                             lorem()                                                #<Class:0x000000050a7670> (#<Module:0x00000002a01110>)
    [165]                                                           mail_to(email, *caption, *mail_options)                  #<Class:0x000000050a7670> (Padrino::Helpers::AssetTagHelpers)
    [166]                                                         mark_safe(value)                                           #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
    [167]                                                          meta_tag(content, *options)                               #<Class:0x000000050a7670> (Padrino::Helpers::AssetTagHelpers)
    [168]                                                            method(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [169]                                                           methods(*args)                                           #<Class:0x000000050a7670> (Object)
    [170]                                                   month_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [171]                                                              nil?()                                                #<Class:0x000000050a7670> (Kernel)
    [172]                                                          non_haml()                                                #<Class:0x000000050a7670> (Haml::Helpers)
    [173]                                                  number_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [174]                                                number_to_currency(number, *options)                                #<Class:0x000000050a7670> (Padrino::Helpers::NumberHelpers)
    [175]                                              number_to_human_size(number, *args)                                   #<Class:0x000000050a7670> (Padrino::Helpers::NumberHelpers)
    [176]                                              number_to_percentage(number, *options)                                #<Class:0x000000050a7670> (Padrino::Helpers::NumberHelpers)
    [177]                                             number_with_delimiter(number, *args)                                   #<Class:0x000000050a7670> (Padrino::Helpers::NumberHelpers)
    [178]                                             number_with_precision(number, *args)                                   #<Class:0x000000050a7670> (Padrino::Helpers::NumberHelpers)
    [179]                                                         object_id()                                                #<Class:0x000000050a7670> (Kernel)
    [180]                                                     page_articles(*blog_name)                                      #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [181]                                                        page_class()                                                #<Class:0x000000050a7670> (Haml::Helpers::ActionViewExtensions)
    [182]                                                      page_classes(*path, *options)                                 #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [183]                                                          paginate()                                                #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [184]                                                        pagination()                                                #<Class:0x000000050a7670> (#<Module:0x00000002915da0>)
    [185]                                                           partial(template, *options, &block)                      #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [186]                                                password_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [187]                                                   phone_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [188]                                                       placekitten(size, *options)                                  #<Class:0x000000050a7670> (#<Module:0x00000002a01110>)
    [189]                                                         pluralize(count, singular, *plural)                        #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [190]                                                           precede(str, &block)                                     #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [191]                                             precede_with_haml_xss(str, &block)                                     #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [192]                                          precede_without_haml_xss(str, &block)                                     #<Class:0x000000050a7670> (Haml::Helpers)
    [193]                                                          presence()                                                #<Class:0x000000050a7670> (Object)
    [194]                                                          present?()                                                #<Class:0x000000050a7670> (Object)
    [195]                                                          preserve(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [196]                                            preserve_with_haml_xss(*args, &block)                                   #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [197]                                         preserve_without_haml_xss(*input, &block)                                  #<Class:0x000000050a7670> (Haml::Helpers)
    [198]                                                    pretty_inspect()                                                #<Class:0x000000050a7670> (Kernel)
    [199]                                                      pretty_print(q)                                               #<Class:0x000000050a7670> (PP::ObjectMixin)
    [200]                                                pretty_print_cycle(q)                                               #<Class:0x000000050a7670> (PP::ObjectMixin)
    [201]                                              pretty_print_inspect()                                                #<Class:0x000000050a7670> (PP::ObjectMixin)
    [202]                                   pretty_print_instance_variables()                                                #<Class:0x000000050a7670> (PP::ObjectMixin)
    [203]                                                   private_methods(*args)                                           #<Class:0x000000050a7670> (Object)
    [204]                                                       production?(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [205]                                                 protected_methods(*args)                                           #<Class:0x000000050a7670> (Object)
    [206]                                                               pry(*object, *hash)                                  #<Class:0x000000050a7670> (Object)
    [207]                                                     psych_to_yaml(*options)                                        #<Class:0x000000050a7670> (Object)
    [208]                                                     public_method(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [209]                                                    public_methods(*args)                                           #<Class:0x000000050a7670> (Object)
    [210]                                                       public_send(*arg1)                                           #<Class:0x000000050a7670> (Kernel)
    [211]                                                  radio_button_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [212]                                                   range_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [213]                                          remove_instance_variable(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [214]                                                            render(*args, &blk)                                     #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [215]                                                       render_file(*args, &blk)                                     #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [216]                                                    render_partial(template, *options, &block)                      #<Class:0x000000050a7670> (Padrino::Helpers::RenderHelpers)
    [217]                                                       respond_to?(*arg1)                                           #<Class:0x000000050a7670> (Kernel)
    [218]                                                    restore_buffer(buf_was)                                         #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [219]                                                              root(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [220]                                                  safe_content_tag(name, *content, *options, &block)                #<Class:0x000000050a7670> (Padrino::Helpers::TagHelpers)
    [221]                                                     sanitize_html(text)                                            #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [222]                                                       save_buffer()                                                #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [223]                                                  search_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [224]                                                        select_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [225]                                                              send(*arg1)                                           #<Class:0x000000050a7670> (Kernel)
    [226]                                                           server?(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [227]                                                     simple_format(text, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [228]                                                   singleton_class()                                                #<Class:0x000000050a7670> (Kernel)
    [229]                                                  singleton_method(arg1)                                            #<Class:0x000000050a7670> (Kernel)
    [230]                                                 singleton_methods(*args)                                           #<Class:0x000000050a7670> (Object)
    [231]                                                           sitemap(*args, &block)                                   #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [232]                                                        strip_tags(html)                                            #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [233]                                               stylesheet_link_tag(*sources)                                        #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [234]                                                        submit_tag(*args)                                           #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [235]                                                           succeed(str, &block)                                     #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [236]                                             succeed_with_haml_xss(str, &block)                                     #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [237]                                          succeed_without_haml_xss(str, &block)                                     #<Class:0x000000050a7670> (Haml::Helpers)
    [238]                                                 suppress_warnings()                                                #<Class:0x000000050a7670> (Kernel)
    [239]                                                          surround(front, *back, &block)                            #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [240]                                            surround_with_haml_xss(front, *back, &block)                            #<Class:0x000000050a7670> (Haml::Helpers::XssMods)
    [241]                                         surround_without_haml_xss(front, *back, &block)                            #<Class:0x000000050a7670> (Haml::Helpers)
    [242]                                                          tab_down(*i)                                              #<Class:0x000000050a7670> (Haml::Helpers)
    [243]                                                            tab_up(*i)                                              #<Class:0x000000050a7670> (Haml::Helpers)
    [244]                                                               tag(name, *options, *open)                           #<Class:0x000000050a7670> (Padrino::Helpers::TagHelpers)
    [245]                                                          tag_path(tag, *blog_name)                                 #<Class:0x000000050a7670> (Middleman::Blog::Helpers)
    [246]                                                             taint()                                                #<Class:0x000000050a7670> (Kernel)
    [247]                                                          tainted?()                                                #<Class:0x000000050a7670> (Kernel)
    [248]                                                               tap()                                                #<Class:0x000000050a7670> (Kernel)
    [249]                                               telephone_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [250]                                                     text_area_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [251]                                                    text_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [252]                                                 time_ago_in_words(from_time, *include_seconds)                     #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [253]                                                    time_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [254]                                                           to_enum(*arg1)                                           #<Class:0x000000050a7670> (Kernel)
    [255]                                                           to_json(*arg1)                                           #<Class:0x000000050a7670> (JSON::Ext::Generator::GeneratorMethods::Object)
    [256]                                                          to_param()                                                #<Class:0x000000050a7670> (Object)
    [257]                                                          to_query(key)                                             #<Class:0x000000050a7670> (Object)
    [258]                                                              to_s()                                                #<Class:0x000000050a7670> (Kernel)
    [259]                                                           to_yaml(*options)                                        #<Class:0x000000050a7670> (Object)
    [260]                                                to_yaml_properties()                                                #<Class:0x000000050a7670> (Object)
    [261]                                                          truncate(text, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [262]                                                    truncate_words(text, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [263]                                                             trust()                                                #<Class:0x000000050a7670> (Kernel)
    [264]                                                               try(*a, &b)                                          #<Class:0x000000050a7670> (ActiveSupport::Tryable)
    [265]                                                              try!(*a, &b)                                          #<Class:0x000000050a7670> (ActiveSupport::Tryable)
    [266]                                                           untaint()                                                #<Class:0x000000050a7670> (Kernel)
    [267]                                                           untrust()                                                #<Class:0x000000050a7670> (Kernel)
    [268]                                                        untrusted?()                                                #<Class:0x000000050a7670> (Kernel)
    [269]                                                     url_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [270]                                                           url_for(path_or_resource, *options)                      #<Class:0x000000050a7670> (#<Module:0x00000002aa18e0>)
    [271]                                                    week_field_tag(name, *options)                                  #<Class:0x000000050a7670> (Padrino::Helpers::FormHelpers)
    [272]                                              with_raw_haml_concat()                                                #<Class:0x000000050a7670> (Haml::Helpers::ActionViewExtensions)
    [273]                                                         with_tabs(i)                                               #<Class:0x000000050a7670> (Haml::Helpers)
    [274]                                                         word_wrap(text, *args)                                     #<Class:0x000000050a7670> (Padrino::Helpers::FormatHelpers)
    [275]                                                       wrap_layout(layout_name, &block)                             #<Class:0x000000050a7670> (Middleman::TemplateContext)
    [276]                                                     yield_content(key, *args)                                      #<Class:0x000000050a7670> (Padrino::Helpers::OutputHelpers)
]

```


Anatomy of a Middleman article:
-------------------------------
Derived from calling 'ap self' in layout.erb, following a link to a blog article and copying the output from the server log

```
#<#<Class:0x00000002a6b808>:0x007f187c0e1960 @app=#<Middleman::Application:0x22247000>, @locs={
    :lang=>:en, :locale=>:en, :rack=>{
        :request=>#<Rack::Request:0x00000005b0ea00 @params=nil, @env={
            "GATEWAY_INTERFACE"=>"CGI/1.1",
            "PATH_INFO"=>"/scribbles/2017/12/07/test-4-4444/",
            "QUERY_STRING"=>"",
            "REMOTE_ADDR"=>"127.0.0.1",
            "REMOTE_HOST"=>"127.0.0.1",
            "REQUEST_METHOD"=>"GET",
            "REQUEST_URI"=>"http://localhost:4567/scribbles/2017/12/07/test-4-4444/",
            "SCRIPT_NAME"=>"",
            "SERVER_NAME"=>"localhost",
            "SERVER_PORT"=>"4567",
            "SERVER_PROTOCOL"=>"HTTP/1.1",
            "SERVER_SOFTWARE"=>"WEBrick/1.3.1 (Ruby/2.3.1/2016-04-26) OpenSSL/1.0.2g",
            "HTTP_HOST"=>"localhost:4567",
            "HTTP_USER_AGENT"=>"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:57.0) Gecko/20100101 Firefox/57.0",
            "HTTP_ACCEPT"=>"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            "HTTP_ACCEPT_LANGUAGE"=>"en-US,en;q=0.5",
            "HTTP_ACCEPT_ENCODING"=>"gzip, deflate",
            "HTTP_REFERER"=>"http://localhost:4567/blog",
            "HTTP_CONNECTION"=>"keep-alive",
            "HTTP_UPGRADE_INSECURE_REQUESTS"=>"1",
            "HTTP_CACHE_CONTROL"=>"max-age=0",
            "rack.version"=>[1, 3],
            "rack.input"=>#<Rack::Lint::InputWrapper:0x00000005b0edc0 @input=#<StringIO:0x00000005aee2f0>>,
            "rack.errors"=>#<Rack::Lint::ErrorWrapper:0x00000005b0ed98 @error=#<IO:<STDERR>>>,
            "rack.multithread"=>true,
            "rack.multiprocess"=>false,
            "rack.run_once"=>false,
            "rack.url_scheme"=>"http",
            "rack.hijack?"=>true,
            "rack.hijack"=>#<Proc:0x00000005b0f040@/var/lib/gems/2.3.0/gems/rack-2.0.3/lib/rack/lint.rb:525>,
            "rack.hijack_io"=>nil,
            "HTTP_VERSION"=>"HTTP/1.1",
            "REQUEST_PATH"=>"/scribbles/2017/12/07/test-4-4444/"
            }>
        }, :current_path=>"scribbles/2017/12/07/test-4-4444/index.html"
}, @opts={
    :lang=>:en, :locale=>:en, :layout=>"layout"
}, @haml_buffer=#<Haml::Buffer:0x007f187c0e0d30 @active=true, @upper=nil, @options={
    :autoclose=>
        ["area", "base", "basefont", "br", "col", "command", "embed", "frame", "hr", "img", "input", "isindex", "keygen", "link", "menuitem", "meta", "param", "source", "track", "wbr"], :preserve=>["textarea", "pre", "code"], :attr_wrapper=>"'", :format=>:html5, :encoding=>"UTF-8", :escape_html=>false, :escape_attrs=>true, :hyphenate_data_attrs=>true, :cdata=>false
    }, @buffer="", @tabulation=0, @real_tabs=0>, @current_engine=:erb, @_out_buf="<!doctype html>
<html>
  <head>
    <meta charset=\"utf-8\" />
    <meta http-equiv='X-UA-Compatible' content='IE=edge;chrome=1' />
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    <title>
        [dev]
        SFA BLG  - test 4.4444
    </title>
    <link href=\"/stylesheets/all.css\" rel=\"stylesheet\" />
    <link rel=\"alternate\" type=\"application/atom+xml\" title=\"Atom Feed\" href=\"/scribbles/feed.xml\" />
    <link href=\"/stylesheets/assets/normalize.css\" rel=\"stylesheet\" media=\"all\" />
  </head>

  <body>
          <nav class=\"top-bar\">
            <a href=\"/\">Stefan Armijo</a>
            <a href=\"/blog\">blog</a>
            <a href=\"/notes\">notes</a>
            <a href=\"/about\">about</a>
          </nav>

          <div id=\"main\" role=\"main\">
                  <h2>  </h2>
                  <h2> test 4.4444 </h2>
              <p><em>Condimentum. Etiam in magna ac nibh ultrices vehicula. Maecenas commodo
facilisis lectus. Praesent sed mi. Phasellus ipsum. Donec quis tellus id lectus
faucibus molestie. Praesent vel ligula. Nam venenatis neque quis mauris. Proin
felis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur
ridiculus mus. Aliquam quam. Nam felis velit, semper nec, aliquam nec, iaculis
vel, mi. Nullam et augue vitae nunc tristique vehicula. Suspendisse eget elit.
Duis adipiscing dui non quam.</em></p>

<p><em>Duis posuere tortor sit amet est iaculis egestas. Ut at magna. Etiam dui nisi,
blandit quis, fermentum vitae, auctor vel, sem. Cras et leo. Vestibulum ante
ipsum primis in.</em></p>

              ">
```

article methods

```
[
    [  0]                                                            !()                           Middleman::Sitemap::Resource (BasicObject)
    [  1]                                                           !=(arg1)                       Middleman::Sitemap::Resource (BasicObject)
    [  2]                                                           !~(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [  3]                                                          <=>(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [  4]                                                           ==(arg1)                       Middleman::Sitemap::Resource (BasicObject)
    [  5]                                                          ===(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [  6]                                                           =~(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [  7]                                                     Contract(*args)                      Middleman::Sitemap::Resource
    [  8]                                                  __binding__()                           Middleman::Sitemap::Resource (Object)
    [  9]          __contracts_ruby_original_add_metadata_jbfq66uw6xyd(*meta, *reverse)            Middleman::Sitemap::Resource
    [ 10]               __contracts_ruby_original_binary?_jbfq66ux8t9z()                           Middleman::Sitemap::Resource
    [ 11]          __contracts_ruby_original_content_type_jbfq66uy3kq7()                           Middleman::Sitemap::Resource
    [ 12]                   __contracts_ruby_original_data_jbfq66uwmnx()                           Middleman::Sitemap::Resource
    [ 13]                   __contracts_ruby_original_ext_jbfq66uxcnrk()                           Middleman::Sitemap::Resource
    [ 14]        __contracts_ruby_original_file_descriptor_jbfq66uvok5()                           Middleman::Sitemap::Resource
    [ 15]               __contracts_ruby_original_ignore!_jbfq66ux925m()                           Middleman::Sitemap::Resource
    [ 16]              __contracts_ruby_original_ignored?_jbfq66ux12g1()                           Middleman::Sitemap::Resource
    [ 17]                __contracts_ruby_original_locals_jbfq66uxefks()                           Middleman::Sitemap::Resource
    [ 18] __contracts_ruby_original_make_implicit_page_id_jbfq66uy410m(path)                       Middleman::Sitemap::Resource
    [ 19]              __contracts_ruby_original_metadata_jbfq66uw4i2j()                           Middleman::Sitemap::Resource
    [ 20]               __contracts_ruby_original_options_jbfq66uxgplh()                           Middleman::Sitemap::Resource
    [ 21]               __contracts_ruby_original_page_id_jbfq66uw3kjs()                           Middleman::Sitemap::Resource
    [ 22]                __contracts_ruby_original_render_jbfq66uxci31(*opts, *locs)               Middleman::Sitemap::Resource
    [ 23]            __contracts_ruby_original_source_file_jbfq66uw7q4()                           Middleman::Sitemap::Resource
    [ 24]             __contracts_ruby_original_template?_jbfq66uw6ir2()                           Middleman::Sitemap::Resource
    [ 25]                   __contracts_ruby_original_url_jbfq66ux3bfn()                           Middleman::Sitemap::Resource
    [ 26]                                                       __id__()                           Middleman::Sitemap::Resource (BasicObject)
    [ 27]                                                     __send__(*arg1)                      Middleman::Sitemap::Resource (BasicObject)
    [ 28]                                     _deprecated_next_article()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 29]                                 _deprecated_previous_article()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 30]                                                   acts_like?(duck)                       Middleman::Sitemap::Resource (Object)
    [ 31]                                                 add_metadata(*args, &blk)                Middleman::Sitemap::Resource
    [ 32]                                                           ai(*options)                   Middleman::Sitemap::Resource (Kernel)
    [ 33]                                          article_locale_next()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 34]                                      article_locale_previous()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 35]                                                 article_next()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 36]                                             article_previous()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 37]                                              awesome_inspect(*options)                   Middleman::Sitemap::Resource (Kernel)
    [ 38]                                                awesome_print(object, *options)           Middleman::Sitemap::Resource (Kernel)
    [ 39]                                                      binary?(*args, &blk)                Middleman::Sitemap::Resource
    [ 40]                                                       blank?()                           Middleman::Sitemap::Resource (Object)
    [ 41]                                              blog_controller()                           Middleman::Sitemap::Resource
    [ 42]                                             blog_controller=(arg1)                       Middleman::Sitemap::Resource
    [ 43]                                                    blog_data()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 44]                                                 blog_options()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 45]                                                         body()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 46]                                                     children()                           Middleman::Sitemap::Resource (Middleman::Sitemap::Extensions::Traversal)
    [ 47]                                                        class()                           Middleman::Sitemap::Resource (Kernel)
    [ 48]                                                   class_eval(*args, &block)              Middleman::Sitemap::Resource (Kernel)
    [ 49]                                                        clone(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [ 50]                                                 content_type(*args, &blk)                Middleman::Sitemap::Resource
    [ 51]                                                         data(*args, &blk)                Middleman::Sitemap::Resource
    [ 52]                                                         date()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 53]                                                     deep_dup()                           Middleman::Sitemap::Resource (Object)
    [ 54]                                    default_summary_generator(rendered, length, ellipsis) Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 55]                                      define_singleton_method(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [ 56]                                             destination_path()                           Middleman::Sitemap::Resource
    [ 57]                                            destination_path=(arg1)                       Middleman::Sitemap::Resource
    [ 58]                                             directory_index?()                           Middleman::Sitemap::Resource (Middleman::Sitemap::Extensions::Traversal)
    [ 59]                                                      display(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [ 60]                                                          dup()                           Middleman::Sitemap::Resource (Kernel)
    [ 61]                                                  duplicable?()                           Middleman::Sitemap::Resource (Object)
    [ 62]                                                     enum_for(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [ 63]                                         eponymous_directory?()                           Middleman::Sitemap::Resource (Middleman::Sitemap::Extensions::Traversal)
    [ 64]                                     eponymous_directory_path()                           Middleman::Sitemap::Resource (Middleman::Sitemap::Extensions::Traversal)
    [ 65]                                                         eql?(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [ 66]                                                       equal?(arg1)                       Middleman::Sitemap::Resource (BasicObject)
    [ 67]                                                          ext(*args, &blk)                Middleman::Sitemap::Resource
    [ 68]                                                       extend(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [ 69]                                              file_descriptor(*args, &blk)                Middleman::Sitemap::Resource
    [ 70]                                                       freeze()                           Middleman::Sitemap::Resource (Kernel)
    [ 71]                                                      frozen?()                           Middleman::Sitemap::Resource (Kernel)
    [ 72]                                                     functype(funcname)                   Middleman::Sitemap::Resource
    [ 73]                                                          gem(dep, *reqs)                 Middleman::Sitemap::Resource (Kernel)
    [ 74]                                                         hash()                           Middleman::Sitemap::Resource (Kernel)
    [ 75]                                                   html_safe?()                           Middleman::Sitemap::Resource (Object)
    [ 76]                                                      ignore!(*args, &blk)                Middleman::Sitemap::Resource
    [ 77]                                                      ignored()                           Middleman::Sitemap::Resource
    [ 78]                                                     ignored=(arg1)                       Middleman::Sitemap::Resource
    [ 79]                                                     ignored?(*args, &blk)                Middleman::Sitemap::Resource
    [ 80]                                                      inspect()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 81]                                                instance_eval(*arg1)                      Middleman::Sitemap::Resource (BasicObject)
    [ 82]                                                instance_exec(*arg1)                      Middleman::Sitemap::Resource (BasicObject)
    [ 83]                                                 instance_of?(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [ 84]                                   instance_variable_defined?(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [ 85]                                        instance_variable_get(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [ 86]                                        instance_variable_set(arg1, arg2)                 Middleman::Sitemap::Resource (Kernel)
    [ 87]                                           instance_variables()                           Middleman::Sitemap::Resource (Kernel)
    [ 88]                                                        is_a?(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [ 89]                                                     is_haml?()                           Middleman::Sitemap::Resource (Object)
    [ 90]                                                       itself()                           Middleman::Sitemap::Resource (Kernel)
    [ 91]                                                     kind_of?(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [ 92]                                                         lang()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 93]                                                       locale()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [ 94]                                                       locals(*args, &blk)                Middleman::Sitemap::Resource
    [ 95]                                        make_implicit_page_id(*args, &blk)                Middleman::Sitemap::Resource
    [ 96]                                                     metadata(*args, &blk)                Middleman::Sitemap::Resource
    [ 97]                                                       method(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [ 98]                                                      methods(*args)                      Middleman::Sitemap::Resource (Object)
    [ 99]                                                 next_article(*args, &block)              Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [100]                                                         nil?()                           Middleman::Sitemap::Resource (Kernel)
    [101]                                              normalized_path()                           Middleman::Sitemap::Resource
    [102]                                                    object_id()                           Middleman::Sitemap::Resource (Kernel)
    [103]                                                      options(*args, &blk)                Middleman::Sitemap::Resource
    [104]                                                      page_id(*args, &blk)                Middleman::Sitemap::Resource
    [105]                                                       parent()                           Middleman::Sitemap::Resource (Middleman::Sitemap::Extensions::Traversal)
    [106]                                                         path()                           Middleman::Sitemap::Resource
    [107]                                                     presence()                           Middleman::Sitemap::Resource (Object)
    [108]                                                     present?()                           Middleman::Sitemap::Resource (Object)
    [109]                                               pretty_inspect()                           Middleman::Sitemap::Resource (Kernel)
    [110]                                                 pretty_print(q)                          Middleman::Sitemap::Resource (PP::ObjectMixin)
    [111]                                           pretty_print_cycle(q)                          Middleman::Sitemap::Resource (PP::ObjectMixin)
    [112]                                         pretty_print_inspect()                           Middleman::Sitemap::Resource (PP::ObjectMixin)
    [113]                              pretty_print_instance_variables()                           Middleman::Sitemap::Resource (PP::ObjectMixin)
    [114]                                             previous_article(*args, &block)              Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [115]                                              private_methods(*args)                      Middleman::Sitemap::Resource (Object)
    [116]                                            protected_methods(*args)                      Middleman::Sitemap::Resource (Object)
    [117]                                                     proxy_to(_path)                      Middleman::Sitemap::Resource
    [118]                                                          pry(*object, *hash)             Middleman::Sitemap::Resource (Object)
    [119]                                                psych_to_yaml(*options)                   Middleman::Sitemap::Resource (Object)
    [120]                                                public_method(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [121]                                               public_methods(*args)                      Middleman::Sitemap::Resource (Object)
    [122]                                                  public_send(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [123]                                                   published?()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [124]                                     remove_instance_variable(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [125]                                                       render(*opts, *locs, &block)       Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [126]                                                 request_path()                           Middleman::Sitemap::Resource
    [127]                                                  respond_to?(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [128]                                                         send(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [129]                                                     siblings()                           Middleman::Sitemap::Resource (Middleman::Sitemap::Extensions::Traversal)
    [130]                                              singleton_class()                           Middleman::Sitemap::Resource (Kernel)
    [131]                                             singleton_method(arg1)                       Middleman::Sitemap::Resource (Kernel)
    [132]                                            singleton_methods(*args)                      Middleman::Sitemap::Resource (Object)
    [133]                                                         slug()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [134]                                                  source_file(*args, &blk)                Middleman::Sitemap::Resource
    [142]                                                        title()                           Middleman::Sitemap::Resource (Middleman::Blog::BlogArticle)
    [143]                                                      to_enum(*arg1)                      Middleman::Sitemap::Resource (Kernel)
    [144]                                                      to_json(*arg1)                      Middleman::Sitemap::Resource (JSON::Ext::Generator::GeneratorMethods::Object)
    [145]                                                     to_param()                           Middleman::Sitemap::Resource (Object)
    [146]                                                     to_query(key)                        Middleman::Sitemap::Resource (Object)
    [147]                                                         to_s()                           Middleman::Sitemap::Resource
    [148]                                                      to_yaml(*options)                   Middleman::Sitemap::Resource (Object)
    [149]                                           to_yaml_properties()                           Middleman::Sitemap::Resource (Object)
    [150]                                               traversal_root()                           Middleman::Sitemap::Resource (Middleman::Sitemap::Extensions::Traversal)
    [151]                                                        trust()                           Middleman::Sitemap::Resource (Kernel)
    [152]                                                          try(*a, &b)                     Middleman::Sitemap::Resource (ActiveSupport::Tryable)
    [153]                                                         try!(*a, &b)                     Middleman::Sitemap::Resource (ActiveSupport::Tryable)
    [154]                                                      untaint()                           Middleman::Sitemap::Resource (Kernel)
    [155]                                                      untrust()                           Middleman::Sitemap::Resource (Kernel)
    [156]                                                   untrusted?()                           Middleman::Sitemap::Resource (Kernel)
    [157]                                                          url(*args, &blk)                Middleman::Sitemap::Resource
]
```
