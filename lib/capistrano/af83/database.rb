# Use the config/database/#{rails_env}.yml file for database config

namespace :database do
  desc "Copy database config"
  task :copy do
    upload "config/database/#{rails_env}.yml", "#{shared_path}/database.yml", :via => :scp
  end

  desc "Link the config/database.yml file in the release_path"
  task :symlink do
    run "test -f #{release_path}/config/database.yml || ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
end

after "deploy:update_code", "database:copy"
after "deploy:update_code", "database:symlink"
