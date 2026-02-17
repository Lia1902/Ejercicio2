Feature: Actualizar el nombre de la mascota y el status a vendido

  Background: url, archivos y variables necesarias
    * def urlBase = 'https://petstore.swagger.io/v2/pet'
    * def body = read('classpath:bdd/req/body_ActualizarMascota.json')
    * configure connectTimeout = 15000
    * configure readTimeout = 15000
    * configure ssl = true


  @ActualizarMascota
  Scenario Outline: Se envian los datos correctos - Ok

    Given url urlBase + '/' + '<id>'
    And header Accept = 'application/json'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And request body
    When method Post
    Then status 200
    * print response

    Examples:
      | id |
      |9223372036854775807|
