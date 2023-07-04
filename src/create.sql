
CREATE TABLE "pessoa"(
	id SERIAL,
	cpf CHAR(14) NOT NULL,  /*example: 123.456.789-00*/
	nome VARCHAR(100) NOT NULL,
	endereco VARCHAR(255),
	senha VARCHAR(25) NOT NULL,
	login VARCHAR(30) NOT NULL,
	instituicao VARCHAR(50) NOT NULL,
	data_nascimento DATE,
	PRIMARY KEY (id),
	UNIQUE (cpf)    
);

CREATE TABLE "perfil"(
	id SERIAL,
	codigo VARCHAR(10) NOT NULL,
	tipo VARCHAR(20),
	PRIMARY KEY (id),
	UNIQUE (codigo)
);

CREATE TABLE "servico"(
	id SERIAL,
	codigo VARCHAR(10) NOT NULL,	
	descricao VARCHAR(1000) NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	id_perfil INT NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (codigo),
	CONSTRAINT fk_perfil 
		FOREIGN KEY (id) 
			REFERENCES perfil(id)  
);

CREATE TABLE "docente"(
	id SERIAL,
	cpf_docente CHAR(14) NOT NULL,
	especialidade VARCHAR(150) NOT NULL,
	função_tecnica VARCHAR(150),
	PRIMARY KEY (id),
	UNIQUE (cpf_docente)
);

CREATE TABLE "funcionario"(
	id SERIAL,
	cpf_funcionario CHAR(14) NOT NULL,
	especialidade VARCHAR(150) NOT NULL,
	função_tecnica VARCHAR(150),
	PRIMARY KEY (id),
	UNIQUE (cpf_funcionario)
);

CREATE TABLE "aluno"(
	id SERIAL,
	cpf_aluno CHAR(14) NOT NULL,
	curso VARCHAR(255) NOT NULL,
	nota_ingresso DECIMAL(4, 2) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (cpf_aluno)
);

CREATE TABLE "disciplina"(
	id SERIAL,
	codigo VARCHAR(10) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	ementa VARCHAR(1000),
	data_criacao DATE NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (codigo)
);

CREATE TABLE "rel_pessoa_perfil"(
	id_pessoa INT NOT NULL,
	id_perfil INT NOT NULL,
	PRIMARY KEY (id_pessoa, id_perfil),
	CONSTRAINT fk_pessoa
		FOREIGN KEY (id_pessoa)
			REFERENCES pessoa(id),
	CONSTRAINT fk_perfil
		FOREIGN KEY (id_perfil)
			REFERENCES perfil(id) 
);

CREATE TABLE "rel_docente_aluno_disciplina"(
	id_docente INT NOT NULL,
	id_aluno INT NOT NULL,
	id_disciplina INT NOT NULL,
	nota_obtida DECIMAL(4, 2) NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	PRIMARY KEY (id_docente, id_aluno, id_disciplina),
	CONSTRAINT fk_docente
		FOREIGN KEY (id_docente)
			REFERENCES docente(id),
	CONSTRAINT fk_aluno
		FOREIGN KEY (id_aluno)
			REFERENCES aluno(id),
	CONSTRAINT fk_disciplina
		FOREIGN KEY (id_disciplina)
			REFERENCES disciplina(id)
);

	