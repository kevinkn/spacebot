#!/usr/bin/env ruby

require 'cinch'
require_relative 'query.rb'

fnord = "mu"

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.net"
    c.channels = ["#hasi"]
    c.nick = "Raumstatus"
  end

  on :message, /^!raumstatus/ do |m|
    status1 = yolo
    m.reply status1
  end
end

bot.start 

