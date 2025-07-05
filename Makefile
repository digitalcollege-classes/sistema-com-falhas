migrar-database:
	@echo "\n" 
	@echo ">>> Criando banco de dados...\n"

	@docker compose exec mysql mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS db_contatinhos;" > /dev/null 2>&1
	
	@echo "\n>>> Sucesso, banco criado!...\n"

	@echo "\n>>> Criando tabela de USUARIOS\n"
	@docker compose exec mysql mysql -u root -proot -e "\
		USE db_contatinhos; \
		CREATE TABLE IF NOT EXISTS tb_usuarios ( \
			id INT PRIMARY KEY AUTO_INCREMENT, \
			nome VARCHAR(50) NOT NULL, \
			email VARCHAR(100) UNIQUE NOT NULL, \
			senha VARCHAR(255) NOT NULL, \
			criado_em DATETIME NOT NULL, \
			atualizado_em DATETIME NOT NULL, \
			ultimo_login DATETIME NOT NULL \
		); " > /dev/null 2>&1
	@echo "\n>>> Sucesso, tabela de usuarios criada!...\n"

	@echo "\n>>> Criando tabela de CONTATOS\n"
	@docker compose exec mysql mysql -u root -proot -e "USE db_contatinhos; CREATE TABLE IF NOT EXISTS	 tb_contatos ( id INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(50) NOT NULL, email VARCHAR(100) NULL, telefone VARCHAR(20) NOT NULL, usuario_id INT, FOREIGN KEY (usuario_id) REFERENCES tb_usuarios(id)   );" > /dev/null 2>&1
	@echo "\n>>> Sucesso, tabela de contatos criado!...\n"


load-fixtures:
	@echo "\n>>> Inserindo contatinhos...\n"
	@docker compose exec mysql mysql -u root -proot -e "\
		USE db_contatinhos; \
		INSERT INTO tb_contatos (nome, email, telefone) VALUES \
		('João da Silva', 'joao@gmail.com', '11999990000'), \
		('Maria Oliveira', 'maria@gmail.com', '11888887777'), \
		('Pedro Santos', 'pedro@hotmail.com', '11777776666'), \
		('Ana Costa', 'ana@yahoo.com', '11666665555'), \
		('Lucas Rocha', 'lucas@outlook.com', '11555554444'), \
		('Fernanda Lima', 'fernanda@gmail.com', '11444443333'), \
		('Carlos Souza', 'carlos@live.com', '11333332222'), \
		('Juliana Alves', 'juliana@gmail.com', '11222221111'), \
		('Rafael Mendes', 'rafael@gmail.com', '11111110000'), \
		('Bianca Pereira', 'bianca@gmail.com', '11000009999');" > /dev/null 2>&1

	@echo "\n>>> Sucesso, contatinhos adicionados! 😎\n"