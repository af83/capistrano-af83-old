# encoding: UTF-8
namespace :nginx  do
  desc "reload nginx"
  task :reload do
    run "sudo /etc/init.d/nginx reload"
  end
end