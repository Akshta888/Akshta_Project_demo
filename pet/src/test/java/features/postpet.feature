@regression
Feature: Add a new pet using POST API call

Background:
	* url  'https://petstore.swagger.io/v2/pet'
  * def requestPayload = read('../resources/addpet.json')
   * def requestPayload1 = read('../resources/addpet_405.json')
	
Scenario: Add a pet using given data and validate id is present & status is available
Given url 'https://petstore.swagger.io/v2/pet'
And request requestPayload
When method POST
Then status 200
* print response
And match $.id == '#present'
And match $.status == 'available'


Scenario: Add a pet using given data and validate 
Given url 'https://petstore.swagger.io/v2/pet'
And request requestPayload1
When method GET
Then status 405
* print response
* match $.id == '#notpresent'

