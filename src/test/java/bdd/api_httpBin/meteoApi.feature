@openmeteoapi
Feature: Validación de pronóstico meteorológico

  Background:
    * url 'https://api.open-meteo.com'
    * def parametros = read('classpath:params/params-openmeteo.json')

  Scenario Outline: Consultar el clima de varias ciudades
    Given path 'v1', 'forecast'
    And params parametros
    When method get
    Then status 200

    And match response.latitude == '#number'
    And match response.longitude == '#number'
    And match response.timezone == '#string'
    And match response.hourly.time == '#[] #string'
    And match response.hourly.temperature_2m == '#[] #number'
    And match response.hourly.relative_humidity_2m == '#[] #number'

    # Las series horarias deben tener la misma cantidad de elementos
    * def hours = response.hourly.time.length
    And assert response.hourly.temperature_2m.length == hours
    And assert response.hourly.relative_humidity_2m.length == hours

    # Validación de reglas de negocio sobre todos los valores
    And match each response.hourly.relative_humidity_2m == '#number? _ >= 0 && _ <= 100'

    Examples:
      | ciudad | latitude | longitude |
      | Lima   | -12.0464 | -77.0428  |
      | Madrid |  40.4168 |  -3.7038  |
      | Bogotá |   4.7110 | -74.0721  |