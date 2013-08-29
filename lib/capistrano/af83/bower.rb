# encoding: UTF-8
namespace :bower  do
  desc "Install JS/CSS assets using bower"
  task :install do
    run "cd #{release_path} && bower install --production"
  end

  desc 'Force install and resolve dependencies'
  task :force_install do
    run "cd #{release_path} && bower install --production --force-latest"
  end

  desc 'Cache clean'
  task :cache_clean do
    run "cd #{release_path} && bower cache clean"
  end
end
