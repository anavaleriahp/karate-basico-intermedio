# Matriz de cobertura

| ID | Fuente | Caso | Resultado esperado | Etiquetas |
|---|---|---|---|---|
| CP-PRODUCTO-001 | OpenAPI `GET /productos/{id}` - 200 | Consultar el producto 25 | Estado 200, esquema completo y valores estables | `@ejercicio2 @contrato @humo @camino-feliz` |
| CP-PRODUCTO-002 | OpenAPI `GET /productos/{id}` - 404 | Consultar el producto 999 | Estado 404 y contrato de error | `@ejercicio2 @contrato @regresion @negativo` |
| CP-PRODUCTO-003 | Regla del ejercicio 3 | Contrastar el producto 25 con MySQL | La proyección estable del API coincide con una única fila | `@ejercicio3 @base-datos @regresion @camino-feliz` |

Los valores del producto 25 son datos controlados del laboratorio. El escenario de base de datos es una regla del ejercicio, no una regla inferida del contrato ni del banco.
