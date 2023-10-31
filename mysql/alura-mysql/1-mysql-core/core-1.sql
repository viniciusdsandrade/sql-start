/*
    1 - Deletar o banco de dados caso ele exista
    2 - Criar o banco de dados caso ele não exista
    3 - Usar o banco de dados criado
 */

DROP DATABASE IF EXISTS db_core_1;
CREATE DATABASE IF NOT EXISTS db_core_1;
USE db_core_1;