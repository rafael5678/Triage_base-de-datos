-- TriageIA · esquema PostgreSQL
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Tipos de dominio (referencia). Las columnas usan VARCHAR para alinear con JPA @Enumerated(STRING).

CREATE TYPE nivel_triage AS ENUM (
    'TRIAGE_I_ROJO',
    'TRIAGE_II_NARANJA',
    'TRIAGE_III_AMARILLO',
    'TRIAGE_IV_VERDE',
    'TRIAGE_V_AZUL'
);

CREATE TYPE estado_atencion AS ENUM (
    'EN_ESPERA',
    'EN_ATENCION',
    'ATENDIDO',
    'CANCELADO'
);

CREATE TABLE pacientes (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre          VARCHAR(160) NOT NULL,
    documento       VARCHAR(40)  NOT NULL UNIQUE,
    edad            INTEGER      NOT NULL CHECK (edad BETWEEN 0 AND 120),
    sexo            VARCHAR(20),
    lesion_id       VARCHAR(40),
    motivo          VARCHAR(500),
    antecedentes    VARCHAR(400),
    creado_en       TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE signos_vitales (
    id                       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    paciente_id              UUID NOT NULL REFERENCES pacientes(id) ON DELETE CASCADE,
    frecuencia_cardiaca      INTEGER NOT NULL CHECK (frecuencia_cardiaca BETWEEN 20 AND 250),
    spo2                     INTEGER NOT NULL CHECK (spo2 BETWEEN 0 AND 100),
    pas                      INTEGER NOT NULL CHECK (pas BETWEEN 50 AND 260),
    pad                      INTEGER NOT NULL CHECK (pad BETWEEN 20 AND 160),
    temperatura              NUMERIC(4,1) NOT NULL CHECK (temperatura BETWEEN 30 AND 43),
    frecuencia_respiratoria  INTEGER NOT NULL CHECK (frecuencia_respiratoria BETWEEN 4 AND 60),
    registrado_en            TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE evaluaciones_triage (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    paciente_id     UUID NOT NULL REFERENCES pacientes(id) ON DELETE CASCADE,
    signos_id       UUID REFERENCES signos_vitales(id),
    score_riesgo    NUMERIC(5,1) NOT NULL CHECK (score_riesgo BETWEEN 0 AND 100),
    nivel_triage    VARCHAR(32) NOT NULL,
    estado          VARCHAR(24) NOT NULL DEFAULT 'EN_ESPERA',
    posicion_cola   INTEGER,
    news2           INTEGER,
    evaluado_en     TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_signos_paciente_fecha ON signos_vitales (paciente_id, registrado_en DESC);
CREATE INDEX idx_eval_estado_score ON evaluaciones_triage (estado, score_riesgo DESC);
CREATE INDEX idx_eval_paciente ON evaluaciones_triage (paciente_id, evaluado_en DESC);
