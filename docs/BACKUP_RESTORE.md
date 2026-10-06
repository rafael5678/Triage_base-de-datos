# Respaldo y Restauración de Datos

### Generar respaldo completo:
```bash
pg_dump -h localhost -U postgres -d hospital_triage -F c -b -v -f backup_triage.dump
```

### Restaurar respaldo:
```bash
pg_restore -h localhost -U postgres -d hospital_triage -v backup_triage.dump
```
