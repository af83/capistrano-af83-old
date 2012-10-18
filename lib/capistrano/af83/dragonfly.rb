# Add recipe for Dragonfly

namespace :dragonfly do
  desc "Symlink dragonfly's temp directories (for Rack::Cache)"
  task :symlink, role: [:app] do
    run "mkdir -p #{shared_path}/dragonfly && ln -nfs #{shared_path}/dragonfly #{release_path}/tmp/dragonfly"
  end
end

after 'deploy:update_code', 'dragonfly:symlink'
