-- TriageIA · historial de reevaluaciones, tiempos reales, avisos por WhatsApp, embarazo y uso de Gemini.
-- Idempotente: se puede ejecutar más de una vez.

-- Ficha del paciente
ALTER TABLE pacientes ADD COLUMN IF NOT EXISTS telefono VARCHAR(20);
ALTER TABLE pacientes ADD COLUMN IF NOT EXISTS embarazo BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE pacientes ADD COLUMN IF NOT EXISTS semanas_gestacion INTEGER;

COMMENT ON COLUMN pacientes.telefono IS 'Celular solo con dígitos e indicativo (57...). Se usa para avisar por WhatsApp.';
COMMENT ON COLUMN pacientes.embarazo IS 'Embarazo actual. Activa reglas obstétricas en el triaje.';
COMMENT ON COLUMN pacientes.semanas_gestacion IS 'Semanas de embarazo, si se conocen.';

-- Evaluaciones: cada medición es una fila; solo la última de cada paciente es vigente.
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS vigente BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS evaluado_por VARCHAR(120);
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS llegada_en TIMESTAMPTZ;
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS atencion_inicio TIMESTAMPTZ;
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS presente BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS notificado_en TIMESTAMPTZ;
ALTER TABLE evaluaciones_triage ADD COLUMN IF NOT EXISTS canal_aviso VARCHAR(20);

UPDATE evaluaciones_triage SET llegada_en = evaluado_en WHERE llegada_en IS NULL;

-- Solo la evaluación más reciente de cada paciente queda vigente.
UPDATE evaluaciones_triage e SET vigente = FALSE
WHERE e.vigente
  AND EXISTS (SELECT 1 FROM evaluaciones_triage n
              WHERE n.paciente_id = e.paciente_id AND n.evaluado_en > e.evaluado_en);

COMMENT ON COLUMN evaluaciones_triage.vigente IS 'TRUE solo en la última evaluación del paciente; las anteriores son historial.';
COMMENT ON COLUMN evaluaciones_triage.evaluado_por IS 'Nombre de quien tomó los signos.';
COMMENT ON COLUMN evaluaciones_triage.llegada_en IS 'Inicio de la visita; la espera se mide desde aquí aunque lo reevalúen.';
COMMENT ON COLUMN evaluaciones_triage.atencion_inicio IS 'Momento en que pasó a atención; mide el tiempo real hasta ser atendido.';
COMMENT ON COLUMN evaluaciones_triage.presente IS 'FALSE si se registró pero todavía no está en la sala.';
COMMENT ON COLUMN evaluaciones_triage.notificado_en IS 'Cuándo se le avisó que su turno se acercaba.';
COMMENT ON COLUMN evaluaciones_triage.canal_aviso IS 'WHATSAPP (automático) o MANUAL (botón del personal).';

CREATE INDEX IF NOT EXISTS idx_eval_vigente_estado ON evaluaciones_triage (vigente, estado, score_riesgo DESC);
CREATE INDEX IF NOT EXISTS idx_eval_paciente_vigente ON evaluaciones_triage (paciente_id, vigente);

-- Llamadas diarias a Gemini (tope compartido entre réplicas y reinicios).
CREATE TABLE IF NOT EXISTS uso_gemini (
    dia      DATE PRIMARY KEY,
    llamadas INTEGER NOT NULL DEFAULT 0
);
COMMENT ON TABLE uso_gemini IS 'Llamadas reales a Gemini por día (zona America/Bogota).';
