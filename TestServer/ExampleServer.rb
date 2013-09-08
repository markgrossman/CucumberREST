#!/usr/bin/ruby

require "sinatra"
require "json"
require "fileutils"

def return_json(file)
	json = File.read(file)
	
	json.gsub!(/\n/, " ").gsub(/ /,'')
	
	json = JSON.parse(json, :max_nesting => false)
	
	json.to_json(:max_nesting => false)
end

get '/example' do
  return_json("Responses/Example.json")
end
