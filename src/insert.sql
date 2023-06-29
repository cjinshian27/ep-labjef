
INSERT INTO "pessoa"(cpf, nome, endereco, senha, login, instituicao, data_nascimento)
VALUES 
('357.231.938-21', 'Rua Maria Luísa do Val Penteado, 238', 'Fernando Santos', 'fsantos3482', 'FernandoSantos', 'USP', '1990-07-13'),
('392.454.139-24', 'Rua Carlos Augusto Cornelsen, 34','Mario Magalhães Oliveira', 'mmoliveira7230', 'MarioOliveira', 'USP', '1992-05-18'),
('239.872.033-01', 'Avenida São João, 360', 'Miriam Barroso', 'mbarroso2398', 'MiriamBarroso', 'USP', '2001-11-29'),
('439.293.130-67', 'Rua dos Carijós, 12', 'Sofia Lima Ferreira', 'sflima4930', 'SofiaLima', 'USP', '2002-02-02'),
('804.128.142-00', 'Rua Arlindo Nogueira, 1049', 'Elisio Alencar de Souza', 'easouza1034', 'ElisioAlencar', 'USP', '1970-10-19'),
('592.004.927-99', 'Travessa Antônio Ferreira, 193', 'Alberto Fernandes Lima', 'aflima3071', 'AlbertoLima', 'USP', '1968-01-30'),
('729.231.000-13', 'Rua Serra de Bragança, 013', 'Mateus Hashimoto', 'mhashimoto1383', 'MateusHashimoto', 'USP', '1980-09-12'),
('120.395.772-55', 'Rua Maria Luísa do Val Penteado, 101', 'André Gomes', 'agomes0130', 'AndréGomes', 'USP','2003-08-21'),	
('530.138.128-48', 'Rua Cristiano Olsen, 931', 'Mariane Dias', 'mdias9284', 'MarianeDias', 'USP', '2000-10-05');

INSERT INTO "perfil"(tipo_perfil)
VALUES 
('Academico'),
('Academico'),
('Visitante'),
('Academico'),
('Administrativo'),
('Academico'),
('Academico'),
('Academico'),
('Academico');

INSERT INTO "servico"(descricao, tipo_servico, codigo_perfil)
VALUES
('-', 'Visualização', 1),
('-', 'Inserção', 2),
('-', 'Remoção', 3),
('-', 'Alteração', 4),
('-', 'Remoção', 2),
('-', 'Inserção', 4),
('-', 'Remoção', 5),
('-', 'Alteração', 6),
('-', 'Visualização', 7),
('-', 'Remoção', 8),
('-', 'Alteração', 9);

INSERT INTO "docente"(cpf_docente, especialidade, funcao_tecnica)
VALUES 
('729.231.000-13', 'Cartografia', 'Docente'),
('592.004.927-99', 'Ciência de Dados', 'Docente'),
('804.128.142-00', 'Economia', 'Docente');

INSERT INTO "funcionario"(cpf_funcionario, especialidade, funcao_tecnica)
VALUES
('357.231.938-21', '-', 'Bibliotecário'),
('392.454.139-24', '-', 'Recepção de alunos');

INSERT INTO "aluno"(cpf_aluno, curso, nota_ingresso)
VALUES
('120.395.772-55', "Bacharelado em Ciência da Computação", 84.00),
('439.293.130-67', "Licenciatura em Geografia", 65.00),
('239.872.033-01', "Farmácia", 80.80);

INSERT INTO "disciplina"(codigo_disciplina, nome, ementa, data_criacao)
VALUES
('EAE0106', 'Introdução à Economia', '-', '1980-01-01'),
('MAC0110', 'Introdução à Computação', '-', '1975-01-01'),
('MAE0116', 'Noções de Estatística', '-', '1977-01-01'),
('FLG0141', 'Introdução à Cartografia', '-', '1980-01-01');

INSERT INTO "rel_pessoa_perfil"(cpf_pessoa, codigo_perfil)
VALUES
('357.231.938-21', 1),
('392.454.139-24', 5),
('239.872.033-01', 2),
('439.293.130-67', 4),
('804.128.142-00', 6),
('592.004.927-99', 7),
('729.231.000-13', 8),
('120.395.772-55', 9),
('530.138.128-48', 3);

INSERT INTO "rel_docente_aluno_disciplina"(cpf_docente, cpf_aluno, codigo_disciplina, nota_obtida, data_inicio, data_fim)
VALUES
('729.231.000-13', '439.293.130-67', 'EAE0106', 7.50, '2023-03-15', '2023-07-15'),
('729.231.000-13', '439.293.130-67', 'FLG0141', 8.50, '2023-03-15', '2023-07-15'),
('592.004.927-99', '120.395.772-55', 'MAC0110', 10.00, '2022-08-07', '2022-12-07'),
('804.128.142-00', '239.872.033-01', 'MAE0116', 9.00, '2022-08-07', '2022-12-07');
