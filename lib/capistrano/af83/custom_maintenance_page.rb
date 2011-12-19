# Use a custom maintenance page
# See http://ariejan.net/2011/09/19/capistrano-and-the-custom-maintenance-page

namespace :deploy do
  namespace :web do
    task :disable, :roles => :web, :except => { :no_release => true } do
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }
      require 'erb'
      reason, deadline = ENV['REASON'], ENV['deadline']
      template = File.read(File.join(File.dirname(__FILE__), "templates", "maintenance.rhtml"))
      result = ERB.new(template).result(binding)
      put result, "#{shared_path}/system/maintenance.html", :mode => 0644
    end
  end
end

before "deploy:cold", "deploy:web:disable"
after  "deploy:cold", "deploy:web:enable"
