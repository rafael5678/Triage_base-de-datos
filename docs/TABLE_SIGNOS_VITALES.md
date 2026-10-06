# Especificación de Tabla: `signos_vitales`

Registra cada medición fisiológica asociada a un paciente.

## Campos
- `id` (BIGSERIAL, PK): Llave primaria.
- `paciente_id` (BIGINT, FK): Referencia a la tabla `pacientes`.
- `frecuencia_cardiaca` (NUMERIC(5,2)): Pulsaciones por minuto.
- `frecuencia_respiratoria` (NUMERIC(5,2)): Respiraciones por minuto.
- `presion_sistolica` (NUMERIC(5,2)): mmHg.
- `presion_diastolica` (NUMERIC(5,2)): mmHg.
- `saturacion_oxigeno` (NUMERIC(5,2)): Porcentaje de SpO2.
- `temperatura` (NUMERIC(4,2)): Grados Celsius.
- `escala_glasgow` (INTEGER): Estado de conciencia (3 a 15).
