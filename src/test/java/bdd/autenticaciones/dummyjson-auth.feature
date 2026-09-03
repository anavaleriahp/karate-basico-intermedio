@dummyjsonAuthentication
Feature: Utilizar el Token

  Background: precondiciones
    * def response = read('classpath:responses/response-authentication.json')
    * configure retry = {count:3,interval:3000}
    * url baseUrlAut
    * call read('classpath:bdd/autenticaciones/get-token.feature@gettoken')

  Scenario: Obtener usuario autorizado actual
    Given path '/auth/me'
    And header Authorization = 'Bearer ' + accessToken
    When method get
    Then status 200
    * print response
    And match response.username == 'emilys'
    And match response.company == response.company

  @refreshToken
  Scenario: Refrescar el token y validar acceso
    
    * retry until responseStatus == 200
    * print refreshToken
    Given path '/auth/refresh'
    * header Content-Type = 'application/json'
    And request {  expiresInMins: 30 }
    When method post
    Then status 200
    * def newAccessToken = response.accessToken

    Given path '/auth/me'
    And header Authorization = 'Bearer ' + newAccessToken
    When method get
    Then status 200
    And match response.username == 'emilys'