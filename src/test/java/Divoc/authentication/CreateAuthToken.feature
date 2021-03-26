Feature: CreateAuthToken

  Background:
    * url karate.properties['baseUrl']


  Scenario:  "Generating AuthToken"

    Given url baseUrl
    And path "/keycloak/auth/realms/divoc/protocol/openid-connect/token"
    * def credentials = { grant_type: "#(grantType)" , client_id: "#(clientId)", client_secret: "#(clientSecret)" }
    * form fields credentials
    When method POST
    Then status 200
    * print response
    And assert response.access_token != null

