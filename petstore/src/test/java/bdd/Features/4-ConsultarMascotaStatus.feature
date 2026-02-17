Feature: Consultar la mascota por Status

  Background: url

    * def urlBase = 'https://petstore.swagger.io/v2/pet'
    * def busquedaStatus = '/findByStatus?'
    * configure connectTimeout = 15000
    * configure readTimeout = 15000
    * configure ssl = true

  @ConsultarMascotaStatus
  Scenario: Se envian los datos correctos - Ok

    Given url urlBase + busquedaStatus + 'status=sold'
    And header Accept = 'application/json'
    When method Get
    Then status 200
    * print response