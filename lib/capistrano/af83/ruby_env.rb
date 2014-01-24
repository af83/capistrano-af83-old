# encoding: UTF-8
namespace :ruby_env do
  desc "Copy ruby-env"
  task :copy do
    src = "admin/ruby-env/#{rails_env}"
    if File.exists? src
      upload src, "ruby-env", via: :scp
    else
      logger.info "ruby-env for #{rails_env} doesn't exists, expected path: #{src}."
    end
  end
end
before 'deploy', 'ruby_env:copy'
