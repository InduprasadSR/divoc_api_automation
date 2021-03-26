@OTP
Feature: GenerateAndVerifyOTP

  Background:
    * url karate.properties['baseUrl']


  Scenario Outline:  "Generating and Verifying the OTP"

    * text otpgeneration =
        """
            {
                "phone": "<MobileNumber>"
            }

        """
    * def requestPayload = JSON.parse(otpgeneration)
    Given url baseUrl
    And path "/divoc/api/citizen/generateOTP"
    And request requestPayload
    When method post
    Then status 200

    * text getToken =
        """
            {
                "phone": "<MobileNumber>",
                "otp":"123456"
            }

        """
    * def requestPayload = JSON.parse(getToken)

    Given url baseUrl
    And path "/divoc/api/citizen/verifyOTP"
    And request requestPayload
    When method post
    Then status 200
    * print response
    And assert response.token != null
    * def authToken = response.token
    * print authToken


    Examples:
      | MobileNumber |
      | 9090909090   |






