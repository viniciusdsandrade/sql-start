CREATE FUNCTION instrutores_internos(id_instrutor INTEGER) RETURNS refcursor AS $$
    DECLARE
        cursor_salario refcursor;
    BEGIN
        OPEN cursor_salario FOR SELECT instrutor.salario 
                                    FROM instrutor 
                                 WHERE id <> id_instrutor 
                                    AND salario > 0;                         
        RETURN cursor_salario;
    END;
$$ LANGUAGE plpgsql;