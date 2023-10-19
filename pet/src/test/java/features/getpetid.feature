@regression
Feature: Find pet by ID

Scenario: find pet ID with status 404
Given url 'https://petstore.swagger.io/v2/pet'
And path '0'
When method GET
Then status 404
* print response
* def jsonresponse = response
* print jsonresponse
And match $.message == 'Pet not found'

Scenario: find pet ID and validate name value
Given url 'https://petstore.swagger.io/v2/pet'
And path '124002'
When method GET
Then status 200
* print response
* def jsonresponse = response
* print jsonresponse
* def name = jsonresponse.name
* print name
* match name == 'doggie'

#Scenario: find pet ID with status 400
#Given url 'https://petstore.swagger.io/v2/pet'
#And path '%0'
#When method GET
#Then status 400
#* print response
#* def jsonresponse = response
#* print jsonresponse