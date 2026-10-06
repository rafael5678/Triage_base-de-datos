# Consultas de Diagnóstico del DBA

Monitoreo de consultas lentas:

```sql
SELECT query, calls, total_exec_time, mean_exec_time
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 10;
```
