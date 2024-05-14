SELECT TO_CHAR(CURRENT_TIMESTAMP, 'HH12:MI:SS'); -- Converte a data e hora atual para uma string no formato 'HH12:MI:SS'
SELECT TO_CHAR(INTERVAL '15h 2m 12s', 'HH24:MI:SS'); -- Converte o intervalo '15h 2m 12s' para uma string no formato 'HH24:MI:SS'
SELECT TO_CHAR(125, '999'); -- Converte o inteiro 125 para uma string no formato '999'
SELECT TO_CHAR(125.8::REAL, '999D9'); -- Converte o número real 125.8 para uma string no formato '999D9'
SELECT TO_CHAR(-125.8, '999D99S'); -- Converte o número -125.8 para uma string no formato '999D99S'
SELECT TO_DATE('05 Dec 2000', 'DD Mon YYYY'); -- Converte a string '05 Dec 2000' para uma data no formato 'DD Mon YYYY'
SELECT TO_TIMESTAMP('05 Dec 2000', 'DD Mon YYYY'); -- Converte a string '05 Dec 2000' para uma data e hora no formato 'DD Mon YYYY'
SELECT TO_TIMESTAMP(200120400); -- Converte o número UNIX 200120400 para uma data e hora
SELECT TO_NUMBER('12,454.8-', '99G999D9S'); -- Converte a string '12,454.8-' para um número no formato '99G999D9S'
