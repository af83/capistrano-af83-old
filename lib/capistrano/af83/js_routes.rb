# Create a JS file with the Rails routes

namespace :js do
  desc "Create js routes"
  task :create_routes do
    run "cd #{release_path} && #{bundle_cmd} exec rake js:routes"
  end
end

after "deploy:update_code", "js:create_routes"
