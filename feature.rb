#!/usr/bin/env ruby

require 'rubygems'
require 'json'

def featurerequest(feature, name)
  hash = {"#{name}" => "#{feature}"}
  
  File.open("features.json", "a+") do |f|
    f.puts(hash.to_json)
  end

  return true
end



