Feature: obtener token de spotify
  Background: Login y guardar token
    * def requests = read('classpath:requests/request-token-spotify.json')
    * url baseUrlTokenSpotify
#    * if (!spotify_client_id) karate.fail('Falta la propiedad -Dspotify-client-id')
#    * if (!spotify_client_secret) karate.fail('Falta la propiedad -Dspotify-client-secret')
    * set requests.client_id = spotify_client_id
    * set requests.client_secret = spotify_client_secret

  @gettokenspotify
  Scenario: Se obtiene el token de spotify
    Given path '/api/token'
    And form fields requests
    When method post
    Then status 200
    And match response.access_token == '#string'
    And match response.token_type == '#string'
    And match response.expires_in == '#number'
    * def accessToken = response.access_token
