namespace :database do
  desc "Link the config/database.yml file in the release_path"
  task :symlink do
    run "test -f #{release_path}/config/database.yml || ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
end

after "deploy:update_code", "database:symlink"
