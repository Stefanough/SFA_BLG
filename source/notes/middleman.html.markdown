---

title: middleman
date: 2017-12-08 07:40 UTC
tags: 

---

Using these resources:
----------------------

#### tutorials:
<https://medium.com/@ryanswapp/build-a-blog-with-middleman-and-host-on-github-pages-aab82a7fc56e>

<http://12devs.co.uk/articles/204/>

<https://adrianching.com/how-to-build-a-website-using-middleman-and-github-pages/>

<https://www.youtube.com/watch?v=yoGielteT64>

<http://juliepagano.com/blog/2013/11/10/site-redesign-using-middleman/>

<https://webdesign.tutsplus.com/articles/how-to-setup-a-static-website-with-middleman--cms-25275>

*middlman with two blogs:*
<https://billyfung.com/writing/2017/01/multiple-blogs-with-middleman/>

#### official docs:
<http://www.rubydoc.info/github/middleman/middleman>

<http://www.rubydoc.info/github/middleman/middleman-blog>



#### Blog inspiration:
<https://vgpena.github.io/>

<https://ashfurrow.com/>

<https://dana.lol/>

<http://billyfung.com/>

<http://epochwolf.com/>


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
* Assosciate www.stefanarmijo.com with the blog
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
        - photos
        - about
    - front page with just latest updates
    - ~~folder for aricles~~
    - ~~folder for notes~~

#### Plan for notes page:
* main notes page will have links to differente subject (Ruby, Rails, Sql, Vim, Etc...)
*     each link goes to a markdown file of that subjects notes. One markdown file per subject?
*     different sections for programming related notes and others?
*     add front matter to each notes page? subject and whatnot?


* Imagined workflow:???

Timeline:
---------

* ~~get blog link in navbar to link to /blog~~
*     had to link to /blog.html to get to the blog.html.erb file
* different layouts for blog page and front page
* just created two blogs in the 'basic_blog' project - "scribbles" and "notes"
*     removed all previous articeles and notes
*     use <https://billyfung.com/writing/2017/01/multiple-blogs-with-middleman/>
*     how do I render pages from both blogs where I want them?
* Current error when launching MM server and loading front page: `you must either use the flag --blog (ex. --blog 'myBlog') when calling this method, or add blog: [blog_name] to your page's frontmatter`
*     What is causing this error? There is a `blog_controller` method in the middleman-blog gem.
*     Changed `page_articles.each`... method to `blog('scribbles').page_articles.each`... method
*         new error: `undefined method page_articles' for #<Middleman::Blog::BlogData:0x00000003a32958>`
*
*    Solved above error. Cause was another call to `blog.articles` method with out specifing blog name. changed to `blog('scribbles').articles`.
*    ToDo: add a few large notes markdown files to `/notes` and have them displayed as links on hte main notes page.
*   ~~ ToDo: change how articles are generated. Want to generate 'notes articles' without the date in the filename.~~
*       Solved by changing blog configuration in `config.rb` with the option `blog.sources = "{title}.html"`

Notes:
------

* **layout files** - Should have only the template language extension. In this case `.erb`
 
* **template files** - Will be rendered in html and should have the extension `.html.erb` 
