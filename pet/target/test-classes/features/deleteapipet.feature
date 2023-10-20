@regression
Feature: Delete a pet

Background:
	* url  'https://petstore.swagger.io/v2/pet'
  * def requestPayload = read('../resources/addpet.json')
    
   Scenario: Delete a pet using pet id 
    Given url 'https://petstore.swagger.io/v2/pet'
    And path '9223372016900012129'
     Given header api_key = '123'
    When method DELETE
    Then status 404
    * print response

	
  Scenario: Add a pet and delete it
 Given url 'https://petstore.swagger.io/v2/pet' 
 And request requestPayload
 Given header api_key = '123'
 When method POST
 Then status 200
 * print response
* def petid = $.id
 * print petid
  Given url 'https://petstore.swagger.io/v2/pet/' +petid
   When method DELETE
    Then status 200
    * print response
    And match $.message == '#present'
    And match $.code == 200
 
  #Scenario: Delete a pet using invalid Id
  #Given url 'https://petstore.swagger.io/v2/pet'
  #And path '%0'
  #When method DELETE
   #Then status 400
   #* print response
 #
    
    
    