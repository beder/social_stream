# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'lib', 'social_stream', 'base', 'version')

Gem::Specification.new do |s|
  s.name = "social_stream-base"
  s.version = SocialStream::Base::VERSION.dup
  s.summary = "Basic features for Social Stream, the core for building social network websites"
  s.description = "Social Stream is a Ruby on Rails engine providing your application with social networking features and activity streams.\n\nThis gem packages the basic functionality, along with basic actors (user, group) and activity objects (post and comments)"
  s.authors = [ "GING - DIT - UPM",
                "CISE - ESPOL" ]
  s.homepage = "http://social-stream.dit.upm.es/"
  s.files = `git ls-files`.split("\n")

  # Runtime gem dependencies
  #
  # Rails
  s.add_runtime_dependency('rails', '= 4.0.9')
  #Syntactically Awesome Stylesheets
  s.add_runtime_dependency('sass-rails', '~> 4.0.2')
  #Use Uglifier as compressor for JavaScript assets
  s.add_runtime_dependency('uglifier', '>= 1.3.0')
  # Use CoffeeScript for .js.coffee assets and views
  s.add_runtime_dependency('coffee-rails')
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  s.add_runtime_dependency('jbuilder', '~> 1.2')
  # Rals compatibility gems
  s.add_runtime_dependency('actionpack-action_caching')
  s.add_runtime_dependency('actionpack-page_caching')
  s.add_runtime_dependency('actionpack-xml_parser')
  s.add_runtime_dependency('actionview-encoded_mail_to')
  s.add_runtime_dependency('activerecord-session_store')
  s.add_runtime_dependency('activeresource')
  s.add_runtime_dependency('protected_attributes')
  s.add_runtime_dependency('rails-observers')
  s.add_runtime_dependency('rails-perftest')
  
  # Mysql2
  s.add_runtime_dependency('mysql2')   
  # Activity and Relation hierarchies
  s.add_runtime_dependency('ancestry')
  # SQL foreign keys
  s.add_runtime_dependency('foreigner', '~> 0.9.1')
  # Authentication
  s.add_runtime_dependency('devise')
  # CRUD controllers
  s.add_runtime_dependency('inherited_resources', '~> 1.5.0')
  # Slug generation
  s.add_runtime_dependency('stringex', '~> 2.5.2')
  # Avatar attachments
  s.add_runtime_dependency('avatars_for_rails', '~> 0.2.0')
  # jQuery
  s.add_runtime_dependency('jquery-rails')
  # jQuery-UI
  s.add_runtime_dependency('jquery-ui-rails')
  # Authorization
  s.add_runtime_dependency('cancan', '~> 1.6.4')
  # Pagination
  s.add_runtime_dependency('kaminari', '~> 0.15.1')
  # OAuth client Facebook
  s.add_runtime_dependency('omniauth-facebook','~> 1.4.1')
  # OAuth client Twitter
  s.add_runtime_dependency('omniauth-twitter','~> 1.0.0')
  # OAuth client Linkedin
  s.add_runtime_dependency('omniauth-linkedin')
  # Messages
  s.add_runtime_dependency('mailboxer','~> 0.11.0')
  # Tagging
  s.add_runtime_dependency('acts-as-taggable-on','~> 2.4.1')
  # HTML Forms
  s.add_runtime_dependency('formtastic')
  # Simple navigation for menu
  s.add_runtime_dependency('simple-navigation')
  # Background jobs
  s.add_runtime_dependency('resque','~> 1.25.1')
  # Modernizr.js javascript library
  s.add_runtime_dependency('modernizr-rails')
  # Sphinx search engine
  s.add_runtime_dependency('thinking-sphinx')
  # Route translation
  s.add_runtime_dependency('route_translator', '~> 3.2.4')

  # Development gem dependencies
  #
  # Integration testing
  s.add_development_dependency('capybara', '~> 0.4.1.2')
  # Testing database
  s.add_development_dependency('sqlite3-ruby')
  s.add_development_dependency('database_cleaner')

  # Specs
  s.add_development_dependency('rspec-rails', '~> 2.14.1')
  # Fixtures
  s.add_development_dependency('factory_girl')
  # Population
  s.add_development_dependency('forgery', '~> 0.4.2')
  # Continous integration
  s.add_development_dependency('ci_reporter', '~> 1.6.4')
  # Scaffold generator
  s.add_development_dependency('nifty-generators','~> 0.4.5')
end
