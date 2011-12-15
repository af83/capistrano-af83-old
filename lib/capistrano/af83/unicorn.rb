# Use unicorn for deployment

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{current_path} && #{bundle_cmd} exec unicorn -c config/unicorn.rb -E #{rails_env} -D"
  end

  task :stop, :roles => :app do
    set :unicorn_pidfile, "#{shared_path}/pids/unicorn.pid"
    run "if [ -e #{unicorn_pidfile} ] ; then kill -QUIT `cat #{unicorn_pidfile}` ; fi"
  end

  task :restart, :roles => :app  do
    set :unicorn_pid, capture("cat #{shared_path}/pids/unicorn.pid").chomp
    run "kill -USR2 #{unicorn_pid}"
    sleep 1
    run "kill -QUIT #{unicorn_pid}"
  end
end
