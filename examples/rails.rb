# Encoding: utf-8

# This is an example of `config/deploy.rb` file for a Rails3 project.

# Uncomment for disable colors
# see https://github.com/capistrano/capistrano/wiki/Formatting-Logs
#disable_log_formatters

# TODO Fill these two variables
set :user,    "please_fill_me"
set :appname, "please_fill_me"

require "capistrano/af83"
# You can change the default_stage (:dev by default) with this setting
# set :default_stage, :staging

load "af83/info"
# TODO run `cap dev info` and check if variables are OK

# Use the capistrano rules for precompiling assets with the Rails assets
# pipeline on deploys.
set :public_children, %w(images)
load "deploy/assets"
# OR you can choose our improved version of this task:
# load "af83/deploy/assets"

# TODO choose if you want to use thin or unicorn
load "af83/thin"
# load "af83/unicorn"

# TODO uncomment the extensions you want to use
# load "af83/bundler" # check bundler is installed on your server
# load "af83/custom_maintenance_page"
# load "af83/es"
# load "af83/mongoid"
# load "af83/database"
# load "af83/resque"
# load "af83/js_routes"
# load 'af83/rails_goodies' # rails:log, rails:console and symlink REVISION to public/revision.html

# IRC notification
notification.irc do |irc|
  irc.host    "chat.freenode.net"
  irc.channel { "#af83-#{appname}" }
  irc.message { "#{local_user} deployed #{application} to #{deploy_to} (branch: #{branch})" }
end

# TODO add here other rules for this project (when needed)

