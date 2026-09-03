@httpbin-multipart
Feature: Envío de multipart/form-data

  Background:
    * url 'https://httpbin.org'

  Scenario: Enviar campos y un archivo
    Given path 'post'
    And multipart field nombre = 'Ana'
    And multipart field tipoDocumento = 'contrato'
    # El archivo se carga desde el classpath
    And multipart file archivo = { read: 'classpath:files/documento.txt', filename: 'documento.txt', contentType: 'text/plain' }
    When method post
    Then status 200
    # campos de texto recibidos por el servidor.
    And match response.form.nombre == 'Ana'
    And match response.form.tipoDocumento == 'contrato'
    # validar el contenido que se envió en el archivo.
    And match response.files.archivo contains 'Archivo enviado desde Karate'

  Scenario: Enviar pedido desde el formulario de HTTPBin
    Given path 'post'
    # Cada form field representa un control del formulario de pedido de pizza.
    And form field custname = 'Ana Pérez'
    And form field custtel = '+51 999 888 777'
    And form field custemail = 'ana.perez@example.com'
    And form field size = 'medium'
    # La lista reproduce la selección de varios checkboxes con el mismo nombre.
    And form field topping = ['bacon', 'cheese']
    And form field delivery = '19:30'
    And form field comments = 'Tocar el timbre al llegar'
    When method post
    Then status 200
    # Valida los valores recibidos desde el formulario de pedido de pizza.
    And match response.form.custname == 'Ana Pérez'
    And match response.form.custtel == '+51 999 888 777'
    And match response.form.custemail == 'ana.perez@example.com'
    And match response.form.size == 'medium'
    # contains comprueba que se recibieron ambos toppings sin depender del orden.
    And match response.form.topping contains ['cheese', 'bacon']
    And match response.form.delivery == '19:30'
    And match response.form.comments == 'Tocar el timbre al llegar'
    # Se confirma que el cuerpo utilizó la codificación propia de un formulario HTML.
    And match response.headers['Content-Type'] contains 'application/x-www-form-urlencoded'
