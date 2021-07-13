# RECOMIENDO VISITAR EL SITIO OFICIAL DE KARATE FRAMEWORK: https://github.com/intuit/karate


Feature: Aquí va toda al descripción de la suite de pruebas a ejecutar DEMO1

  Como     ...
  Requiero ...
  Para     ...


  Background:
    * url urlBase
    * configure headers = { 'Content-Type': 'application/json' }
    # * def json = read('classpath:more-json.json') -> puedo declarar una variable que llame un json que tenga en otra carpeta para usar como request


  Scenario: Aquí se relata el escenario1 a probar y su objetivo
    Given path 'health'
    When method get
    Then status 200
    And match response != 'Error'
    And match response contains { id: #notnull }

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

  Scenario: Aquí se relata el escenario3 a probar y su objetivo
    Given path 'health'
    And request { name: 'monza' }
    When method post
    Then status 201
    And match response == { id: '#number', name: '#(name)' }

  Scenario: Aquí se relata el escenario4 a probar y su objetivo
    Given path 'health'
    And request read('my-json.json')
    When method put
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.name == 'monza'
    And match response $.name == 'monza'
    And match $.name == 'monza'


  ### RECOMENDATIONS: Los MATCHS son los mas importantes en las pruebas, estas aserciones nos van a permitir corroborar que las cosas estan bien o mal según validación