@crud-mascotas
Feature:CRUD API Mascotas


  Background: Configuración inicial
    Given url BaseUrl
    * def requests = read('classpath:requests/request-pet.json')

  @AddPet
  Scenario: Agregar una nueve mascota
    Given path '/v2/pet'
    And header Content-Type = 'application/json'
    And request requests.addPet
    When method post
    Then status 200
    * print 'Mascota agregada: ',response
    * print 'ID de la mascota: ', response.id
    And match $.id == '#number'

  @UpdatePet @ignore
  Scenario Outline: Actualizar la mascota agregada
    Given path '/v2/pet'
    And header Content-Type = 'application/json'
    And request requests.updatePet
    When method put
    Then status 200
    And print 'Mascota actualizada: ', response
    * def petId = response.id
    Examples:
      | name   |
      | 'Salvador' |

  @getPet
  Scenario: Consultar las mascotas
    # Para ejecutar este escenario, primero debes ejecutar el
      # escenario de actualización de mascota
    * call read('classpath:bdd/mascotas/crud-mascotas.feature@UpdatePet')
    * print 'ID de la mascota: ', petId
    Given path '/v2/pet', petId
    And header Content-Type = 'application/json'
    When method get
    Then status 200
