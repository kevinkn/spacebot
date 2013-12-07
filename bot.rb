#!/usr/bin/env ruby

require 'cinch'
require './raumstatus.rb'
require './bitcoin.rb'
require './feature.rb'
require './litecoin.rb'
require './help.rb'
require './klima.rb'
require './ddate.rb'
require './wetter.rb'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.net"
    c.channels = ["#hodor"]
    # Only enable for debugging:
    # @random = Random.new_seed.to_s
    c.nick = "Raumstatus_#{@random}"
  end

  on :message, /^!raumstatus/ do |m|
    m.reply getRaumstatus
  end
  
  on :message, /^!help/ do |m|
    m.user.send getHelp
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
    m.user.send checkBTC(query)
  end
  
  on :message, /^!litecoin/ do |m|
    m.user.send "Einen Moment bitte, lass mich das kurz für dich nachgucken"
    array = checkLTC
    array.each do |line|
      m.user.send line
    end
  end
  
  on :message, /^!raumklima/ do |m|
    m.user.send getKlima
  end

  on :message, /^!ddate/ do |m|
    m.reply getddate
  end
  
  on :message, /^!wetter (.+)/ do |m, query|
    m.user.send getWeather
  end

end

bot.start 

