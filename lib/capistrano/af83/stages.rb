# This file was taken from https://github.com/TechnoGate/capistrano-exts

# By default, we have 3 stages (dev, staging and production)
# and we detect other stages if they have a file in confif/deploy.
default_stages = [:dev, :staging, :prod]
location = fetch(:stage_dir, "config/deploy")
unless exists?(:stages)
  set :stages, Dir["#{location}/*.rb"].map { |f| File.basename(f, ".rb") }
end

desc "Set the target stage to `dev'."
task :dev do
  set :stage,     :dev
  set :branch,    :master
  set :rails_env, :dev
  set(:default_environment) { { "RAILS_ENV" => rails_env } }
  server "#{user}@#{application}", :app, :web, :db, :primary => true
  load "#{location}/#{stage}" if File.exists?("#{location}/#{stage}.rb")
end

desc "Set the target stage to `staging'."
task :staging do
  set :stage,     :staging
  set :branch,    :master
  set :rails_env, :staging
  set(:default_environment) { { "RAILS_ENV" => rails_env } }
  server "#{user}@#{application}", :app, :web, :db, :primary => true
  load "#{location}/#{stage}" if File.exists?("#{location}/#{stage}.rb")
end

desc "Set the target stage to `prod'."
task :prod do
  set :stage,     :prod
  set :branch,    :production
  set :rails_env, :production
  set(:default_environment) { { "RAILS_ENV" => rails_env } }
  load "#{location}/#{stage}"
end

stages.each do |name|
  desc "Set the target stage to `#{name}'."
  task(name) do
    set :stage, name.to_sym
    load "#{location}/#{stage}"
  end
end

namespace :multistage do
  desc "[internal] Ensure that a stage has been selected."
  task :ensure do
    if !exists?(:stage)
      logger.important "Defaulting to `dev'"
      find_and_execute_task(:dev)
    end
  end
end

on :start, "multistage:ensure"
