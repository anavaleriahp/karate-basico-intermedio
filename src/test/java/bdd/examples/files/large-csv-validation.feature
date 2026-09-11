@large-csv
Feature: Validar archivos CSV grandes con data

  Background:
    * def csv = Java.type('utils.CsvUtils')
    * def filePath = 'files/products-large.csv'

  Scenario: Validar estructura y cantidad de registros del CSV
    * def requiredHeaders = ['id', 'sku', 'name', 'category', 'price', 'stock', 'active']
    * match csv.hasRequiredHeaders(filePath, requiredHeaders) == true
    * match csv.countRows(filePath, true) == 40

  Scenario: Buscar una fila especifica sin cargar todo el archivo en memoria
    * def product = csv.findFirstByColumn(filePath, 'sku', 'SKU-1025')
    * match product.id == '25'
    * match product.name == 'Wireless Mouse'
    * match product.category == 'electronics'
    * match product.price == '189.90'
    * match product.stock == '45'
    * match product.active == 'true'

  Scenario: Leer el CSV con Karate cuando el archivo es pequeno o mediano
    * def rows = read('classpath:files/products-large.csv')
    * match rows[0].sku == 'SKU-1001'
    * match rows[39].sku == 'SKU-1040'
