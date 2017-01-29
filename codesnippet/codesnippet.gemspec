$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "codesnippet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "codesnippet"
  s.version     = Codesnippet::VERSION
  s.authors     = ["llb1026"]
  s.email       = ["dlwldbs1026@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Codesnippet."
  s.description = "TODO: Description of Codesnippet."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "sqlite3"
end
