# Create a JS file with the Rails routes

namespace :js do
  desc "Create js routes"
  task :create_routes do
    run "cd #{release_path} && #{bundle_cmd} exec rake js:routes"
  end

  desc "Download JS/CSS assets using bower"
  task :bower_install do
    run "cd #{release_path} && bower install"
  end
end

after "deploy:update", "js:create_routes"
