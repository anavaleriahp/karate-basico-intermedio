# karate-api
Automation API
# QA Labs Test

Este proyecto contiene pruebas y ejemplos para el laboratorio de QA utilizando [Karate DSL].

## Descripción

Se han implementado pruebas automatizadas de servicios REST utilizando Karate DSL.  
Entre los servicios probados se incluyen:
- Autenticación y autorización
- Consultas a APIs de usuarios y productos
- Validación de respuestas y manejo de errores
- Comparación de respuestas de API contra consultas a base de datos MySQL
- Validación de archivos CSV con alto volumen de data

Las pruebas cubren escenarios funcionales y de integración, asegurando la calidad de los servicios expuestos.

## Requisitos

- Java 17 o superior
- Maven

## Instalación

Clona el repositorio y asegúrate de tener Java 17 y Maven instalados.

## Ejecución de pruebas


### Ejecución básica
```bash
mvn test
```

### Ejecutar pruebas con tags y ambiente
```bash
mvn clean test -Dkarate.env=test "-Dkarate.options=--tags @<tag>"
```

### Solo ejecutar pruebas con tags
```bash
mvn test "-Dkarate.options=--tags @test"
```

### Ejecutar ejemplos nuevos
```bash
mvn test "-Dkarate.options=--tags @large-csv"
mvn test "-Dkarate.options=--tags @database-validation"
```

Para el ejemplo de base de datos primero ejecuta el script:

```bash
mysql -u root -p < src/test/resources/db/mysql-entrenamiento-karate.sql
```

Por defecto el test usa:
- URL: `jdbc:mysql://localhost:3306/karate_training`
- Usuario: `karate_user`
- Password: `karate_pass`

También puedes cambiar estos valores por variables de entorno (`MYSQL_URL`, `MYSQL_USER`, `MYSQL_PASSWORD`) o propiedades Maven:

```bash
mvn test "-Dkarate.options=--tags @database-validation" "-Dmysql.url=jdbc:mysql://localhost:3306/karate_training" "-Dmysql.user=karate_user" "-Dmysql.password=karate_pass"
```

## Estructura del proyecto

- `/src/main/java`: Código fuente principal (si aplica)
- `/src/test/java/bdd`: Features de Karate organizados por dominio (api_rest, api_soap, autenticaciones, mascotas, usuarios)
- `/src/test/java/bdd/examples/database`: Ejemplo para comparar MySQL contra una respuesta de API usando HTTPBin
- `/src/test/java/bdd/examples/files`: Ejemplo para validar CSV con alto volumen de data
- `/src/test/java/headers`, `/params`, `/requests`, `/responses`: Archivos auxiliares para pruebas (headers, parámetros, requests y respuestas)
- `/src/test/resources/db`: Scripts SQL para preparar la base de datos de los ejemplos
- `/src/test/java/utils`: Utilidades y helpers para las pruebas
- `karate-config.js`: Configuración global de Karate
- `KarateRunner.java`: Clase runner para ejecutar los tests
- `logback-test.xml`: Configuración de logs para pruebas
- `pom.xml`: Archivo de configuración de Maven

## Contribución

1. Haz un fork del repositorio.
2. Crea una rama (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz commit.
4. Envía un pull request.

## Licencia

Este proyecto es solo para fines educativos y de prueba.

