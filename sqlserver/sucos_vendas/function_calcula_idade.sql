CREATE FUNCTION CalculaIdadeAproximada(@DataNascimento DATE)
    RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @DataAtual DATE = GETDATE();
    DECLARE @IdadeAnos INT, @IdadeMeses INT, @IdadeDias INT;

    SET @IdadeAnos = DATEDIFF(YEAR, @DataNascimento, @DataAtual);
    SET @DataNascimento = DATEADD(YEAR, @IdadeAnos, @DataNascimento);

    SET @IdadeMeses = DATEDIFF(MONTH, @DataNascimento, @DataAtual);
    SET @DataNascimento = DATEADD(MONTH, @IdadeMeses, @DataNascimento);

    SET @IdadeDias = DATEDIFF(DAY, @DataNascimento, @DataAtual);

    -- Ajusta valores negativos de meses
    IF @IdadeMeses < 0
        BEGIN
            SET @IdadeMeses = 12 + @IdadeMeses;
            SET @IdadeAnos = @IdadeAnos - 1;
        END

    -- Ajusta valores negativos de dias
    IF @IdadeDias < 0
        BEGIN
            SET @IdadeMeses = @IdadeMeses - 1;
            SET @IdadeDias = 30 - DATEDIFF(DAY, @DataAtual, @DataNascimento);
        END

    -- Exibe a idade com precisão de anos, meses e dias
    DECLARE @Idade NVARCHAR(100);
    SET @Idade = CAST(@IdadeAnos AS NVARCHAR(10)) + ' anos, ' + CAST(@IdadeMeses AS NVARCHAR(10)) + ' meses, ' +
                 CAST(@IdadeDias AS NVARCHAR(10)) + ' dias';

    RETURN @Idade;
END
