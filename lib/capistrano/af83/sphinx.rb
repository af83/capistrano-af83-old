# encoding: UTF-8
namespace :sphinx do
  desc "Rebuild sphinx index"
  task :rebuild do
    run "cd #{current_path} && #{bundle_cmd} exec rake ts:rebuild"
  end
  desc "Start sphinx"
  task :start do
    run "cd #{current_path} && #{bundle_cmd} exec rake ts:start"
  end
end

after "deploy:restart", "sphinx:rebuild"
