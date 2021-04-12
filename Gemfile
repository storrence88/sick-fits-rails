source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'

# Authentication
gem 'devise-async' # For sending devise emails on background
gem 'devise-security' # Security functions for devise like adding password complexity

# Background Processing
gem 'sidekiq'
gem 'redis'
gem 'redis-namespace'

# CI Testing
gem 'rubocop-rails', require: false
gem 'brakeman', require: false

# CORS
gem 'rack-cors'

# Database
gem 'pg', '~> 1.1'
gem 'hookup'
gem 'enumerize'

# GraphQL
gem 'graphql'
gem 'graphql-batch'
gem 'ar_lazy_preload'

# GraphQL Authentication
gem 'graphql_devise'

# GraphQL Authorization
gem 'action_policy-graphql'

# Pagination
gem 'kaminari'

# Request Limiter and IP Blocker
# gem 'rack-attack'

# Searching Objects
gem 'ransack'

# Seed Data
gem 'faker'
gem 'factory_bot_rails'

# Server
gem 'puma', '~> 5.0'

# Service Objects
gem 'active_interaction', '~> 4.0'

# URL Slug
gem 'friendly_id', '~> 5.4.0'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'


# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'annotate'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'rspec-its'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'

  # For nicer error display
  gem 'better_errors'
  gem 'binding_of_caller'

  # Emails
  gem 'letter_opener_web', '~> 1.0'
  gem 'fivemat'

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
