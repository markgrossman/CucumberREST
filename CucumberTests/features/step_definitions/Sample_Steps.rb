When /^I make a get to "([^\"]*)"$/ do |path|
	RestClient.get("#{HOST}#{path}"){ |response, request, result|
	  case response.code
	  when 200
	    @response = JSON.parse(response)
	  else
	    @code = response.code
	  end
	}
end

Then /^"([^\"]*)" should equal "([^\"]*)"$/ do |item, expected|
  expect(@response[item]).to eq(expected)
end

Then /^the response code should be "([^\"]*)"$/ do |code|
	expect(@code.to_s).to eq(code)
end