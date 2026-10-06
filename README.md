# TriageIA — PostgreSQL (Hospital_triage)

Contenedor Docker **aparte** de tus otros Postgres (`mi-postgres` en 5432).

```bash
docker compose up -d
```

| DBeaver | Valor |
|---------|--------|
| Host | `localhost` (local) o host External de Render |
| Puerto | `5434` local · `5432` en Render |
| Database | `hospital_triaje` |
| User | `triage` (local) |
| Password | `triage` (local) |

En Render usa el Postgres **Hospital_triage** (nuevo, no mezclar con otros proyectos). Copia **External Database URL** en DBeaver.

Scripts: `sql/01_schema.sql`, `sql/02_catalogo.sql`. En Docker se ejecutan al crear el volumen por primera vez. En Render, Hibernate (`ddl-auto: update`) crea las tablas al arrancar el API.
