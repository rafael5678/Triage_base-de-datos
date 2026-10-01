-- Catálogo de gravedad clínica usado por el modelo (referencia, no sustituye historia clínica).

CREATE TABLE catalogo_lesiones (
    id          VARCHAR(40) PRIMARY KEY,
    etiqueta    VARCHAR(160) NOT NULL,
    gravedad    INTEGER NOT NULL CHECK (gravedad BETWEEN 0 AND 100),
    esi_hint    INTEGER NOT NULL CHECK (esi_hint BETWEEN 1 AND 5)
);

INSERT INTO catalogo_lesiones (id, etiqueta, gravedad, esi_hint) VALUES
('paro', 'Paro cardiorrespiratorio / inconsciencia', 99, 1),
('avc', 'Déficit neurológico agudo (ACV)', 94, 1),
('sca', 'Dolor torácico / sospecha de SCA', 88, 2),
('trauma', 'Trauma de alta energía', 90, 1),
('disnea', 'Dificultad respiratoria severa', 82, 2),
('sepsis', 'Infección / sospecha de sepsis', 80, 2),
('anafilaxia', 'Reacción alérgica grave', 86, 1),
('hemorragia', 'Hemorragia activa', 84, 2),
('abdomen', 'Dolor abdominal agudo', 52, 3),
('convulsion', 'Convulsión reciente', 70, 2),
('fractura', 'Fractura / lesión ortopédica', 38, 4),
('quemadura', 'Quemadura', 48, 3),
('cefalea', 'Cefalea', 26, 4),
('fiebre', 'Fiebre sin compromiso hemodinámico', 24, 4),
('gi', 'Síntomas gastrointestinales leves', 18, 5),
('cura', 'Herida menor / control de cura', 8, 5);
