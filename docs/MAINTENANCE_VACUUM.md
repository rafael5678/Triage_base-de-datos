> **English:** Developer note for `MAINTENANCE_VACUUM`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Mantenimiento y Optimización del Motor PostgreSQL

Políticas de salud de base de datos:

- **Autovacuum**: Habilitado por defecto para reciclar espacio de tuplas muertas.
- **ANALYZE Periódico**: Actualización de estadísticas del optimizador de consultas tras cargas masivas de datos de simulación.
