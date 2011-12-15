# Use thin for deployment

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{current_path} && #{bundle_cmd} exec thin start -C #{shared_path}/thin.yml"
  end

  task :stop, :rules => :app do
    run "cd #{current_path} && #{bundle_cmd} exec thin stop -C #{shared_path}/thin.yml"
  end

  task :restart, :roles => :app, :except => { :no_release => true }  do
    run "cd #{current_path} && #{bundle_cmd} exec thin restart -C #{shared_path}/thin.yml"
  end
end
