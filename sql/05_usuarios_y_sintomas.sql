-- TriageIA · Tabla de Usuarios y Alineación de Catálogo de Síntomas
-- Idempotente: se puede ejecutar más de una vez sin alterar datos existentes.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 1. Tabla de Usuarios y Personal Hospitalario (Dueño: ms-pacientes-auth)
CREATE TABLE IF NOT EXISTS app_users (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username      VARCHAR(80) NOT NULL UNIQUE,
    password_hash VARCHAR(120) NOT NULL,
    display_name  VARCHAR(160) NOT NULL,
    role          VARCHAR(20) NOT NULL,
    active        BOOLEAN NOT NULL DEFAULT TRUE,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_users_username ON app_users (username);

-- 2. Tabla de Síntomas / Lesiones Clínicas (Dueño: ms-ia-recomendacion)
CREATE TABLE IF NOT EXISTS symptoms (
    id       VARCHAR(60) PRIMARY KEY,
    label    VARCHAR(200) NOT NULL,
    hint     VARCHAR(400),
    severity INTEGER NOT NULL,
    active   BOOLEAN NOT NULL DEFAULT TRUE
);

-- Inserción inicial de catálogo de síntomas si la tabla está vacía
INSERT INTO symptoms (id, label, hint, severity, active) VALUES
('paro', 'Se desmayó o no responde', 'No habla, no se mueve o no respira bien.', 99, true),
('avc', 'Cara, brazo o habla de pronto rara', 'Boca torcida o un lado débil.', 94, true),
('trauma', 'Golpe o accidente fuerte', 'Caída, choque o herida grave.', 90, true),
('sca', 'Dolor fuerte en el pecho', 'Presión en el pecho, a veces al brazo.', 88, true),
('anafilaxia', 'Alergia grave', 'Hinchazón de cara o dificultad para respirar.', 86, true),
('hemorragia', 'Sangrado que no para', 'Sangre que sigue saliendo.', 84, true),
('disnea', 'Le cuesta mucho respirar', 'Ahogo o no puede terminar una frase.', 82, true),
('sepsis', 'Infección que lo ve muy mal', 'Fiebre con palidez o confusión.', 80, true),
('convulsion', 'Convulsión', 'Temblor de todo el cuerpo hace poco.', 70, true),
('abdomen', 'Dolor fuerte de panza', 'Dolor de abdomen que no es leve.', 52, true),
('quemadura', 'Quemadura', 'Fuego, líquido caliente o químico.', 48, true),
('fractura', 'Hueso lastimado', 'Dolor al mover o no puede apoyar.', 38, true),
('cefalea', 'Cefalea', 'Sin otros signos graves.', 26, true),
('fiebre', 'Fiebre, pero se ve estable', 'Calentura sin ahogo.', 24, true),
('gi', 'Síntomas gastrointestinales leves', 'Síntomas digestivos leves.', 18, true),
('cura', 'Herida menor o control de cura', 'Herida menor o vendaje.', 8, true)
ON CONFLICT (id) DO NOTHING;

