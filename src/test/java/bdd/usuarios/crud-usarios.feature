Feature: Crud de usuarios

  Scenario: Crear usuario
    Given url 'https://reqres.in/api/users'
    And request {"name": "Yehison","job": "QE"}
    When method post
    Then status 201
    * print response
