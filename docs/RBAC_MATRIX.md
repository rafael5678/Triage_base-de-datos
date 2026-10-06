# Matriz de Control de Acceso Basado en Roles (RBAC)

| Rol | Tabla Pacientes | Tabla Signos | Tabla Evaluaciones | Catálogo |
|---|---|---|---|---|
| `enfermero_triage` | SELECT, INSERT | SELECT, INSERT | SELECT, INSERT | SELECT |
| `medico_urgencias` | SELECT | SELECT | SELECT, UPDATE | SELECT |
| `auditor_calidad` | SELECT | SELECT | SELECT | SELECT |
| `admin_sistema` | ALL | ALL | ALL | ALL |
