Feature: Consultar la mascota por ID

  Background: url

    * def urlBase = 'https://petstore.swagger.io/v2/pet'

  @ConsultarMascota
  Scenario Outline: Se envian los datos correctos - Ok

    Given url urlBase + '/' + '<id>'
    And header Accept = 'application/json'
    When method Get
    Then status 200
    * print response

    Examples:
      | id |
      | 9223372036854320218|