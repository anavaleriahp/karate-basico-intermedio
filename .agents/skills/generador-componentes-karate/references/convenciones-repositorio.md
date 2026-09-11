# Convenciones del repositorio

## Estructura

- Features: `src/test/java/bdd/<dominio>`
- Solicitudes: `src/test/java/requests`
- Esquemas de respuesta: `src/test/java/responses/<dominio>`
- Utilidades Java: `src/test/java/utils`
- Configuración global: `src/test/java/karate-config.js`
- Contratos de la sesión 4: `contratos/sesion4`

## Convención de escenarios

```gherkin
@CP-PRODUCTO-001 @humo @camino-feliz
Scenario: [CP-PRODUCTO-001] Consultar un producto existente
```

Aplica las etiquetas universales definidas en `qa/reglas-karate.yml`. Agrega solamente etiquetas que aporten selección, trazabilidad, propiedad o información de ejecución.

## Controles de revisión

- Las URLs y credenciales provienen de la configuración, propiedades o variables de entorno.
- El código de estado se valida antes del cuerpo.
- Los campos obligatorios usan un esquema independiente.
- Los valores estables se validan explícitamente; los variables, por tipo o formato.
- Los casos negativos validan el estado y el contrato de error.
- API contra base de datos compara una proyección deliberada, no la respuesta completa.
- Los valores variables de las consultas se envían como parámetros.
