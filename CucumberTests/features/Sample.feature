Feature: Sample REST 
     In order to test a REST service
     As a tester
     I want to verify responses from the server

Scenario: GET to /example
     When I make a get to "/example"
     Then "firstName" should equal "John"

Scenario: GET a route that doesn't exist
	When I make a get to "/Hello"
	Then the response code should be "404"
