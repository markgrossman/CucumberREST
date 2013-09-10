When /^I make a get to "([^\"]*)"$/ do |path|
	RestClient.get("#{HOST}#{path}"){ |response, request, result|
	  handleResponse(response)
	}
end

Then /^"([^\"]*)" should equal "([^\"]*)"$/ do |item, expected|
	expect(@response[item]).to eq(expected)
end

Then /^the response code should be "([^\"]*)"$/ do |code|
	expect(@code.to_s).to eq(code)
end

When /^I make a post to "([^\"]*)" with the name "([^\"]*)"$/ do |path, data|
	RestClient.post("#{HOST}#{path}",{"name" => data}.to_json, :content_type => :json, :accept => :json){ |response, request, result|
		handleResponse(response)
	}
end

def handleResponse(response)
	@code = response.code
	if @code == 200
		@response = JSON.parse(response)
	end
end



