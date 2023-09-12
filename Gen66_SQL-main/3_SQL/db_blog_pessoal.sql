DROP DATABASE IF EXISTS db_blog_pessoal;
CREATE SCHEMA IF NOT EXISTS db_blog_pessoal;
USE db_blog_pessoal;

CREATE TABLE IF NOT EXISTS tb_temas(
	id BIGINT AUTO_INCREMENT,
	descricao VARCHAR(255) NOT NULL,
	
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tb_usuarios(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    foto VARCHAR(255),
    
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tb_postagens(
	id BIGINT AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    texto VARCHAR(1000) NOT NULL,
    dataa DATE,
    tema_id BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL,
    
    PRIMARY KEY(id),
    
    FOREIGN KEY(tema_id) REFERENCES tb_temas (id),
	FOREIGN KEY(usuario_id) REFERENCES tb_usuarios (id)
);




