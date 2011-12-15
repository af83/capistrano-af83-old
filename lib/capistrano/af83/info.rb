# Add the info task

desc 'prints the configuration'
task :info do
  show = Proc.new {|var| puts "\t- #{var}: #{fetch var}\n\n" }
  show.call "stage"
  show.call "user"
  show.call "appname"
  show.call "application"
  show.call "deploy_to"
  show.call "repository"
  show.call "branch"
  show.call "rails_env"
end
