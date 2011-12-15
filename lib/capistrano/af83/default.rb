# Set default values

default_run_options[:pty] = true

# Obviously, we are git lovers
depend :remote, :command, "git"
set :scm,          :git
set :scm_username, :af83
set :repository,   "#{scm_username}@git.af83.com:#{appname}.git"

set :use_sudo,     false
set :deploy_via,   :remote_cache
set (:application) { "#{rails_env}.#{appname}.af83.com" }
set (:deploy_to)   { "/var/www/#{user}/#{rails_env}" }

# I don't know why capistrano don't do the cleanup by default,
# but it should be the case.
set :keep_releases, 5
after "deploy:update", "deploy:cleanup"

# TODO move this somewhere else
depend :remote, :command, "bundle"
set :bundle_cmd,    "bundle"
