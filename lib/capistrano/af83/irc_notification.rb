# IRC notification
notification.irc do |irc|
  irc.host    "chat.freenode.net"
  irc.channel fetch(:irc_chan, "#af83-#{appname}")
  irc.message { "#{local_user} deployed #{application} to #{deploy_to} (branch: #{branch})" }
end
