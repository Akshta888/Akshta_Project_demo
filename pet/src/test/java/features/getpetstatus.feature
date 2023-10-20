@regression
Feature: Finds Pets by status feature

Scenario: find pets by available status
* def query = {status:'available'}
Given url 'https://petstore.swagger.io/v2/pet'
And path 'findByStatus'
And params query
When method GET
Then status 200
* print response
* def expected = { "status": "available"}
* match response contains deep expected

Scenario: find pets by available as well as pending status
* def query = {status:'pending,available'}
Given url 'https://petstore.swagger.io/v2/pet'
And path 'findByStatus'
And params query
When method GET
Then status 200
* def expected = { "status": 'pending', "status":'available'}
* match response contains deep expected

Scenario: find pets by sold status
* def query = {status:'sold'}
Given url 'https://petstore.swagger.io/v2/pet'
And path 'findByStatus'
And params query
When method GET
Then status 200
* print response
* def expected = { "status": "sold"}
#* match response contains deep expected*

Scenario: find pets by pending status
* def query = {status:'pending'}
Given url 'https://petstore.swagger.io/v2/pet'
And path 'findByStatus'
And params query
When method GET
Then status 200
* print response
* def expected = { "status": "pending"}
* match response contains deep expected

Scenario: find pets by pending as well as sold status
* def query = {status:'pending,sold'}
Given url 'https://petstore.swagger.io/v2/pet'
And path 'findByStatus'
And params query
When method GET
Then status 200
* print response
* def expected = { "status": "pending", "status": "sold"}
#* match response contains deep expected

#Scenario: find pets by status other than available status
#* def query = {status:'not available'}
#Given url 'https://petstore.swagger.io/v2/pet'
#And path 'findByStatus'
#And params query
#When method GET
#Then status 400
#* print response