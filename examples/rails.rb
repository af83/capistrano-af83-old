# Encoding: utf-8

# This is an example of `config/deploy.rb` file for a Rails3 project.

# TODO Fill these two variables
set :user,    "please_fill_me"
set :appname, "please_fill_me"

require "capistrano/af83"
load "capistrano/af83/info"
# TODO run `cap dev info` and check if variables are OK

# Use the capistrano rules for precompiling assets with the Rails assets
# pipeline on deploys.
set :public_children, %w(images)
load "deploy/assets"

# TODO choose if you want to use thin or unicorn
load "capistrano/af83/thin"
# load "capistrano/af83/unicorn"

# TODO uncomment the extensions you want to use
# load "capistrano/af83/custom_maintenance_page"
# load "capistrano/af83/es"
# load "capistrano/af83/mongoid"
# load "capistrano/af83/resque"
# load "capistrano/af83/js_routes"

# IRC notification
notification.irc do |irc|
  irc.host    "chat.freenode.net"
  irc.channel { "#af83-#{appname}" }
  irc.message { "#{local_user} deployed #{application} to #{deploy_to} (branch: #{branch})" }
end

# TODO add here other rules for this project (when needed)

