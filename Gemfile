source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.6"

gem "bootsnap", ">= 1.4.4", require: false
gem "devise", "~> 4.9"
gem "groupdate", "~> 6.2"
gem "jbuilder", "~> 2.7"
gem "kaminari", "~> 1.2", ">= 1.2.2"
gem "pg", "~> 1.5", ">= 1.5.3", group: :production
gem "puma", "~> 5.0"
gem "pundit", "~> 2.3"
gem "rails", "~> 6.1.7", ">= 6.1.7.4"
gem "rolify", "~> 6.0", ">= 6.0.1"
gem "rubocop-rails", "~> 2.19", ">= 2.19.1"
gem "sass-rails", ">= 6"
gem "simple_form", "~> 5.2"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "sqlite3", "~> 1.4"
end

group :development do
  gem "bullet"
  gem "letter_opener", "~> 1.8"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]


gem "dockerfile-rails", ">= 1.5", :group => :development

gem "sentry-ruby", "~> 5.10"

gem "sentry-rails", "~> 5.10"
