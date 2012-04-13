# Use thin for deployment

depend :remote, :command, "bundle"

namespace :deploy do
  desc 'Start thin'
  task :start, :roles => :app do
    run "cd #{current_path} && #{bundle_cmd} exec thin start -C #{shared_path}/thin.yml"
  end

  desc 'Stop thin'
  task :stop, :rules => :app do
    run "cd #{current_path} && #{bundle_cmd} exec thin stop -C #{shared_path}/thin.yml"
  end

  desc 'Restart thin'
  task :restart, :roles => :app, :except => { :no_release => true }  do
    run "cd #{current_path} && #{bundle_cmd} exec thin restart -C #{shared_path}/thin.yml"
  end
end

namespace :thin do
  desc "Copy thin config"
  task :copy do
    upload "config/thin/#{rails_env}.yml", "#{shared_path}/thin.yml", :via => :scp
  end
end

before "deploy:restart", "thin:copy"
