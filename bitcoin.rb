#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'uri'
require 'net/http'

def getprice
  uri = URI.parse('https://coinbase.com/api/v1/prices/spot_rate?currency=EUR')  
  response = Net::HTTP.get_response(uri)
  data = response.body
  
  result = JSON.parse(data)
  price = result["amount"]
  
  return price

  sleep 5
end



