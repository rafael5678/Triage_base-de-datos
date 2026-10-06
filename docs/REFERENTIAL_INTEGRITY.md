# Integridad Referencial y Reglas de Borrado

- `signos_vitales.paciente_id`: `ON DELETE CASCADE` para eliminar signos si se borra el paciente.
- `evaluaciones_triage.paciente_id`: `ON DELETE CASCADE`.
- `evaluaciones_triage.nivel_triage`: `ON DELETE RESTRICT` impidiendo eliminar un nivel del catálogo si existen evaluaciones que lo utilicen.
