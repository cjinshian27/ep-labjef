
CREATE TABLE "pessoa"(
	cpf CHAR(14) NOT NULL,  /*example: 123.456.789-00*/
	nome VARCHAR(100) NOT NULL,
	endereco VARCHAR(255),
	senha VARCHAR(20) NOT NULL,
	login VARCHAR(30) NOT NULL,
	instituicao VARCHAR(50) NOT NULL,
	data_nascimento DATE,
	PRIMARY KEY (cpf)    
);

CREATE TABLE "perfil"(
	codigo_perfil SERIAL,
	tipo_perfil VARCHAR(20),
	PRIMARY KEY (codigo_perfil)
);

CREATE TABLE "servico"(
	codigo_servico SERIAL,	
	descricao VARCHAR(1000) NOT NULL,
	tipo_servico VARCHAR(50) NOT NULL,
	codigo_perfil INT NOT NULL,
	PRIMARY KEY (codigo_servico),
	CONSTRAINT fk_perfil 
		FOREIGN KEY (codigo_perfil) 
			REFERENCES "perfil"(codigo_perfil)  
);

CREATE TABLE "docente"(
	cpf_docente CHAR(14) NOT NULL,
	especialidade VARCHAR(150) NOT NULL,
	função_tecnica VARCHAR(150),
	PRIMARY KEY (cpf_docente)
);

CREATE TABLE "funcionario"(
	cpf_funcionario CHAR(14) NOT NULL,
	especialidade VARCHAR(150) NOT NULL,
	função_tecnica VARCHAR(150),
	PRIMARY KEY (cpf_docente)
);

CREATE TABLE "aluno"(
	cpf_aluno CHAR(14) NOT NULL,
	curso VARCHAR(255) NOT NULL,
	nota_ingresso DECIMAL(4, 2) NOT NULL,
	PRIMARY KEY (cpf_aluno)
);

CREATE TABLE "disciplina"(
	codigo_disciplina VARCHAR(10) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	ementa VARCHAR(10000),
	data_criacao DATE NOT NULL,
	PRIMARY KEY (codigo_disciplina)
);

CREATE TABLE "rel_pessoa_perfil"(
	cpf_pessoa VARCHAR(14) NOT NULL,
	codigo_perfil INT NOT NULL,
	PRIMARY KEY (cpf_pessoa),
	PRIMARY KEY (codigo_perfil),
	CONSTRAINT fk_pessoa
		FOREIGN KEY cpf_pessoa
			REFERENCES pessoa(cpf),
	CONSTRAINT fk_perfil
		FOREIGN KEY codigo_perfil
			REFERENCES perfil(codigo_perfil) 
);

CREATE TABLE "rel_docente_aluno_disciplina"(
	cpf_docente VARCHAR(14) NOT NULL,
	cpf_aluno VARCHAR(14) NOT NULL,
	codigo_disciplina VARCHAR(10) NOT NULL,
	nota obtida DECIMAL(4, 2) NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	PRIMARY KEY cpf_docente,
	PRIMARY KEY cpf_aluno,
	PRIMARY KEY codigo_disciplina,
	CONSTRAINT fk_docente
		FOREIGN KEY cpf_docente
			REFERENCES docente(cpf_docente),
	CONSTRAINT fk_aluno
		FOREIGN KEY cpf_aluno
			REFERENCES aluno(cpf_aluno),
	CONSTRAINT fk_disciplina
		FOREIGN KEY disciplina
			REFERENCES disciplina(codigo_disciplina)
);

	