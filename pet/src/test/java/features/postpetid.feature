@regression
Feature: Update pet using POST API call

Background:
	* url  'https://petstore.swagger.io/v2/pet'
	* def requestPayload =
"""
{
  "id": 9222968140497180179,
  "name": "boxer",
  "status": "pending"
}
"""

	* def requestPayload1 =
"""
{ 
   "id": 0
  "name": "boxer",
  "status": "not available"
}
"""

Scenario: Update a pet using given data and update the status
Given url 'https://petstore.swagger.io/v2/pet' 
And path '9222968140497180179'
And request requestPayload
Given header Content-Type = 'application/x-www-form-urlencoded'
When method POST
Then status 200
* print response
* match $.code == 200
And match $.message == '#present'


#Scenario: Update a pet using given data and update the status
#Given url 'https://petstore.swagger.io/v2/pet' 
#And path '9222968140491042131'
#And request requestPayload1
#Given header Content-Type = 'application/x-www-form-urlencoded'
#When method POST
#Then status 405
#* print response


