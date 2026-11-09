> **English:** Developer note for `DATA_ENCRYPTION`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Cifrado y Confidencialidad de Datos Médicos

- **Cifrado en Tránsito**: Conexiones remotas restringidas a TLS 1.3 con `sslmode=require`.
- **Cifrado en Reposo**: Almacenamiento cifrado con AES-256 en los volúmenes de Supabase / AWS EBS.
- Cumplimiento de estándares de protección de datos personales de salud.
