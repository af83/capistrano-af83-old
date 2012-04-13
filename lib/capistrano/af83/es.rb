# Add a recipe for Elastic Search

namespace :es do
  desc "Start Elastic Search if needed"
  task :start do
    run "cd #{release_path} && #{bundle_cmd} exec rake es:soft_start", :once => true
  end

  desc "Restart Elastic Search if needed"
  task :restart do
    run "cd #{release_path} && #{bundle_cmd} exec rake es:running_restart", :once => true
  end

  desc "Recreate index and reindex last records for ES/Tire models"
  task :rebuild_index do
    run "cd #{current_path} && #{bundle_cmd} exec rake es:rebuild_index", :once => true
  end
end
