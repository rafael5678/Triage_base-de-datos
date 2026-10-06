# Gestión de Migraciones de Base de Datos

Los scripts de base de datos se ordenan cronológicamente:
- `01_schema.sql`: Creación de tablas, secuencias y llaves primarias/foráneas.
- `02_catalogo.sql`: Inserción de datos semilla inmutables (niveles Manchester).
- Próximas migraciones deberán nombrarse `03_*.sql` preservando compatibilidad regresiva.
