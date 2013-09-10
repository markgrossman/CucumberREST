Feature: Sample REST 
     In order to test a REST service
     As a tester
     I want to verify responses from the server

Scenario: GET to /example
     When I make a get to "/example"
     Then the response code should be "200"
     	And "firstName" should equal "John"

Scenario: GET a route that doesn't exist
	When I make a get to "/Hello"
	Then the response code should be "404"

Scenario: POST to a route
	When I make a post to "/hello" with the name "John"
	Then "Hello" should equal "John"
