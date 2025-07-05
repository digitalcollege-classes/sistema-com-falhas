-- Listar os bancos de dados --
SHOW DATABASES;

-- Criar um novo banco de dados --
CREATE DATABASE db_contatinhos;

-- Selecionar o banco de dados --
USE db_contatinhos;

-- Criar uma tabela banco de dados --
CREATE TABLE tb_contatos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NULL,
    telefone VARCHAR(20) NOT NULL 
);

CREATE TABLE IF NOT EXISTS tb_usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    criado_em DATETIME NOT NULL, 
    atualizado_em DATETIME NOT NULL, 
    ultimo_login DATETIME NOT NULL 
);



-- Listar as tabelas de um banco --
SHOW TABLES;

-- Ver os detalhes de uma tabela --
DESC tb_contatos;

------------------------------------

INSERT INTO tb_contatos
    (nome, email, telefone)
VALUES
    ('Mariazinha', 'maria@email.com', '85 1234-1234');


-- Listar todos --
SELECT * FROM tb_contatos;