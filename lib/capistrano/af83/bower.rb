# encoding: UTF-8
namespace :bower  do
  desc 'Install bower executable on the server'
  task :check_install do
    run 'command -v bower >/dev/null 2>&1 || npm install bower -g'
  end

  desc "Install JS/CSS assets using bower"
  task :install do
    run "cd #{release_path} && bower --no-color install --production"
  end

  desc 'Force install and resolve dependencies'
  task :force_install do
    run "cd #{release_path} && bower --no-color install --production --force-latest"
  end

  desc 'Cache clean'
  task :cache_clean do
    run "cd #{release_path} && bower --no-color cache clean"
  end
end

before 'deploy:update_code', 'bower:check_install'
