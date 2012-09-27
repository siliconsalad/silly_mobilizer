
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "silly_mobilizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "silly_mobilizer"
  s.version     = SillyMobilizer::VERSION
  s.authors     = ["Yann IRBAH"]
  s.email       = ["yirbah@sillysalad.com"]
  s.homepage    = "http://www.sillysalad.com"
  s.summary     = "Mobile devices detection for Rails apps"
  s.description = "Takes the pain of managing mobile devices on your application away from you."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2"

  s.add_development_dependency "capybara"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"

  s.add_development_dependency "sqlite3"
end
