-- TriageIA · triaje ampliado: datos clínicos opcionales, destino en urgencias y explicación de la IA sin límite de tamaño.
-- Idempotente: se puede ejecutar más de una vez.

-- Hibernate había creado copias en inglés de dos columnas obligatorias (temperature, status).
-- Los servicios escriben en temperatura y estado, como dice 01_schema.sql.
ALTER TABLE signos_vitales DROP COLUMN IF EXISTS temperature;
ALTER TABLE evaluaciones_triage DROP COLUMN IF EXISTS status;

ALTER TABLE signos_vitales ADD COLUMN IF NOT EXISTS glucosa INTEGER;
ALTER TABLE signos_vitales ADD COLUMN IF NOT EXISTS dolor INTEGER;
ALTER TABLE signos_vitales ADD COLUMN IF NOT EXISTS conciencia VARCHAR(1);

ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS fuente_score VARCHAR(24);
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS explicacion_ia TEXT;
ALTER TABLE evaluaciones_triage ALTER COLUMN explicacion_ia TYPE TEXT;
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS area_destino VARCHAR(40);
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS codigo_destino VARCHAR(60);
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS motivo_destino VARCHAR(300);
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS espera_max_min INTEGER;
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS campos_estimados VARCHAR(200);

COMMENT ON COLUMN signos_vitales.glucosa IS 'Glucometría en mg/dL. Opcional.';
COMMENT ON COLUMN signos_vitales.dolor IS 'Escala de dolor de 0 a 10. Opcional.';
COMMENT ON COLUMN signos_vitales.conciencia IS 'AVPU: A alerta, C confusión nueva, V responde a la voz, P al dolor, U no responde.';
COMMENT ON COLUMN evaluaciones_triage.fuente_score IS 'PROTOCOL si solo calculó el protocolo, HYBRID si además opinó Gemini.';
COMMENT ON COLUMN evaluaciones_triage.explicacion_ia IS 'JSON con razones, recomendaciones, hallazgos de la foto y área sugerida por la IA.';
COMMENT ON COLUMN evaluaciones_triage.area_destino IS 'Área de urgencias a la que se envía al paciente.';
COMMENT ON COLUMN evaluaciones_triage.codigo_destino IS 'Código institucional activado (ACV, infarto, trauma, sepsis...) o Pediatría.';
COMMENT ON COLUMN evaluaciones_triage.espera_max_min IS 'Tiempo máximo de espera para el área, en minutos.';
COMMENT ON COLUMN evaluaciones_triage.campos_estimados IS 'Signos vitales que estimó la IA en lugar de medirse, separados por coma.';
