# Particionamiento de Tablas Históricas

Para instituciones de gran volumen asistencial, se recomienda particionar `signos_vitales` y `evaluaciones_triage` por rangos mensuales:

```sql
-- Ejemplo de partición declarativa por fecha
CREATE TABLE evaluaciones_triage_2026_10 
PARTITION OF evaluaciones_triage
FOR VALUES FROM ('2026-10-01') TO ('2026-11-01');
```
