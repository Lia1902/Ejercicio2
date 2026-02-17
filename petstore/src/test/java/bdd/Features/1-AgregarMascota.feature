Feature: Agregar una nueva mascota a la tienda

  Background: url, archivos y variables necesarias

    * def urlBase = 'https://petstore.swagger.io/v2/pet'
    * def body = read('classpath:bdd/req/body_AgregarMascota.json')
    * configure connectTimeout = 15000
    * configure readTimeout = 15000
    * configure ssl = true


  @AgregarNuevaMascota
  Scenario: Se envian los datos correctos - Ok

    Given url urlBase
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request body
    When method POST
    Then status 200
    * print response