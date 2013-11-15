#!/usr/bin/env ruby

require 'cinch'
require_relative 'query.rb'
require_relative 'bitcoin.rb'

t = ["Es sind $Menschen im HaSi!", "Das HaSi sollte hell 
      erleuchtet sein!", "Kommen Sie jetzt ins HaSi und spielen Sie mit anderen Leuten Brettspiele!"]
f = ["*beep* All humans exterminated!", "HaSi is out of order.", "Zurzeit ist niemand im HaSi."]

fruit = ["Apfel!", "Banane!", "Gurke!", "Kiwi!", "Tomate!", "Paprika!"] 

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.net"
    c.channels = ["#hodor"]
    c.nick = "Raumstatus"
  end

  on :message, /^!raumstatus/ do |m|
    status = yolo
    if status == true
      m.reply t.sample
    else
      m.reply f.sample
    end
  end
  
  on :message, /#YOLO/ do |m|
    m.reply "#SWAG!"
  end

  on :message, /#SWAG/ do |m|
    m.reply "#YOLO!"
  end

  on :message, /^!fruchtsalat/ do |m|
    m.reply fruit.sample
  end
  
  on :message, /^!bitcoin/ do |m|
    price = getprice
    m.reply "Ein Bitcoin ist zurzeit circa #{price} Euro wert."
  end

end

bot.start 

