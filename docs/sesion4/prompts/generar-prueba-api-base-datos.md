# Prompt: generar prueba del API contra la base de datos

Usa la Skill `generador-componentes-karate` y revisa el feature de contrato de productos.

Genera un escenario Karate que consulte `GET /productos/{id}` y contraste la respuesta con MySQL mediante `DatabaseUtils`.

Condiciones de control:

- Valida el estado del API.
- Usa una consulta parametrizada.
- Compara una proyección explícita de campos estables.
- Excluye marcas de tiempo, trazas y datos sensibles.
- Falla si la consulta devuelve cero o más de una fila.
- Mantiene las reglas de `qa/reglas-karate.yml`.

Antes de editar, presenta la consulta, la proyección y los riesgos de falsos positivos para revisión del QA. Ejecuta el ejercicio con la propiedad `sesion4.ejecutar.base-datos=true`.
