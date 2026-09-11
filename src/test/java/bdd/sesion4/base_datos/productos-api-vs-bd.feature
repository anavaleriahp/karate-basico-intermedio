@sesion4 @ejercicio3 @componente @base-datos @productos @requiere-mysql
Feature: [API de productos] Consistencia entre la respuesta del API y MySQL

  Background:
    * url urlBaseSesion4
    * def baseDatos = Java.type('utils.DatabaseUtils')

  @CP-PRODUCTO-003 @regresion @camino-feliz
  Scenario: [CP-PRODUCTO-003] Comparar los campos estables del API con una consulta parametrizada
    * def idProducto = 25
    * def consulta = 'select id, sku, name as nombre, category as categoria, price as precio, stock as existencias, active as activo from products where id = ?'
    * def productoBaseDatos = baseDatos.querySingle(consulta, idProducto)
    * match productoBaseDatos != {}

    Given path 'productos', idProducto
    When method get
    Then status 200

    * def productoApi =
      """
      {
        "id": "#(response.id)",
        "sku": "#(response.sku)",
        "nombre": "#(response.nombre)",
        "categoria": "#(response.categoria)",
        "precio": "#(response.precio)",
        "existencias": "#(response.existencias)",
        "activo": "#(response.activo)"
      }
      """
    And match productoApi == productoBaseDatos
