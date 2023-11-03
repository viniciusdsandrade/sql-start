-- GETDATE(): Retorna a data e hora atuais do sistema.
-- SYSDATETIME(): Retorna a data e hora atuais do sistema com precis�o de fra��es de segundos.
-- DATEADD(): Adiciona um intervalo de tempo a uma data espec�fica. Por exemplo, pode ser usado para adicionar dias, meses ou anos a uma data.
-- DATEDIFF(): Calcula a diferen�a entre duas datas, retornando o n�mero de unidades de tempo (dias, meses, anos, etc.) entre elas.
-- DATEPART(): Extrai uma parte espec�fica de uma data, como o dia, m�s ou ano.
-- CONVERT(): Converte um valor de data de um tipo de dados para outro, permitindo a formata��o personalizada.
-- FORMAT(): Formata uma data e hora em uma string leg�vel por humanos de acordo com um padr�o especificado.
-- EOMONTH(): Retorna o �ltimo dia do m�s para uma data especificada.
-- SWITCHOFFSET(): Altera o fuso hor�rio de uma data e hora.
-- TODATETIMEOFFSET(): Converte uma data e hora para um valor com informa��es de fuso hor�rio.
-- DATEFROMPARTS(): Cria uma data a partir de componentes individuais, como ano, m�s e dia.
-- TIMEFROMPARTS(): Cria um valor de hora a partir de componentes de hora, minuto, segundo e fra��es de segundo.

SELECT GETDATE() AS 'Data e Hora atual';
SELECT DATEADD(DAY, 30, GETDATE()) AS 'Data e Hora atual + 30 dias';
SELECT DATEADD(MONTH, 12, GETDATE()) AS 'Data e Hora atual + 12 meses';
SELECT DATEADD(YEAR, 22, GETDATE()) AS 'Data e Hora atual + 22 anos';
SELECT DATEDIFF(YEAR, '2001-12-06', GETDATE()) AS 'Minha idade';


--  DESAFIO : Criar uma fun��o que receba uma data e retorne para o usu�rio quantos:
-- anos, meses e dias ele possui
DROP FUNCTION CalculaIdadeAproximada;
DECLARE @DataNascimento DATE = '2001-12-06';
SELECT dbo.CalculaIdadeAproximada(@DataNascimento) AS 'Minha Idade';


SELECT NOME + ' nasceu em ' +
       DATENAME(WEEKDAY, DATA_DE_NASCIMENTO) + ',' +
       DATENAME(DAY, DATA_DE_NASCIMENTO) + ' de ' +
       DATENAME(MONTH, DATA_DE_NASCIMENTO) + ' de ' +
       DATENAME(YEAR, DATA_DE_NASCIMENTO) AS DATA_EXTENSO
FROM TABELA_DE_CLIENTES;




