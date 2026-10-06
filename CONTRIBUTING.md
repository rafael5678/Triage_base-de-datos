# Guía de Contribución para Base de Datos

Recomendaciones para proponer cambios en el esquema:
1. Escriba las palabras clave SQL en mayúsculas (`SELECT`, `INSERT`, `CREATE TABLE`).
2. Defina comentarios de columna (`COMMENT ON COLUMN`) para campos no auto-evidentes.
3. Valide que los scripts sean idempotentes cuando corresponda (`IF NOT EXISTS`).
