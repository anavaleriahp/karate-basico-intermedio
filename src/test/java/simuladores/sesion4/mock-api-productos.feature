Feature: API local de productos para los ejercicios de la sesión 4

  Background:
    * def productoExistente =
      """
      {
        "id": 25,
        "sku": "KARATE-025",
        "nombre": "Teclado mecánico",
        "categoria": "Accesorios",
        "precio": 79.9,
        "existencias": 12,
        "activo": true
      }
      """

  Scenario: pathMatches('/productos/{id}') && methodIs('get')
    * def encontrado = pathParams.id == '25'
    * def responseStatus = encontrado ? 200 : 404
    * def response = encontrado ? productoExistente : { codigo: 'PRODUCTO_NO_ENCONTRADO', mensaje: 'El producto no fue encontrado' }
