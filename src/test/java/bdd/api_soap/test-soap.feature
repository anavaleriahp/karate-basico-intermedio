@soapRequest
  Feature: Plan de pruebas orientado a las consultas de tipo soap
    Scenario: caso de prueba tipo POST
      Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
      When header Content-Type = 'text/xml; charset=utf-8'
      And request
      """
        <?xml version="1.0" encoding="utf-8"?>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
          <soap:Body>
            <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
              <ubiNum>500</ubiNum>
            </NumberToWords>
          </soap:Body>
        </soap:Envelope>
      """
      And method POST
      Then status 200