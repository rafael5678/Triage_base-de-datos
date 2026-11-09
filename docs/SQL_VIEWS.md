> **English:** Developer note for `SQL_VIEWS`. Physical PostgreSQL names stay in Spanish so JPA mappings keep working. Apply comments from `sql/comments/` without renaming columns.

# Vistas Analíticas para Cuadros de Mando

Vista consolidada de pacientes activos en urgencias:

```sql
CREATE OR REPLACE VIEW vista_pacientes_activos AS
SELECT p.id, p.numero_identificacion, p.nombre, p.apellido, p.edad,
       e.nivel_triage, e.score_criticidad, e.estado_atencion, e.fecha_evaluacion
FROM pacientes p
JOIN evaluaciones_triage e ON e.paciente_id = p.id
WHERE e.estado_atencion = 'EN_ESPERA';
```
