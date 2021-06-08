#  Proyecto Base de Karate para pruebas de integración en AcceptanceTest - REST, GraphQL, SOAP
_Karate es una herramienta de código abierto que combina la automatización de pruebas de API, simulacros , pruebas de rendimiento e incluso la automatización de la interfaz de usuario en un marco único y unificado . La sintaxis BDD popularizada por Cucumber es un lenguaje neutro y fácil incluso para los no programadores. Las afirmaciones y los informes HTML están integrados y puede ejecutar pruebas en paralelo para aumentar la velocidad._

_Si está familiarizado con Cucumber / Gherkin, la gran diferencia aquí es que no necesita escribir código extra de "pegamento" o "definiciones de pasos" de Java._

**RECOMENDACION !!!**: Visitar la documentacion oficial para obtener todas las ventajas de este potencial framework: https://github.com/intuit/karate
## Comenzando 🚀

_Este proyecto se descargará por medio del plugin del scaffold de clean architecture desarrollado por Ingenieria del Software expuesto en github como aporte OpenSource_




### Pre-requisitos 📋

_Para desarrollar y ejecutar pruebas con karate requieres unas cosas muy simples:_

- Java >= 1.8
- gradlew >= 6.0
- dependencias de karate en el build.gradle: karate-junit5:1.0.1


### Instalación 🔧

_Este proyecto se descargará por medio del plugin del scaffold de clean architecture desarrollado por Ingenieria del Software expuesto en github como aporte OpenSource_

**IMPORTANTE**: Este proyecto es una demo, proyecto base, para estructurar las pruebas de integracion (AcceptanceTest) que se realizarán, no es funcional si se ejecuta sin modificar, por eso a continuacion de contamos que debes modificar y configurar para comenzar en tu contexto de aplicacion con las pruebas:
- Ir al karate-config.js y modifical la `urlBase` por la url o endpoint de tu aplicacion
- Ir a los archivos .feature (src>test>resources>karate) agregar tus escenarios, metodos de prueba, aserciones, y todo lo necesario para tus pruebas en particular
- Ir a los runners de prueba (src>test>java>karate) y agregar en Runner.path(nombre del feature a probar)



Aquí se detalla la estructura que debe guiar las pruebas con Karate, es un ejemplo:

```
├───src
    └───test
        ├───java
        │   └───karate
        │   |    ├───demo1
        |   |    |    └───DemoUnoRunner.java
        │   |    └───demo2
        |   |         └───DemoDosRunner.java
        |   └───TestParallel.java
        |
        └───resources
            └───karate
            |    ├───demo1
            |    |   └───demo_uno.feature
            |    └───demo2
            |        └───demo_dos.feature
            └───karate-config.js
            └───logback-test.xml
```



- TestParallel -> Clase general en java que ejecuta los TESTS de karate en Paralelo y tambien genera el reporte de dichos TESTS en formato json que luego se convierte en reporte cucumber
## Ejecutando las pruebas ⚙️

```gradle
gradlew clean test -i
```


## Despliegue 📦

_Las pruebas de karate se deben promover por medio de una tarea publish artifact apuntando al path, esto en el pipeline de CI/CD en Azure DevOps que está enlazado con el repositorio contenedor de las pruebas_

## Construido con 🛠️


* [Karate](https://github.com/intuit/karate/) - El framework usado para integration test
* [Gradle](https://gradle.org/) - Manejador de dependencias
* [Cucumber Reporting](https://cucumber.io/docs/cucumber/reporting/) - Usado para generar reporte documentacion viva


## Wiki 📖

Puedes encontrar mucho más de cómo utilizar este framework karate en nuestra [Wiki](https://dev.azure.com/grupobancolombia/Vicepresidencia%20Servicios%20de%20Tecnolog%C3%ADa/_wiki/wikis/Vicepresidencia%20Servicios%20de%20Tecnolog%C3%ADa.wiki/10100/Pruebas-Integraci%C3%B3n-(Acceptance-Test-Backend)-karate)


## Autores ✒️

* **Mauricio Puerta** - *Pruebas Continuas*
* **Santiago Garcia** - *Ingeniería de Software*



---
⌨️ con ❤️ por [maupuert](https://github.com/mpuertao) 😊
