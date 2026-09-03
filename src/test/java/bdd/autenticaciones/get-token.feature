Feature: obtener token 
 Background: Login y guardar token
    * def requests = read('classpath:requests/request-authentication.json')
    * url baseUrlAut

 @gettoken
 Scenario: Se obtiene el token
    Given path '/auth/login'
    * header Content-Type = 'application/json'
    And request requests.success
    When method post
    Then status 200
    And print 'Token obtenido: ', response
    * def accessToken = response.accessToken
    * def refreshToken = response.refreshToken
    * print refreshToken