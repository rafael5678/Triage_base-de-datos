# Roles y Permisos de Seguridad SQL

Se recomienda segregar privilegios en producción:

- `app_user`: Permisos `SELECT, INSERT, UPDATE` en tablas operativas. Sin privilegios DDL.
- `readonly_audit`: Permisos exclusivos de `SELECT` para auditorías médicas e informes de calidad.
- `admin_db`: Acceso completo DDL reservado para administradores y migraciones.
