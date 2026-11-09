> **English:** Developer note for `SUPABASE_SETUP`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Configuración de Base de Datos en Supabase

El esquema es 100% compatible con **Supabase** (PostgreSQL administrado):

1. Cree un proyecto nuevo en la consola de Supabase.
2. Ejecute los scripts `sql/01_schema.sql` y `sql/02_catalogo.sql` en el SQL Editor.
3. Para servicios en Render, utilice la cadena de conexión del pooler (puerto 6543 en modo `Session` o `Transaction`).
