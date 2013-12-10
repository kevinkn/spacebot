#!/usr/bin/env ruby

require 'cinch'
require './raumstatus.rb'
require './bitcoin.rb'
require './feature.rb'
require './litecoin.rb'
require './help.rb'
require './klima.rb'
require './ddate.rb'


bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.net"
    c.channels = ["#hasi"]
    # Only enable for debugging:
    # @random = Random.new_seed.to_s
    c.nick = "Raumstatus#{@random}"
  end

  on :message, /^!raumstatus/ do |m|
    m.reply getRaumstatus
  end
  
  on :message, /^!help/ do |m|
    m.reply getHelp
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
    m.reply checkBTC(query)
  end
  
  on :message, /^!litecoin/ do |m|
    m.user.send "Einen Moment bitte, lass mich das kurz für dich nachgucken"
    array = checkLTC
    array.each do |line|
      m.user.send line
    end
  end
  
  on :message, /^!raumklima/ do |m|
    m.reply getKlima
  end

  on :message, /^!ddate/ do |m|
    m.reply getddate
  end
  
  on :message, /^!christmas/ do |m|
    m.user.send File.read('christmas')
  end

end

bot.start 

