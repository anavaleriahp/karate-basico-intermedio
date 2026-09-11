# Prompt: generar pruebas desde OpenAPI

Usa la Skill `generador-componentes-karate` de este repositorio.

Analiza `contratos/sesion4/api-productos.yml` y propone pruebas de componente en Karate DSL para `obtenerProductoPorId`.

Antes de modificar archivos:

1. Lee `qa/reglas-karate.yml` y la estructura actual del proyecto.
2. Presenta una matriz con ID, caso, fuente, datos, respuesta esperada y etiquetas.
3. Separa lo definido por OpenAPI de los supuestos o reglas adicionales.

Después de mi revisión, genera o actualiza los features y esquemas en las carpetas existentes. Reutiliza `karate-config.js`, no incluyas secretos ni URLs fijas y ejecuta solamente `PruebasSesion4Test`. Al finalizar, informa la cobertura, los supuestos y el resultado.
