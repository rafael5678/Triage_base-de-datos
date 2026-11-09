> **English:** Developer note for `CAPACITY_PLANNING`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Planificación de Capacidad de Almacenamiento

Estimación basada en 500 admisiones diarias:
- Registro de paciente: ~300 bytes.
- Registro de signos vitales: ~200 bytes.
- Registro de evaluación: ~150 bytes.
- Crecimiento mensual estimado: ~10 MB (fácilmente soportado por el tier gratuito de Supabase o Render por más de 3 años).
