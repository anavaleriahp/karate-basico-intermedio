# Sesión 4: IA y contratos de API

Los ejercicios usan un contrato ficticio, un API simulado local y datos de entrenamiento. No requieren información ni credenciales del banco.

## Ejercicio 1: DeployGo y Quarkus

El contenido operativo es confidencial. Completa el espacio disponible en `espacio-ejercicio-1-deploygo-quarkus/README.md` únicamente con material autorizado.

## Ejercicio 2: del contrato a pruebas Karate con Codex

Entradas:

- `contratos/sesion4/api-productos.yml`
- `qa/reglas-karate.yml`
- `.agents/skills/generador-componentes-karate/SKILL.md`

Revisa `matriz-cobertura.md` y usa `prompts/generar-pruebas-componente.md` para repetir el flujo con Codex. El resultado de referencia está en `src/test/java/bdd/sesion4/contratos`.

Ejecución local sin dependencias externas:

```bash
mvn "-Dtest=bdd.sesion4.PruebasSesion4Test" test
```

## Ejercicio 3: respuesta del API contra MySQL

1. Ejecuta `src/test/resources/db/mysql-entrenamiento-karate.sql` en tu MySQL local.
2. Configura `MYSQL_URL`, `MYSQL_USER` y `MYSQL_PASSWORD`, o usa las propiedades Maven equivalentes.
3. Ejecuta el runner habilitando el laboratorio de base de datos:

```bash
mvn "-Dtest=bdd.sesion4.PruebasSesion4Test" "-Dsesion4.ejecutar.base-datos=true" test
```

El runner general excluye `@sesion4` para evitar que estos laboratorios se ejecuten dos veces durante `mvn test`.
