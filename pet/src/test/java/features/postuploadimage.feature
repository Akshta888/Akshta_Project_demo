@regression
Feature: Upload pet image using POST API call

Background:
	* url  'https://petstore.swagger.io'

Scenario: Upload a pet image and validate response code
Given url 'https://petstore.swagger.io/v2/pet/4/uploadImage'
* def filelocation = '../image/boxer.jpg'
And multipart field petId  = { id: '9223372036854775116'}
And multipart field additionalMetadata = { description:'data'}
And multipart file file = { read: '#(filelocation)', filename: 'boxer.jpg', content-Type: 'multipart/form-data' }
When method POST
Then status 200
* print response
And match $.code == 200

Scenario: Id and image are not provided in the request 
Given url 'https://petstore.swagger.io/v2/pet/4/uploadImage'
And multipart field additionalMetadata = { description:'data'}
When method POST
Then status 500
* print response
