$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "silicon_mobilizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "silicon_mobilizer"
  s.version     = SiliconMobilizer::VERSION
  s.authors     = ["Yann IRBAH"]
  s.email       = ["yirbah@siliconsalad.com"]
  s.homepage    = "http://www.siliconsalad.com"
  s.summary     = "Mobile devices detection for Rails apps"
  s.description = "Takes the pain of managing mobile devices on your application away from you."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"

  s.add_development_dependency "capybara"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"

  s.add_development_dependency "sqlite3"
end
