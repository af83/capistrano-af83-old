# Use the config/mongoid/#{rails_env}.yml file for mongoid config

namespace :mongoid do
  desc "Copy mongoid config"
  task :copy do
    upload "config/mongoid/#{rails_env}.yml", "#{shared_path}/mongoid.yml", :via => :scp, :once => true
  end

  desc "Link the mongoid config in the release_path"
  task :symlink do
    run "test -f #{release_path}/config/mongoid.yml || ln -s #{shared_path}/mongoid.yml #{release_path}/config/mongoid.yml", :once => true
  end

  desc "Create MongoDB indexes"
  task :index do
    run "cd #{current_path} && #{bundle_cmd} exec rake db:mongoid:create_indexes", :once => true
  end
end

after "deploy:update_code", "mongoid:copy"
after "deploy:update_code", "mongoid:symlink"
after "deploy:update", "mongoid:index"
