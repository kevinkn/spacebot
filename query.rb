#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'uri'
require 'net/http'

def yolo
  uri = URI.parse('http://spaceapi.hasi.it')  
  response = Net::HTTP.get_response(uri)
  data = response.body
  
  result = JSON.parse(data)
  status = result["open"]
  
  if status == true
    return "Es befinden sich $Menschen im HaSi! \o/"
  else
    return "*beep* All humans exterminated."
  end
  sleep 5
end



