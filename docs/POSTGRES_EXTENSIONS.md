> **English:** Developer note for `POSTGRES_EXTENSIONS`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Extensiones de PostgreSQL Utilizadas

- `uuid-ossp`: Soporte para generación de identificadores globales únicos si se requiere federación.
- `pg_stat_statements`: Telemetría del rendimiento de consultas SQL.
- `pgcrypto`: Primitivas criptográficas para hashing de datos confidenciales.
