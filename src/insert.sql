
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
('530.138.128-48', 'Rua Cristiano Olsen, 931', 'Mariane Dias', 'mdias9284', 'MarianeDias', 'Unesp', '2000-10-05'),
('284.242.193-77', 'Avenida Tocantins, 120', 'Gisele Costa Vasconcelos', 'gcvasconcelos3948', 'GiseleCosta', 'USP', '1973-08-16'),
('242.490.024-30', 'Rodovia Raposo Tavares, 625', 'Valentina Amorim', 'vamorim0103', 'ValentinaAmorim', 'USP', '1969-12-13'),
('823.108.202-18', 'Rua Paracatu, 92', 'Julia Harumi Nakata', 'jhnakata01018', 'JuliaHarumi', 'USP', '1982-04-30'),
('239.394.134-73', 'Praça da República, 739', 'João Pedro Marques', 'jpmarques2038', 'JoãoMarques', 'USP', '1972-10-18'),
('283.103.193-39', 'Avenida Esbertalina Barbosa Damiani, 522', 'Felipe Barbosa', 'fbarbosa2983', 'FelipeBarbosa', 'USP', '1999-11-20');

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
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico');

INSERT INTO "servico"(descricao, tipo_servico, codigo_perfil)
VALUES
('-', 'Visualização', 1),
('-', 'Inserção', 2),
('-', 'Remoção', 2),
('-', 'Visualização', 3),
('-', 'Alteração', 4),
('-', 'Inserção', 4),
('-', 'Remoção', 5),
('-', 'Alteração', 5),
('-', 'Visualização', 5),
('-', 'Alteração', 6),
('-', 'Visualização', 7),
('-', 'Remoção', 8),
('-', 'Alteração', 9),
('-', 'Remoção', 10),
('-', 'Alteração', 11),
('-', 'Visualização', 12),
('-', 'Inserção', 12),
('-', 'Inserção', 13),
('-', 'Alteração', 13),
('-', 'Visualização', 14);

INSERT INTO "docente"(cpf_docente, especialidade, funcao_tecnica)
VALUES 
('729.231.000-13', 'Cartografia', 'Docente'),
('592.004.927-99', 'Ciência de Dados', 'Docente'),
('804.128.142-00', 'Economia', 'Docente'),
('284.242.193-77', 'Genética', 'Docente'),
('242.490.024-30', 'Cálculo Diferencial e Integral', 'Docente'),
('823.108.202-18', 'Geologia', 'Docente'),
('239.394.134-73', 'Astronomia', 'Docente');

INSERT INTO "funcionario"(cpf_funcionario, especialidade, funcao_tecnica)
VALUES
('357.231.938-21', '-', 'Recepção da biblioteca'),
('392.454.139-24', '-', 'Recepção de alunos');

INSERT INTO "aluno"(cpf_aluno, curso, nota_ingresso)
VALUES
('120.395.772-55', 'Bacharelado em Ciência da Computação', 84.00),
('439.293.130-67', 'Licenciatura em Geografia', 65.00),
('239.872.033-01', 'Farmácia', 80.80),
('283.103.193-39', 'Astronomia', 75.30);

INSERT INTO "disciplina"(codigo_disciplina, nome, ementa, data_criacao)
VALUES
('EAE0106', 'Introdução à Economia', '-', '1980-01-01'),
('MAC0110', 'Introdução à Computação', '-', '1975-01-01'),
('MAE0116', 'Noções de Estatística', '-', '1977-01-01'),
('FLG0141', 'Introdução à Cartografia', '-', '1980-01-01'),
('0440620', 'Geologia Geral', '-', '1982-01-01'),
('MAT0111', 'Cálculo Diferencial e Integral I', '-', '1970-01-01'),
('BIO0203', 'Genética', '-', '1975-01-01'),
('AGA0106', 'Astronomia de Posição', '-', '1980-01-01');

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
('530.138.128-48', 3), 
('284.242.193-77', 10),
('242.490.024-30', 11),
('823.108.202-18', 12),
('239.394.134-73', 13), 
('283.103.193-39', 14);

INSERT INTO "rel_docente_aluno_disciplina"(cpf_docente, cpf_aluno, codigo_disciplina, nota_obtida, data_inicio, data_fim)
VALUES
('239.394.134-73', '283.103.193-39', 'AGA0106', 5.55, '2020-03-15', '2020-07-15'),
('242.490.024-30', '439.293.130-67', 'MAT0111', 6.50, '2021-03-15', '2021-07-15'),
('284.242.193-77', '239.872.033-01', 'BIO0203', 8.75, '2021-08-07', '2021-12-07'),
('823.108.202-18', '439.293.130-67', '0440620', 10.00, '2021-08-07', '2021-12-07'),
('592.004.927-99', '120.395.772-55', 'MAC0110', 10.00, '2022-08-07', '2022-12-07'),
('804.128.142-00', '120.395.772-55', 'MAE0116', 9.80, '2022-08-07', '2022-12-07'),
('804.128.142-00', '239.872.033-01', 'MAE0116', 9.30, '2022-08-07', '2022-12-07'),
('804.128.142-00', '439.293.130-67', 'MAE0116', 9.00, '2022-08-07', '2022-12-07'),
('729.231.000-13', '439.293.130-67', 'EAE0106', 7.50, '2023-03-15', '2023-07-15'),
('729.231.000-13', '439.293.130-67', 'FLG0141', 8.50, '2023-03-15', '2023-07-15');
