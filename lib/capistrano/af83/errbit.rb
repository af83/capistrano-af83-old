# encoding: UTF-8
# Taken from https://gist.github.com/hrp/3337372

require 'net/http'
require 'uri'

namespace :errbit do
  desc "Notify deploys to errbit"
  task :notify, except: {no_release: true} do
    api_key = ENV['API_KEY'] || fetch(:api_key)
    user = local_user == 'hudson' ? 'Chuck Norris' : local_user
    rails_env = fetch(:rails_env, "production")
    host = fetch(:errbit_host, "errbit.af83.com")

    params = {
      'api_key'                => api_key,
      'deploy[rails_env]'      => rails_env,
      'deploy[local_username]' => user,
      'deploy[scm_repository]' => repository,
      'deploy[scm_revision]'   => current_revision
    }

    Net::HTTP.post_form("http://#{host}/deploys.txt", params)
  end
end

after "deploy", "airbrake:notify"
