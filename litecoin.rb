#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'uri'
require 'net/http'

def checkLTC
  btc = iteration("btc")
  eur = iteration("eur")
  usd = iteration("usd")

  re1 = "1 Litecoin ist wert:"
  re2 = "#{btc} Bitcoin"
  re3 = "#{eur} Euro"
  re4 = "#{usd} US-Dollar"
  
  array = [re1, re2, re3, re4]
  sleep 10
  return array
end

def iteration(id)
  api_url = "https://btc-e.com/api/2/ltc_#{id}/ticker"
  return getprice(api_url)
end

def getprice(api)
  uri = URI.parse(api)  
  response = Net::HTTP.get_response(uri)
  data = response.body
  
  result = JSON.parse(data)
  price = result["ticker"]["avg"]
  return price
end




