# Add a recipe for resque

namespace :resque do
  desc "start resque queues"
  task :start do
    run "cd #{current_path} && #{bundle_cmd_cmd} exec rake resque:pool:start", :once => true
  end

  desc "stop resque queues"
  task :stop do
    run "cd #{current_path} && #{bundle_cmd_cmd} exec rake resque:pool:stop", :once => true
  end

  desc "restart resque queues"
  task :restart do
    run "cd #{current_path} && #{bundle_cmd_cmd} exec rake resque:pool:stop && sleep 1 && #{bundle} exec rake resque:pool:start", :once => true
  end
end

after 'deploy:update_code', 'resque:restart'
