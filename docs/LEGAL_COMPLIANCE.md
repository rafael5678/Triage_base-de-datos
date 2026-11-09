> **English:** Developer note for `LEGAL_COMPLIANCE`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Cumplimiento Normativo y Retención Clínica

Conforme a la regulación de historias clínicas:
- Los registros médicos y de triaje deben conservarse por un período mínimo de 15 años.
- Las tablas del sistema prohíben el borrado físico (`HARD DELETE`) de evaluaciones realizadas, promoviendo auditorías transparentes.
