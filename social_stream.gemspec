require File.join(File.dirname(__FILE__), 'lib', 'social_stream', 'version')

Gem::Specification.new do |s|
  s.name = "social_stream"
  s.version = SocialStream::VERSION.dup
  s.summary = "Social networking features and activity streams for Ruby on Rails."
  s.description = "Ruby on Rails engine supporting social networking features and activity streams."
  s.authors = [ "GING - DIT - UPM",
                "CISE - ESPOL" ]
  s.homepage = "http://social-stream.dit.upm.es/"
  s.files = `git ls-files`.split("\n")

  # Gem dependencies
  s.add_runtime_dependency('social_stream-base', '~> 0.9.22')
  s.add_runtime_dependency('social_stream-documents', '~> 0.3.3')
 
  # Development Gem dependencies
  #
  # Integration testing
  s.add_development_dependency('capybara', '~> 0.4.1.2')
  # Testing database
  case ENV['DB']
  when 'mysql'
    s.add_development_dependency('mysql2')
  when 'postgres'
    s.add_development_dependency('pg')
  else
    s.add_development_dependency('sqlite3', '~> 1.3.5')
  end
  s.add_development_dependency('database_cleaner')
  
  # Specs
  s.add_development_dependency('rspec-rails', '~> 2.14.1')
  # Fixtures
  s.add_development_dependency('factory_girl')
  # Population
  s.add_development_dependency('forgery',  '~> 0.4.2')
  # Continous integration
  s.add_development_dependency('ci_reporter', '~> 1.6.4')
end
