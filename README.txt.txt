Nombre del proyecto:PetStore

Entorno de desarrollo utilizado: Intellij Idea 2024.3.2.2 (Community Edition)
Herramienta: Karate

Se realizó la implmentación de los siguientes casos:

• Añadir una mascota a la tienda
• Consultar la mascota ingresada previamente (Búsqueda por ID)
• Actualizar el nombre de la mascota y el estatus de la mascota a “sold”
• Consultar mascota por Status


--------------------- Creación de estructura del proyecto ---------------------

- Dentro de la carpeta java (Ubicada dentro de la carpeta test de la carpeta "src")
- Se creó el paquete "bdd".
- Dentro del paquete "bdd", se crearon los paquetes "Features", "req" y "Runner".
- Dentro del paquete "Features", se crearon tres archivo de karate "AgregarMascota", "ConsultarMascotaId" y "ActualizarMascota".
- Dentro de paquete "req", está almacenado los body: body_ActualizarMascota.json y body_AgregarMascota.json. 


--------------------- Archivo de karate AgregarMascota  ---------------------

- En el background: Se define las varibles urlbase y body.

    * def urlBase = 'https://petstore.swagger.io/v2/pet'
    * def body = read('classpath:bdd/req/body_AgregarMascota.json')

- Tag: @AgregarNuevaMascota
 
- En el Scenario: Envío de datos correctos - Ok.
  Se considera el siguiente código:
  
    Given url urlBase
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request body
    When method POST
    Then status 200
    * print response

--------------------- Ejecución de AgregarMascota  ---------------------

- Nos ubicamos en la clase de RunnerTest, colocamos como tag "@AgregarNuevaMascota".

	package bdd.Runner;

	import com.intuit.karate.junit5.Karate;

	public class RunnerTest {

   	 @Karate.Test
    	Karate testSystemProperty() {
        	return Karate.run("classpath:bdd/Features")
                	.tags( "@AgregarNuevaMascota")
                	.karateEnv("cert");
    		}
	}


- Click derecho y seleccionamos la opción "Run RunnerTest".
- En la sección de RunnerTest, puede observa el éxito de la ejecución y el resultado obtenido. (Salida)

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


--------------------- Archivo de karate ConsultarMascota  ---------------------

- En el background: Se define las varibles urlbase y body.

	* def urlBase = 'https://petstore.swagger.io/v2/pet'
   

- Tag: @ConsultarMascota
 
- En el Scenario: Envío de Id correcto - Ok.
  Se considera el siguiente código:

  Scenario Outline: Se envian los datos correctos - Ok

    Given url urlBase + '/' + '<id>'
    And header Accept = 'application/json'
    When method Get
    Then status 200
    * print response

    Examples:
      | id |
      | 9223372036854775807|
  

--------------------- Ejecución de ConsultarMascota  ---------------------

- Nos ubicamos en la clase de RunnerTest, colocamos como tag "@ConsultarMascota".

	package bdd.Runner;

	import com.intuit.karate.junit5.Karate;

	public class RunnerTest {

   	 @Karate.Test
    	Karate testSystemProperty() {
        	return Karate.run("classpath:bdd/Features")
                	.tags( "@AConsultarMascota")
                	.karateEnv("cert");
    		}
	}


- Click derecho y seleccionamos la opción "Run RunnerTest".
- En la sección de RunnerTest, puede observa el éxito de la ejecución y el resultado obtenido. (Salida)  
 


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

 --------------------- Archivo de karate ActualizarMascota ---------------------

- En el background: Se define las varibles urlbase y body.

	* def urlBase = 'https://petstore.swagger.io/v2/pet'
    	* def body = read('classpath:bdd/req/body_ActualizarMascota.json')
   

- Tag: @ActualizarMascota
 
- En el Scenario: Envío de datos correctos - Ok.
  Se considera el siguiente código:

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
      | 9223372036854775807|
  
  
--------------------- Ejecución de ActualizarMascota  ---------------------

- Nos ubicamos en la clase de RunnerTest, colocamos como tag "@ActualizarMascota".

	package bdd.Runner;

	import com.intuit.karate.junit5.Karate;

	public class RunnerTest {

   	 @Karate.Test
    	Karate testSystemProperty() {
        	return Karate.run("classpath:bdd/Features")
                	.tags( "@ActualizarMascota")
                	.karateEnv("cert");
    		}
	}


- Click derecho y seleccionamos la opción "Run RunnerTest".
- En la sección de RunnerTest, puede observa el éxito de la ejecución y el resultado obtenido.

 Siendo el resultado un json con la siguiente estructura como por ejemplo:

{
    "code": 200,
    "type": "unknown",
    "message": "9223372036854775807"
}


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--------------------- Archivo de karate ConsultarMascotaStatus  ---------------------

- En el background: Se define las varibles urlbase y url complementaria.

	* def urlBase = 'https://petstore.swagger.io/v2/pet'
	* def busquedaStatus = '/findByStatus?'
   

- Tag: @ConsultarMascotaStatus  
 
- En el Scenario: Consulta exitosa.
  Se considera el siguiente código:

  Scenario: Consulta exitosa

    Given url urlBase + busquedaStatus + 'status=sold'
    And header Accept = 'application/json'
    When method Get
    Then status 200
    * print response

--------------------- Ejecución de ConsultarMascotaStatus  ---------------------

- Nos ubicamos en la clase de RunnerTest, colocamos como tag @ConsultarMascotaStatus  

	package bdd.Runner;

	import com.intuit.karate.junit5.Karate;

	public class RunnerTest {

   	 @Karate.Test
    	Karate testSystemProperty() {
        	return Karate.run("classpath:bdd/Features")
                	.tags( @ConsultarMascotaStatus  
                	.karateEnv("cert");
    		}
	}


- Click derecho y seleccionamos la opción "Run RunnerTest".
- En la sección de RunnerTest, puede observa el éxito de la ejecución y el resultado obtenido.

 Siendo el resultado un json con la siguiente estructura como por ejemplo:

[
  {
    "id": 9223372036854775386,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "Rockito26",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "sold"
  }
]
 






