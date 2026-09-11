---
name: generador-componentes-karate
description: Genera o actualiza pruebas de componente en Karate DSL desde un contrato OpenAPI, respetando las reglas, etiquetas, rutas, datos y controles de revisión del repositorio.
---

# Generador de componentes Karate

Genera una propuesta de pruebas revisable desde un archivo OpenAPI YAML o la documentación de un endpoint. Nunca inventes endpoints, credenciales, encabezados, esquemas ni reglas de negocio del banco.

## Contexto obligatorio

Antes de editar pruebas:

1. Lee `qa/reglas-karate.yml`.
2. Lee [convenciones-repositorio.md](references/convenciones-repositorio.md).
3. Inspecciona la operación del contrato y los features existentes del mismo dominio.
4. Marca como supuestos las reglas faltantes que requieran revisión del QA.

## Flujo de trabajo

1. Extrae método, ruta, parámetros, seguridad, esquema de solicitud, esquemas de respuesta y códigos de error.
2. Presenta una matriz de cobertura antes de generar escenarios.
3. Separa las validaciones derivadas del contrato de las reglas de negocio y los supuestos.
4. Reutiliza `karate-config.js`, los features de autenticación, los esquemas y los datos existentes.
5. Genera el conjunto mínimo útil: camino feliz, errores documentados y límites relevantes.
6. Usa esquemas o datos esperados independientes. Nunca compares un campo de la respuesta consigo mismo.
7. Mantén secretos fuera de features, registros, archivos de datos y prompts.
8. Ejecuta el runner más específico e informa el comportamiento que no quedó cubierto.

## Resultado esperado

- Matriz que relacione los identificadores de escenario con las operaciones y respuestas del contrato.
- Features dentro de `src/test/java/bdd/<dominio>`.
- Esquemas reutilizables dentro de `src/test/java/responses/<dominio>`.
- Lista explícita de supuestos y reglas que requieren confirmación del QA.

No modifiques silenciosamente las etiquetas globales, la autenticación compartida ni la configuración de integración continua.
