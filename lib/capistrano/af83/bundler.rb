# encoding: UTF-8

namespace :bundler do
  task :install do
    run 'gem query --local | grep bundler || gem install bundler'
  end
end

before 'deploy:update_code', 'bundler:install'
