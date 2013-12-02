$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fakebook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fakebook"
  s.version     = Fakebook::VERSION
  s.authors     = ["Jordan Rogers-Smith"]
  s.email       = ["jordan.rogers-smith@betapond.com"]
  s.homepage    = "www.jordanrs.co.uk"
  s.summary     = "Capture real response from facebook and replay them in future tests"
  s.description = "Fakebook captures JavaScript SDK requests to facebook and caches them to be reused later. "

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.12.2"
end
