SELECT AGE(NOW(), timestamp '2001-12-06'); -- Calcula a diferença de idade entre a data atual e '2001-12-06'
SELECT AGE(timestamp '2001-12-06'); -- Calcula a diferença de idade entre a data atual e '2001-12-06'
SELECT CLOCK_TIMESTAMP(); -- Retorna a data e hora atuais
SELECT CURRENT_DATE; -- Retorna a data atual
SELECT CURRENT_TIME; -- Retorna a hora atual
SELECT CURRENT_TIMESTAMP; -- Retorna a data e hora atuais
SELECT DATE_PART('day', timestamp '2001-02-16 20:38:40'); -- Extrai a parte 'dia' da data e hora fornecidas
SELECT DATE_TRUNC('hour', timestamp '2001-02-16 20:38:40'); -- Trunca a data e hora fornecidas para a hora
SELECT DATE_TRUNC('hour', timestamp '2001-02-16 20:38:40'::timestamp); -- Trunca a data e hora fornecidas para a hora
SELECT EXTRACT(EPOCH FROM timestamp '2001-02-16 20:38:40'); -- Extrai a época (segundos desde '1970-01-01 00:00:00+00') da data e hora fornecidas
SELECT EXTRACT(EPOCH FROM timestamp '2001-02-16 20:38:40'::timestamp); -- Extrai a época (segundos desde '1970-01-01 00:00:00+00') da data e hora fornecidas
SELECT ISFINITE(timestamp '2001-02-16 20:38:40'); -- Verifica se a data e hora fornecidas são finitas
SELECT ISFINITE(timestamp 'infinity'); -- Verifica se a data e hora fornecidas são finitas
SELECT ISFINITE(timestamp '-infinity'); -- Verifica se a data e hora fornecidas são finitas
SELECT JUSTIFY_DAYS(interval '35 days'); -- Justifica um intervalo que pode ser maior que o normal para 'dias'
SELECT JUSTIFY_HOURS(interval '25 hours'); -- Justifica um intervalo que pode ser maior que o normal para 'horas'
SELECT JUSTIFY_INTERVAL(interval '25 hours'); -- Justifica um intervalo que pode ser maior que o normal
SELECT JUSTIFY_INTERVAL(interval '25 hours'::interval); -- Justifica um intervalo que pode ser maior que o normal
SELECT LOCALTIME; -- Retorna a hora local
SELECT LOCALTIMESTAMP; -- Retorna a data e hora locais
SELECT NOW(); -- Retorna a data e hora atuais
SELECT STATEMENT_TIMESTAMP(); -- Retorna a data e hora atuais
SELECT TIMEOFDAY(); -- Retorna a data e hora atuais como texto
SELECT TIMESTAMP '2001-02-16 20:38:40'; -- Retorna a data e hora fornecidas
SELECT TIMESTAMP '2001-02-16 20:38:40'::timestamp; -- Retorna a data e hora fornecidas
SELECT TIMESTAMP '2001-02-16 20:38:40'::timestamp(0); -- Retorna a data e hora fornecidas com precisão de 0 dígitos decimais
SELECT TIMESTAMP '2001-02-16 20:38:40'::timestamp(0) WITH TIME ZONE; -- Retorna a data e hora fornecidas com fuso horário e precisão de 0 dígitos decimais
SELECT TIMESTAMP '2001-02-16 20:38:40'::timestamp WITH TIME ZONE; -- Retorna a data e hora fornecidas com fuso horário
SELECT MAKE_TIMESTAMP(2001, 2, 16, 20, 38, 40); -- Cria uma data e hora a partir dos argumentos fornecidos
SELECT STATEMENT_TIMESTAMP(); -- Retorna a data e hora atuais
