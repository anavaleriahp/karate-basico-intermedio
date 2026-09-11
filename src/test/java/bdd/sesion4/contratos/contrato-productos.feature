@sesion4 @ejercicio2 @componente @contrato @productos
Feature: [API de productos] Validación de componente generada desde el contrato OpenAPI

  Background:
    * url urlBaseSesion4
    * def esquemaProducto = read('classpath:responses/sesion4/esquema-respuesta-producto.json')

  @CP-PRODUCTO-001 @humo @camino-feliz
  Scenario: [CP-PRODUCTO-001] Consultar un producto existente respetando el contrato
    Given path 'productos', 25
    When method get
    Then status 200
    And match response == esquemaProducto
    And match response contains
      """
      {
        "id": 25,
        "sku": "KARATE-025",
        "activo": true
      }
      """

  @CP-PRODUCTO-002 @regresion @negativo
  Scenario: [CP-PRODUCTO-002] Informar el error definido cuando el producto no existe
    Given path 'productos', 999
    When method get
    Then status 404
    And match response == { codigo: 'PRODUCTO_NO_ENCONTRADO', mensaje: '#string' }
