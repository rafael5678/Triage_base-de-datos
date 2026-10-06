# Disparadores (Triggers) y Funciones PL/pgSQL

Automatización a nivel de motor relacional:

- Función para actualización automática de columnas `fecha_actualizacion`:
```sql
CREATE OR REPLACE FUNCTION actualizar_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_actualizacion = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```
