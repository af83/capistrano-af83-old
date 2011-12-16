# This is our default stack

require "capistrano"

if defined?(Capistrano::Configuration)
  Capistrano::Configuration.instance.load_paths << File.dirname(__FILE__)
  Capistrano::Configuration.instance.load "af83/default"
  Capistrano::Configuration.instance.load "af83/environments"
  require "capistrano/af83/extensions"
end
