# Versionado de Esquemas DDL

Flujo de aplicación de scripts SQL:

1. Pruebas de migración en contenedor local efímero.
2. Verificación de rollback.
3. Despliegue secuencial ordenado por timestamp en el entorno de producción.
