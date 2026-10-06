# Especificación de Tabla: `pacientes`

Almacena la información demográfica fundamental de los usuarios admitidos en urgencias.

## Campos
- `id` (BIGSERIAL, PK): Identificador secuencial interno.
- `numero_identificacion` (VARCHAR(30), NOT NULL, UNIQUE): Cédula o pasaporte.
- `nombre` (VARCHAR(80), NOT NULL): Nombres del paciente.
- `apellido` (VARCHAR(80), NOT NULL): Apellidos del paciente.
- `edad` (INTEGER, NOT NULL): Edad en años cumplidos.
- `genero` (VARCHAR(15)): Género registrado.
- `fecha_registro` (TIMESTAMP WITH TIME ZONE, DEFAULT NOW()): Momento de ingreso.
