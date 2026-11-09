> **English:** Developer note for `QUERY_COOKBOOK`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Recetario de Consultas SQL Útiles (Cookbook)

### 1. Pacientes en espera ordenados por urgencia
```sql
SELECT p.nombre, p.apellido, e.nivel_triage, e.score_criticidad,
       ROUND(EXTRACT(EPOCH FROM (NOW() - e.fecha_evaluacion))/60) AS minutos_espera
FROM evaluaciones_triage e
JOIN pacientes p ON p.id = e.paciente_id
WHERE e.estado_atencion = 'EN_ESPERA'
ORDER BY e.score_criticidad DESC, e.fecha_evaluacion ASC;
```
