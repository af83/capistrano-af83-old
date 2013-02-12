# encoding: UTF-8
depend :remote, :command, "bundle"

namespace :faye do
  desc 'Start faye'
  task :start, :roles => :app do
    run "cd #{current_path} && #{bundle_cmd} exec thin start -R faye.ru -C #{shared_path}/faye.yml"
  end

  desc 'Stop faye'
  task :stop, :rules => :app do
    run "cd #{current_path} && #{bundle_cmd} exec thin stop -R faye.ru -C #{shared_path}/faye.yml"
  end

  desc 'Restart faye'
  task :restart, :roles => :app, :except => { :no_release => true }  do
    run "cd #{current_path} && #{bundle_cmd} exec thin restart -R faye.ru -C #{shared_path}/faye.yml"
  end
end

namespace :faye do
  desc "Copy faye config"
  task :copy do
    upload "config/faye/#{rails_env}.yml", "#{shared_path}/faye.yml", :via => :scp
  end
end

before "deploy:restart", "faye:copy"
