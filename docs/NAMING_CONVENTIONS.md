# Convenciones de Nombres en Base de Datos

- **Tablas**: Sustantivos en minúsculas y plural (`pacientes`, `signos_vitales`).
- **Columnas**: snake_case descriptivo (`fecha_registro`, `score_criticidad`).
- **Llaves Primarias**: Siempre denominadas `id`.
- **Llaves Foráneas**: Nombre de la tabla foránea en singular seguido de `_id` (`paciente_id`).
- **Índices**: Prefijo `idx_` seguido del nombre de la tabla y columnas indexadas.
