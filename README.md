# TriageIA — Base de datos (PostgreSQL)

Scripts DDL del clasificador predictivo en urgencias.

1. `sql/01_schema.sql` — pacientes, signos vitales, evaluaciones y cola.
2. `sql/02_catalogo.sql` — gravedad de lesión/enfermedad (dataset de referencia).

Aún no se exige conexión activa desde el backend (`ddl-auto: none`). Cuando se conecte:

```
createdb triage
psql -d triage -f sql/01_schema.sql
psql -d triage -f sql/02_catalogo.sql
```

Frontend: https://github.com/rafael5678/Triage_frotend-  
Backend: https://github.com/rafael5678/Triage_backend
