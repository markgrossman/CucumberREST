#!/usr/bin/ruby

require "sinatra"
require "json"
require "fileutils"

def return_json(file)
	json = File.read(file)
	
	json.gsub!(/\n/, " ").gsub(/ /,'')
	
	json = JSON.parse(json)
	
	json.to_json()
end

get '/example' do
  return_json("Responses/Example.json")
end

post "/hello" do
	data = JSON.parse( request.body.read.to_s )
	response = {"Hello"=>data['name']}
	return response.to_json
end
