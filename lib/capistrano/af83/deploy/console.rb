# encoding: utf-8

namespace :deploy do

  desc "Create an environment-specific history file for IRB"
  task "create_irb_history_file" do
    run "touch #{deploy_to}/.irb_history"
  end

end

after "deploy:setup", "deploy:create_irb_history_file"
