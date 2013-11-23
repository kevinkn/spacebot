#!/usr/bin/env ruby

require 'cinch'
require_relative 'query.rb'
require_relative 'bitcoin.rb'
require_relative 'feature.rb'

t = ["Es sind $Menschen im HaSi!", "Das HaSi sollte hell 
      erleuchtet sein!", "Kommen Sie jetzt ins HaSi und spielen Sie mit anderen Leuten Brettspiele!"]
f = ["*beep* All humans exterminated!", "HaSi is out of order.", "Zurzeit ist niemand im HaSi."]

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.net"
    c.channels = ["#hodor"]
    c.nick = "Raumstatus"
  end

  on :message, /^!ping/ do |m|
    m.reply "pong!"
  end

  on :message, /^!raumstatus/ do |m|
    status = yolo
    if status == true
      m.reply t.sample
    else
      m.reply f.sample
    end
  end
  
  on :message, /^!featurerequest (.+)/ do |m, query|
    state = featurerequest(query, m.user.nick)
    if state == true
      m.reply "Ihre Featurerequest wird bearbeitet."
    else
      m.reply "Irgendwas hat nicht funktioniert. Panik!"
    end
  end
   
  on :message, /^!bitcoin (.+)/ do |m, query|
    msg = checkBTC(query, m.user.nick)
    m.reply msg
  end
 
end

bot.start 

