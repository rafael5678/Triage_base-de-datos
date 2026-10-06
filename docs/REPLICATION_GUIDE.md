# Arquitectura de Replicación para Urgencias

Para hospitales con servicio de urgencias 24/7:

- **Nodo Primario (Read/Write)**: Recibe las admisiones y actualizaciones de signos vitales.
- **Réplica de Lectura (Read-Only)**: Atiende las pantallas públicas de la sala de espera y reportes analíticos.
- Garantiza que la sala de espera siga funcionando sin degradar la atención médica.
