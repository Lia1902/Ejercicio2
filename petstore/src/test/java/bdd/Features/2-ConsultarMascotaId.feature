Feature: Consultar la mascota por ID

  Background: url

    * def urlBase = 'https://petstore.swagger.io/v2/pet'
    * configure connectTimeout = 15000
    * configure readTimeout = 15000
    * configure ssl = true

  @ConsultarMascota
  Scenario Outline: Se envian los datos correctos - Ok

    Given url urlBase + '/' + '<id>'
    And header Accept = 'application/json'
    When method Get
    Then status 200
    * print response

    Examples:
      | id |
      | 9223372036854775807|