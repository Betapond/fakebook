# Fakebook

Fakebook captures JavaScript SDK requests to facebook and caches them to be reused later. 

##Why Fakebook

Our current app has alot of client requests to the facebook api. During our feature specs these requests where causing intermittent reliability issues causing random failures during our test runs. Fakebook is an attempt to add (VCR)[https://github.com/vcr/vcr] like functionality to our client side facebook requests to help increase reliability and decrease run time of our RSpec specs.

##Installation

1) Add the following to your ``Gemfile``
```ruby
  group :test do 
    ...
    gem 'fakebook', github: 'Betapond/fakebook'
    ...
  end
```
###IMPORTANT

Make sure this gem is in your test group so it is not loaded in production / development.

2) Add the following to your spec helper
```ruby
  require 'fakebook'

  ...

  Fakebook.configure do |config|
    config.cache_directory = 'spec/fakebook_cache' 
  end
```
3) Its best to cache each test run on its own and the easiest way to do this is using an RSpec around block to automatically store each spec in its own subdirectory
```ruby
  config.around(:each) do |example|
    Fakebook.cache_subfolder = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
    example.run
  end
```
##Turn off Fakebook

If you don't want to use the Fakebook cache it can be turned off globally with
```ruby
  Fakebook.turn_off!
```
##TODO

- Make turn_off use environment variable as well
- Make turn_off be applicable on a per spec basis
- Add warnings for production and development enviroments

This project rocks and uses MIT-LICENSE.
