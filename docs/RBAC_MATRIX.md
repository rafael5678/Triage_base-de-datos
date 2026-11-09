> **English:** Developer note for `RBAC_MATRIX`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Matriz de Control de Acceso Basado en Roles (RBAC)

| Rol | Tabla Pacientes | Tabla Signos | Tabla Evaluaciones | Catálogo |
|---|---|---|---|---|
| `enfermero_triage` | SELECT, INSERT | SELECT, INSERT | SELECT, INSERT | SELECT |
| `medico_urgencias` | SELECT | SELECT | SELECT, UPDATE | SELECT |
| `auditor_calidad` | SELECT | SELECT | SELECT | SELECT |
| `admin_sistema` | ALL | ALL | ALL | ALL |
