# encoding: UTF-8
namespace :bower  do
  desc "Download JS/CSS assets using bower"
  task :install do
    run "cd #{release_path} && bower install"
  end
end