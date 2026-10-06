# Diccionario Consolidado de Datos

| Tabla | Columna | Tipo | Nulo | Descripción |
|---|---|---|---|---|
| `pacientes` | `numero_identificacion` | VARCHAR(30) | NO | Documento oficial único |
| `pacientes` | `edad` | INT | NO | Edad cronológica |
| `signos_vitales` | `frecuencia_cardiaca` | NUMERIC(5,2) | NO | Latidos por minuto |
| `signos_vitales` | `saturacion_oxigeno` | NUMERIC(5,2) | NO | Porcentaje SpO2 |
| `evaluaciones_triage` | `score_criticidad` | NUMERIC(5,2) | NO | Severidad computada (0-100) |
