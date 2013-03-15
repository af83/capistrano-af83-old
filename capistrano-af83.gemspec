# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'capistrano/af83/version'

Gem::Specification.new do |s|
  s.name         = "capistrano-af83"
  s.version      = Capistrano::AF83::VERSION
  s.authors      = ["Bruno Michel"]
  s.email        = "bruno.michel@af83.com"
  s.homepage     = "https://github.com/af83/capistrano-af83"
  s.summary      = "Capistrano recipes for af83"
  s.description  = "Capistrano recipes for af83, mongoid, thin, faye and others"
  s.license      = 'MIT'

  s.files        = `git ls-files README.md LICENSE lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'

  s.add_dependency "capistrano", "~>2.14"
  s.add_dependency "capistrano-notification", "~>0.1"
  s.add_dependency "capistrano-maintenance", "~>0.0.2"
  s.add_dependency "shout-bot", "0.0.4"
  s.add_dependency "sushi", "~>0.0.2"
end
