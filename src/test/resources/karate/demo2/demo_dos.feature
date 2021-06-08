# RECOMIENDO VISITAR EL SITIO OFICIAL DE KARATE FRAMEWORK: https://github.com/intuit/karate


Feature: Aquí va toda al descripción de la suite de pruebas a ejecutar DEMO2

  # Prosa que permite explicar los objetivos de la suite de pruebas contenida en este .feature
  Como     ...
  Requiero ...
  Para     ...


  # BACKGROUND-> Esta background es opcional!, los pasos aquí serán ejecutados en cada escenario
  Background:
    # Esta urlBase esta configurada en el archivo karate-config.js ó la puedes quemar acá
    * url urlBase
    # Puedo configurar headers generales para todos mis escenarios, tanto content-type, bearers, tokens, entre todos los que se requieran
    * configure headers = { 'Content-Type': 'application/json' }
    # * def json = read('classpath:more-json.json') -> puedo declarar una variable que llame un json que tenga en otra carpeta para usar como request


    # Escenario 1 -> Ejemplo petición GET
  Scenario: Aquí se relata el escenario1 a probar y su objetivo
    Given path 'health'
    When method get
    Then status 200
    And match response != 'Error'
    And match response contains { id: #notnull }
    # Luego del Then deben ir todos los matchs necesarios para validar la respuesta, OJO!!! no solo se validan coderesponse, tambien debemos validar payloads, errors, etc.


    # Escenario outline 2  Ejemplo que requiere de varia data para su validacion o funcionamiento
  Scenario Outline: Aquí se relata el escenario2 a probar y su objetivo, ejemplo
    Given path 'health/<name>'
    When method get
    Then status 200
    And match $.response.country == '<country>'

    Examples:
      | name   | country  |
      | monza  | Italy    |
      | spa    | Belgium  |
      | sepang | Malaysia |

    # Escenario 3 -> Ejemplo petición POST con request dentro del escenario
  Scenario: Aquí se relata el escenario3 a probar y su objetivo
    Given path 'health'
    And request { name: 'monza' }
    When method post
    Then status 201
    And match response == { id: '#number', name: '#(name)' }

    #Escenario 4 -> Ejemplo PUT con json inyectado desde otro archivo en el request
  Scenario: Aquí se relata el escenario4 a probar y su objetivo
    Given path 'health'
    # my-json.json esta en el mismo paquete donde esta la prueba, si esta por fuera del paquete, se usa classpath
    And request read('my-json.json')
    When method put
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.name == 'monza'
    And match response $.name == 'monza'
    And match $.name == 'monza'


  ### RECOMENDATIONS: Los MATCHS son los mas importantes en las pruebas, estas aserciones nos van a permitir corroborar que las cosas estan bien o mal según validación