@BulkCertify
Feature: Bulk Certify

  Background:
    * url karate.properties['baseUrl']
    * def result = call read('classpath:Divoc/authentication/CreateAuthToken.feature')
    * def authToken = result.response.access_token
    * def correctUploadID = "2"
    * def incorrectUploadID = "898989"

  Scenario:  "Validate response is 200 when valid csv file uploaded "

    Given url baseUrl
    And path "divoc/api/v1/bulkCertify"
    And header Authorization = 'Bearer '+ authToken
    * def temp = karate.readAsString('classpath:data/UploadVaccinationDetails.csv')
    And multipart file file =  { value: '#(temp)', filename: 'UploadVaccinationDetails.csv', contentType: 'text/csv' }
    When method post
    Then status 200

  Scenario:  "Certify all the candidates uploaded in csv "
    Given url baseUrl
    And path "divoc/api/v1/certify/uploads"
    And header Authorization = 'Bearer '+ authToken
    When method get
    Then status 200
    * print response

  Scenario: Check response code if header missing in csv is 400

    Given url baseUrl
    And path "divoc/api/v1/bulkCertify"
    And header Authorization = 'Bearer '+ authToken
    * def temp = karate.readAsString('classpath:data/UploadVaccinationDetailsMissingHeader.csv')
    And multipart file file =  { value: '#(temp)', filename: 'UploadVaccinationDetailsMissingRow.csv', contentType: 'text/csv' }
    When method post
    Then status 400


  Scenario: "Check response code is 200 if upload id exists"
    Given url baseUrl
    And path "divoc/api/v1/certify/uploads/"+correctUploadID+"/errors"
    And header Authorization = 'Bearer '+ authToken
    When method get
    Then status 200
    * print response

  Scenario: Check response code is 400 if upload id does not exist
    Given url baseUrl
    And path "divoc/api/v1/certify/uploads/"+incorrectUploadID+"/errors"
    And header Authorization = 'Bearer '+ authToken
    When method get
    Then status 404
    * print response



