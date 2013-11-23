#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'uri'
require 'net/http'

$currencies = ["USD", "GBP", "EUR"]

def checkBTC(query, user)
  info = "This data was produced from the CoinDesk Bitcoin Price Index. Non-USD currency data converted using hourly conversion rate from openexchangerates.org"

  if query == "help" 
    return "Help is available at: $placeholder"
  elsif query == "info"
    return info
  elsif verifyCurrency(query) == true
    return getmessage(getprice(query), query)
  else
    return "Oops! Something went wrong. Try '!bitcoin help'."
  end
end

def getprice(c)
  api = "https://api.coindesk.com/v1/bpi/currentprice.json"
  uri = URI.parse(api)  
  response = Net::HTTP.get_response(uri)
  data = response.body
  
  result = JSON.parse(data)
  price = result["bpi"]["#{c}"]["rate_float"]
  return price
end

def getmessage(amount, curr)
  msg = "Ein Bitcoin ist #{amount} #{curr} wert."
  return msg
end

def verifyCurrency(c)
  if $currencies.include?(c)
    return true
  else
    return false
  end
end


