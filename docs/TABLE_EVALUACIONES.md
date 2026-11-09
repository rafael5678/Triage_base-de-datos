> **English:** Developer note for `TABLE_EVALUACIONES`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Especificación de Tabla: `evaluaciones_triage`

Contiene el dictamen de triaje, nivel Manchester y estatus en el flujo de atención.

## Estados de Atención
- `EN_ESPERA`: Paciente registrado pendiente de llamado médico.
- `EN_ATENCION`: Paciente ingresado a consultorio o sala de shock.
- `ATENDIDO`: Proceso asistencial culminado.
- `REEVALUADO`: Signos actualizados; genera nuevo registro histórico.
