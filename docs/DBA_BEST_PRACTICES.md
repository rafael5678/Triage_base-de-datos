> **English:** Developer note for `DBA_BEST_PRACTICES`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Manual de Buenas Prácticas DBA - Base de Datos Triage

- Nunca ejecutar scripts DDL destructivos en horario de máxima afluencia.
- Monitorear el espacio en disco y el crecimiento del log transaccional (WAL).
- Realizar pruebas de restauración semestrales a partir de los backups automáticos.
