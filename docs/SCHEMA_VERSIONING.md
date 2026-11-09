> **English:** Developer note for `SCHEMA_VERSIONING`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Versionado de Esquemas DDL

Flujo de aplicación de scripts SQL:

1. Pruebas de migración en contenedor local efímero.
2. Verificación de rollback.
3. Despliegue secuencial ordenado por timestamp en el entorno de producción.
