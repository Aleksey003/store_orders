source 'https://rubygems.org'
if RUBY_VERSION =~ /1.9/ # assuming you're running Ruby ~1.9
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
gem 'tire'
gem "will_paginate", "~> 3.0.4"
gem "paperclip", "~> 3.0"
gem "cancan"
gem 'rails', '3.2.11'
gem 'savon', "~> 2.2.0"
gem 'devise'
gem 'ancestry'
gem 'paperclip-dropbox'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development do
	gem 'pg'
  #gem 'better_errors'
  #gem 'binding_of_caller'
end

#gem 'bcrypt-ruby'
gem 'twitter-bootstrap-rails'
gem "ckeditor"
gem 'libv8', :platforms => :ruby
gem "less-rails"
gem 'execjs'

group :test, :development do
	gem 'rspec-rails'
	gem 'debugger'
end

group :production do
	gem 'pg'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do

  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', '~> 0.11.1'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-fileupload-rails'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
#gem 'unicorn'

# Deploy with Capistrano
 gem 'capistrano'
 gem 'rvm-capistrano'
# To use debugger
# gem 'debugger'
