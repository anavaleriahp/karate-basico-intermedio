@database-validation @requires-mysql
Feature: Validar datos de MySQL contra la respuesta de un API usando HTTPBin

  Background:
    * def db = Java.type('utils.DatabaseUtils')
    * url 'https://httpbin.org'

  Scenario: Comparar un SELECT de MySQL con la respuesta eco de HTTPBin
    * def dbProduct = db.querySingle('select id, sku, name, category, price, stock, active from products where id = 25')
    * def expectedApiBody =
      """
      {
        "product": "#(dbProduct)"
      }
      """

    Given path 'anything', 'products', dbProduct.id
    And request expectedApiBody
    When method post
    Then status 200

    And match response.json.product.id == dbProduct.id
    And match response.json.product.sku == dbProduct.sku
    And match response.json.product.name == dbProduct.name
    And match response.json.product.category == dbProduct.category
    And match response.json.product.price == dbProduct.price
    And match response.json.product.stock == dbProduct.stock
    And match response.json.product.active == dbProduct.active
    And match response.json.product == dbProduct
