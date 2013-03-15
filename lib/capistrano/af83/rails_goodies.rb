require 'readline'

namespace :rails do
  desc "Tail Rails logs"
  task :log do
    stream "tail -f #{shared_path}/log/#{rails_env}.log"
  end

  desc "Open a Rails console"
  task :console do
    input = ''
    run "cd #{current_path} && #{bundle_cmd} exec rails console", once: true do |chan, stream, data|
      next if data.chomp == input.chomp || data.chomp == ''
      print data
      next unless data.chomp =~ />\s+$/ # Bad prompt detection

      # Readline's quite tolerant, but most control codes (Ctrl-u, Ctrl-l, ...)
      # will screw up the process' stream.
      input = Readline.readline('', true)
      break if input.nil? # EOF
      chan.send_data "#{input}\n"
    end
  end
end
