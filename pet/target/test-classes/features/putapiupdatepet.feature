@regression
Feature: Update an existing pet

  Background: 
   * url  'https://petstore.swagger.io/v2/pet'
   * def requestPayload = read('../resources/updatepet.json')
   * def requestPayload1 = read('../resources/updatepet404.json')
   * def requestPayload2 = read('../resources/updatepet405.json')
   * def requestPayload3 = read('../resources/updatepet400.json')
  
 Scenario: Update an existing pet's status 
    Given url 'https://petstore.swagger.io/v2/pet'
    And request requestPayload
    When method PUT
    Then status 200
    * print response
    And match $.status == 'available'
    
    #
   #Scenario: Update an existing pet and validate pet not found
    #Given url 'https://petstore.swagger.io/v2/pet'
    #And request requestPayload1
    #When method PUT
    #Then status 404
    #* print response
    #
    
    Scenario: Validate response by calling GET call instead of PUT
    Given url 'https://petstore.swagger.io/v2/pet'
    And request requestPayload2
    When method GET
    Then status 405
    * print response
    * match $.id == '#notpresent'
    
    #Scenario: Update an existing pet and validate invalid id
    #Given url 'https://petstore.swagger.io/v2/pet'
    #And request requestPayload3
    #When method PUT
    #Then status 400
    #* print response
  #
    
    
    

    
  

