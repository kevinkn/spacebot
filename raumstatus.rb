#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'uri'
require 'net/http'

def getRaumstatus
  uri = URI.parse('http://spaceapi.hasi.it')  
  response = Net::HTTP.get_response(uri)
  data = response.body
  result = JSON.parse(data)
  
  statmessages = File.read('statmessages.json')
  statusstrgs = JSON.parse(statmessages)
 
  @status = result["open"]
  
  if @status == true
    message = statusstrgs["open"].sample
  else
    message = statusstrgs["closed"].sample
  end

  return message
  sleep 1.337
end



