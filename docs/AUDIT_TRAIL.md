> **English:** Developer note for `AUDIT_TRAIL`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Trazabilidad Histórica de Evaluaciones

El esquema no sobreescribe las evaluaciones previas al reevaluar un paciente; en su lugar, actualiza el estado de la anterior a `REEVALUADO` y crea un nuevo registro con el timestamp actual. Esto proporciona trazabilidad médico-legal completa ante requerimientos de auditoría clínica.
