---

title: Rails notes
date: 2017-12-14 19:52 UTC
tags: 

---

RAILS
-----
**Migrations** - Migrations are a paper trail that show how the DB got into it's current state. Migrations are Rails' way of letting the user manipulate DB tables and columns without writing raw SQL code. Migrations are generated in the terminal with the command `rails generate migration <resource_name>`. This creates a ruby file in the rails project under `db/migrate/` with the given resource name and a time stamp. Inside the file is a `class ResourceName` and a method `change` which contains another method `create_table`.

  `create_table` receives as it's arguments a symbol in the form `:resource_name_tables` and a do/end block. A sort of DSL is used inside the migration.
  
```ruby
class Users < ActiveRecord::Migration
  def change
    create_table :users_table do |t|

  end
end
```

  To create a name column for the above table we use the command:
  
```ruby
  t.string :name
```

  inside the change method. `string` is the data-type of the column and `:name` is the header or key or name for the column. *Database level constraints* can be added in the migration with:
  
```ruby
  t.string :name, null :false
```

  This is basically an options hash and it is going to enforce that every name column must have a value (Every user must have a name).

  To run the migration and add the table to the database, use the command:
  
```ruby
rake db:migrate
```

  from the terminal. This will run any migrations **that haven't been run yet**. This is why you can't just edit a migration file and run it again. Rails keeps track of the migrations that are run and when. Allowing a user to re-migrate the same file over and over doesn't allow Rails to keep track of when a specific column is changed or added. Check the schema file at `/db/schema.rb` to see the newly created table.
    **Editing Migrations** - To make edits to a Database table using migrations, use the command
    
```ruby
$ rake db:rollback
```
      to pop the last migration off of the 'stack'. You can then add columns under the `change` method and migrate again. This is acceptable for development but not for production or any mission critical work. Instead of rolling back a migration we can add or change tables by creating a new migration.

**Validations** - There are levels of validations for resources:
  1.  *DataBase Level Validations* - These are validations done in the migration files and are visible in the DB schema file.
  2.  *ActiveRecord Level Validations*
  3.  *Model Level Validations* - These are validations made in the actual model files.

  These are almost like a hierarchy of defenses and the first line of defense are *Model Level Validation*. If there are only DB level validations for a resource, Rails will throw a DB level error if a there is a save attempt for an object that does not meet those validations. For example, trying to save a user without a name if the `name` column has a DB level validation will throw an error which may present a 500 error to the user. Having a *model level validation* helps prevent this.

  To create a model level validation use the `validates` method:
  
```ruby
class Cat < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  belongs_to :house,
  primary_key :id,
  foreign_key :house_id,
  class_name 'House'
end
```

  `presence: true` makes sure that there is a value for `name` for any object to be saved to the DB. `uniqueness: true` sure that the value is unique for that key (all the Cat names in the `name` column are unique). In the Rails console, calling the method `valid?` on an object will return true or false, so you can test for validity without attempting to save to the DB.

  **Default Validations** - Examples of the default Rails validations:
  
```ruby
validates :terms, acceptance: true
validates :password, confirmation: true
validates :username, exclusion: { in: %w(admin superuser) }
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
validates :age, inclusion: { in: 0..9 }
validates :first_name, length: { maximum: 30 }
validates :age, numericality: true
validates :username, presence: true
validates :username, uniqueness: true
```

  **Custom Validations** - to create a custom validation with more complex or nuanced logic, you can make a method at the top of the model along with the other validations. Inside the method, describe the condition for failure and modify the `self.errors` object to display the failure (Note: it doesn't really matter what you return in the instance of a failure, but how the `self.errors` object is modified). Use the `validate` method along the the custom method as the argument symbol: `validate :custom_validation_method`.
  
```ruby
class Cat < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validate :cant_be_green

  def cant_be_green
    if self.color == 'green'
      self.errors[:color] << "can't be green"
  end

  belongs_to :house,
  primary_key :id,
  foreign_key :house_id,
  class_name 'House'
end
```


**Associations** -
  * `belongs_to` and `has_many`

```ruby
# == Schema Information

Table name: cats

 id         :integer          not null, primary key
 name       :string           not null
 created_at :datetime
 updated_at :datetime
 color      :string           
 house_id   :integer


class Cat < ActiveRecord::Base
  def house
    House.find(self.house_id)
  end
end
```
    In the above code, we've created an instance method in the Cat class called `house` with the intention that calling `#house` on an instance of `Cat` will tell us which house the cat is associated with. `self.house_id` will return the value (which will be an integer and the `id` of a house that is saved to the DB) for the `house_id` key for the instance of cat that we call it on. We then use that `id` as an argument for the `find` method that is called on the `House` class. Calling the method in the Rails console should return an instance of the class `House`.

    To create a *macro* of the above, use the `belongs_to` method to get the same functionality:
    ```ruby
    # == Schema Information
    #
    # Table name: cats
    #
    #  id         :integer          not null, primary key
    #  name       :string           not null
    #  created_at :datetime
    #  updated_at :datetime
    #  color      :string           
    #  house_id   :integer
    #

    class Cat < ActiveRecord::Base
      belongs_to :house,
        primary_key: :id,
        foriegn_key: :house_id,
        class_name: 'House'
    end
    ```
    The `belongs_to` method takes as it's arguments, the name of this association method `:house` and then a hash of key/value pairs (the next 3 lines could be inside curly braces but its not necessary. It IS a hash object, though). Inside the hash, we need the values for

      * `primary_key:`, which will be the id of an instance of the 'owning' class (in this case `House`) which will just be `:id`. Another way to think about this is the `primary_key` will be the name for the primary_key column (you can look at the schema information to see what the primary key is but it should always be :id) of the 'other' table that the class we're currently in 'belongs to' (`:id`).

      * The value for `foreign_key` will be the name of the column in this table (the table that 'belongs to') that points to the primary key of the other table, `house_id` in this case.

      * The value for `class_name` will be the name of the class (as a string or a symbol) of whatever object we want to return, in this case `'House'`.

    This `belongs_to` association returns the house that the cat 'belongs to'. To make a corresponding method for houses that returns the cats that live in a house:
    ```ruby
    class House < ActiveRecord::Base
      def cats
        Cat.where(house_id: self.id)
      end
    end
    ```

    The macro for the above code is a `has_many` association in the House model:
    ```ruby
    class House < ActiveRecord::Base
      has_many :cats,
        primary_key: :id,
        foriegn_key: :house_id,
        class_name: 'Cat'
    end
    ```

    Creating associations this way adds a buuuuuuuuunch of awesome functionality in addition to providing the created methods.

  * `has_many through` and `has_one through`
    ```ruby
    # == Schema Information
    #
    # Table name: toys
    #
    #  id         :integer          not null, primary key
    #  name       :string           not null
    #  cat_id     :integer          not null
    #  created_at :datetime
    #  updated_at :datetime

    class Toy < ActiveRecord::Base
      belongs_to :cat,
        primary_key: :id,
        foriegn_key: :cat_id,
        class_name: 'Cat'
    end
    ```
    Above is a model file for a Toy resource. Its `primary_key` is its `id` and its foreign_key is `cat_id`. We can build associations that allow us to find all of the toys for a given Cat, the House that a Toy lives in, all of the Toys for all of the Cats that live in a House, etc. This involves traversing multiple associations. Because toys are associated with cats and not houses. If were considering a House object and we want to find the toys that the cats in that house own, we have to traverse the associations between the models:
    ```
    House   --has_many->> Cat --has_many->> Toy
    House <<-belongs_to-- Cat <<-belongs_to Toy  
    ```

    ```ruby
    class House < ActiveRecord::Base
      has_many :cats,
        primary_key: :id,
        foriegn_key: :house_id,
        class_name: 'Cat'

      def toys
        toys = []
        self.cats.each do |cat|
          toys += cat.toys
        end
        toys
      end
    end
    ```
    Above is a method in the House model that will return all of the toys for all of the cats in a given House. This is one of the methods we want to generate with the `through` associations.

    ```ruby
    class House < ActiveRecord::Base
      has_many :cats,
        primary_key: :id,
        foriegn_key: :house_id,
        class_name: 'Cat'

      has_many :toys,
        through: :cats, # The name of the association IN THIS CLASS. The method will traverse through the association listed here.
        source: :toys   # An association in the `Cat` class. The name of the target class. The association called on the above value.

    end    
    ```
    Above, the new `has_many` association is similar to the first one. The first argument is a symbol that defines the name of the method that will be created. `primary_key` and `foreign_key` don't need to be provided but new keys (because this is a hash with key value pairs) `through:` and `source:` do. This code traverses the `:toys` association in the `Cat` class.
    ```ruby
    class Cat < ActiveRecord::Base
      belongs_to :house,
        primary_key: :id,
        foriegn_key: :house_id,
        class_name: 'House'

      has_many :toys,
        primary_key: :id,
        foriegn_key: :cat_id,
        class_name: 'Toy'

    end
    ```
    We've made a method that goes from `houses` through `cats` to `toys`. What about a method that goes from `toys` to `houses` through `cats`:
    ```ruby
    class Toy < ActiveRecord::Base
      belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: 'Cat'

      has_one :house,
        through: :cat,
        source: :house

    end
    ```
    Adding dependencies is done in the associations. A `dependent: :destroy` statement made in a `has_many` association. This tells Rails, if one of these resources is destroyed, destroy all the resources that have a `has_many` association back to this resource.
    ```ruby
    class Car <ActiveRecord::Base
      has_many :rental_requests,
      class_name: 'CarRentalRequest',
      dependent: :destroy
    ```
    In the above code, if a `car` resource is destroyed, Rails will remove any associated `rental_requests` from the DB as well.

**Adding Indicies** - Add an index to the database by using the `add_index` method in the migration. You can generate a new migration to do this (`$ rails g migration AddIndexToUsers`) if your adding an index to an already created table. The syntax for adding an index is `add_index <:table_name>, <:column_name>`
  ```ruby
  add_index :cats, :name
  ```

**Callbacks** - Methods that get called at specific times of an object's life cycle.
  `before_validation` (handy as a last chance to set forgotten fields)
  `after_create` (handy to do some post-create logic, like send a confirmation email)
  `after_destroy` (handy to perform post-destroy clean-up logic)


**Active Record** -

**Active Record Object** -

**ORM** - Object Relational Mapping. The system that translates between SQL records and Ruby objects. *Active Record* is an implementation of ORM for Rails. The Active Record ORM generates Ruby objects from the rows of SQL tables on *fetch* and translates Ruby objects back into table rows on save.

**REST** - Representational State Transfer. The way to route an HTTP request to the correct controller in a Rails server. (Why are they do they have this name? What is being represented? What objects state is being refereed to? And what is being transferred? **A representation of an objects state?**)

  This is a convention that is used so that the routes (in the `routes.rb` file, for example) will have the same functionality across applications.

  In the restful convention, the following requests should always generate similar results:

  A `GET` request to some resource should always return all the values for that resource. In Rails, the conventional way of accomplishing that is to point the `GET` request to the `index` action on that resource's controller. For example:
    `get 'superheroes'`
  should be routed to
    `to: 'superheroes#index'`

  That is, the index action (method) on the superheroes controller. Conventionally, the controller and the resource being requested should always have the same name.

  These are the following conventions for creating rails routes:

  ```ruby
  get '<resource>', to: '<resource>#index'
  get '<resource>', to: '<resource>#new'
  get '<resource>/:wildcard', to: '<resource<#edit'
  get '<resource>/:wildcard', to: '<resource>#show'
  post '<resource>', to: '<resource>#create'
  patch '<resource>', to: '<resource>#update'
  put '<resource>', to: '<resource>#update'
  delete '<resource>', to: '<resource>#destroy'
  ```
  The router is sensitive to the order of the routes in the routes.rb file. For example, if `get 'users/:id' => 'users#edit'` and `get 'users/:id' => 'users#show'` have the same path but different actions, the router will match `get 'users/:id' => 'users#edit'` and send it to the `edit` action because it is first in the file.

  Alternative syntax:
  ```ruby
  get    'users'     => 'users#index'
  post   'users'     => 'users#create'
  get    'users'     => 'users#new'
  get    'users/:id' => 'users#edit'
  get    'users/:id' => 'users#show'
  patch  'users/:id' => 'users#update'
  put    'users'     => 'users#update'
  delete 'users/:id' => 'users#destroy'
  ```

  Again, this is the verbose way of defining these routes. If these conventions are followed(as opposed to making ad-hoc routes), all the routes can be defined in one line in the `routes.rb` file with:
  ```ruby
  resources :superheroes, only: [:index, :show, :create, :update, :destroy]
  ```

  To create the standard 8 routes as simply as possible without any restrictions:
  ```ruby
  resources :superheroes
  ```

  Here, we have resources with sub-resources and we want to only have certain actions available to the sub-resources:

  ```ruby
  Rails.application.routes.draw do

    resources :superheroes do
      resources :abilities, only: [:index]
    end

    resources :abilities, only: [:show, :update, :create, :destroy]
  end
  ```
  This creates a nesting structure. A user can list all of a superhero's abilities with a request to `superheroes/:id/abilities`. This is called a *collection route* because an entire collection is being requested/shown. The actions like `:show` and `:update` are only designed in this case to deal with one ability at a time, so they don't have to be nested. These are called *member routes*.

  This design decision assumes that each ability has a unique id, as in, Superman's flying ability has a different id than Green Lantern's flying ability. Therefore, you need a superhero's id to list all their abilities but only an ability's id to do something like update it or delete it.

**Controller** - Controllers are Rails constructs which are responsible for controlling resources. A controller is really just a class. One controller will have the actions to control one resource.

  The Rails convention for naming controllers files is `<resource_name>_controller.rb`, using snake case. Because controllers are essentially classes, when you make a new controller for a resource, you want to create a class with the Rails naming convention using CamelCase, like: `<ResourceName>Controller` For example, a resource called 'silly' could have a route:
  ```ruby
  get 'silly', to: 'silly#fun'
  ```
  a controller file called: `silly_controller.rb` containing a class:
  ```ruby
  class SillyController < ApplicationController

  end
  ```
  The class also must inherit from `ApplicationController`

**Views** - Files in the `views` folder in a rails project are used to generate html pages from the data generated by models and the data they pull from the DB. In early projects, I was taking the data from models and the DB and sending it back to the browser as pure json. Views are ways to render the same data formatted with html. The controller recieves the data from the model (which pulls it from the DB), sends it to the view which formats it with html and sends it back to the controller, then to the browser.

  The instance methods in a controller (such as an `index` method) are going to trigger views with the `render` method that they contain. Because this is inside of an instance method, the view will have access to instance variables created in that method.

  ```ruby
  class BooksController < ApplicationController

    def index
      books = Books.all
      render :index
    end

  end
  ```
  The above code is a controller called `BooksController` that puts all the book objects returned from the `#all` method into a *local* variable `books`. The render method looks for a file called `index` in the `/views/books/` directory (because we're in the `books` controller and rails knows these things) then sends whatever that returns back to the browser.

  ```ruby
  class BooksController < ApplicationController

    def index
      @books = Books.all
      render      
    end

  end
  ```

**redirect_to vs. render** - When `render` is called inside a method, the controller packages up an HTML response using the data it has and sends it back to the user (through the router). Its going to be the application HTML with the template of whatever action we're currently in (`:show` for the show action, `:index` for the index action etc.)

  When `redirect_to` is called, it serves up response consisting of a 300 level status code to client. This response tells the client to make a new request to the provided url (this can be provided by a helper method which generates a url for an application resource. `users_url` or `books_url`, for example. Check the routes). `redirect_to 'http://metafilter.com/'` will cause the client to make another request to the given url (in this case, metafilter.com).

  You can only have a single `redirect_to` or `render` method in a controller action. They are not equivalent to `return` as in they are not going to end execution of a method. Having both `render` and `redirect_to` in a method will give you a *double render error*.

**Unexpected _** - When you get an 'unexpected h' or 'c' or something in the browser while trying to render json.

**Template** - Templates are use HTML and Ruby to generate formatted HTML pages with the data from a resource model and the DB. A completed template is a view that is ready to be rendered.

**Partials** - Essentially, a boilerplate template that will be rendered inside another template. Partials are not complete views and should not be rendered on their own. Partials have to be called or invoked from inside another template. Partials are \*.html.erb files usually stored in the `views` folder but they always begin with an underscore (thats how rails knows they're partials). `_userform.html.erb`, for example.

  partials receive local variables, not instance variables.

  ```ruby
  <ul>
    <% @books.each do |book| %>
      <%= render 'book', book: book %>
    <% end %>
  </ul>
  ```
  The above code is going to render a partial (the file is named `_book.html.erb`) which will provide some data formated in html for each book in the Book collection. The template that is calling up the partial is provided an instance variable from the controller method:
  ```ruby
  def index
    @books = Book.all
    render :index
  end
  ```
  the template then renders the partial and gives it a local variable `book`. Because the partial, key, and local variable being passed to it all have the same name, Rails can deduce all required info from one name:
  ```ruby
  <ul>
    <%= render @books %>
  </ul>
  ```

**Params** - params are a hash-like object inside Rails controllers (also a instance method?). It is given to the controller by the router.

  > The params come from the user's browser when they request the page. For an HTTP GET request, which is the most common, the params are encoded in the url. For example, if a user's browser requested http://www.example.com/?foo=1&boo=octopus then params[:foo] would be "1" and params[:boo] would be "octopus". In HTTP/HTML, the params are really just a series of key-value pairs where the key and the value are strings, but Ruby on Rails has a special syntax for making the params a hash-like object with hashes inside. For example, if the user's browser requested http://www.example.com/?vote[item_id]=1&vote[user_id]=2 then params[:vote] would be a hash, params[:vote][:item_id] would be "1" and params[:vote][:user_id] would be "2". - *StackOverflow*

  When the router receives an HTTP request, it generates the `params` object from the query string contained in the URL?
    > That's just one of the sources for params. The other two are the request body and the route params.

**ActiveRecord::Base** - Base is a class in the ActiveRecord module. The 'Base' refers to database(?). Used for binding ActiveRecord objects to database tables. The objects infer their attributes from the table definition.

**ERB** - Stands for Embedded Ruby. ERB files contain Ruby code wrapped in HTML.
  ```
  <% ruby code that will not be printed %>
  <%= ruby code that we want to render %>
  ```
  When editing an erb file in atom, use the shortcuts `- + <tab>` for the first and `= + <tab>` for the second.

**Actions** - Actions are Ruby methods defined inside of a controller.

**HTTP Route** - The combination of the path in the URL and the HTTP method that determines (in the case of Rails) which controller receives the request and generates a response.

**MVC** - Model View Controller. The design methodology Utilized by Rails.
