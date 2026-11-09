> **English:** Developer note for `DOCKER_POSTGRES`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Despliegue de Base de Datos con Docker Compose

Instrucciones para levantar la base de datos localmente:

```bash
docker-compose up -d
```

Configuración predeterminada:
- Imagen: `postgres:16-alpine`
- Puerto: `5432:5432`
- Nombre de Base de Datos: `hospital_triage`
- Scripts de inicio: Ejecutados automáticamente desde el volumen `/docker-entrypoint-initdb.d/`.
