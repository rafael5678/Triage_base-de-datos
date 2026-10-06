# Estrategia de Índices y Rendimiento SQL

Para que la consulta de la cola dinámica responda en sub-milisegundos:

```sql
CREATE INDEX idx_evaluaciones_estado_score 
ON evaluaciones_triage (estado_atencion, score_criticidad DESC, fecha_evaluacion ASC);

CREATE INDEX idx_signos_paciente_fecha 
ON signos_vitales (paciente_id, fecha_registro DESC);
```
