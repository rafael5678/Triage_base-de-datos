> **English:** Developer note for `TUNING_CONFIG`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Parámetros Recomendados de Rendimiento (postgresql.conf)

Ajustes para servidores dedicados con 2 GB RAM:

- `shared_buffers = 512MB`
- `work_mem = 16MB`
- `maintenance_work_mem = 128MB`
- `effective_cache_size = 1536MB`
- `wal_buffers = 16MB`
