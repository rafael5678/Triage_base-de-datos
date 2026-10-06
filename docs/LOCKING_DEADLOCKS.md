# Prevención de Bloqueos y Deadlocks

Buenas prácticas implementadas:
1. Actualización de registros de pacientes siempre en orden ascendente por `id`.
2. Tiempos límite de bloqueo (`lock_timeout = '5s'`) para evitar contención prolongada.
3. Consultas de lectura aisladas que no toman cerrojos sobre las tablas operativas.
