
INSERT INTO "pessoa"(cpf, nome, endereco, senha, login, instituicao, data_nascimento)
VALUES 
('530.138.128-48', 'Rua Cristiano Olsen, 931', 'Mariane Dias', 'mdias9284', 'MarianeDias', 'Unesp', '2000-10-05'),
('357.231.938-21', 'Rua Maria Luísa do Val Penteado, 238', 'Fernando Santos', 'fsantos3482', 'FernandoSantos', 'USP', '1990-07-13'),
('392.454.139-24', 'Rua Carlos Augusto Cornelsen, 34','Mario Magalhães Oliveira', 'mmoliveira7230', 'MarioOliveira', 'USP', '1992-05-18'),
('120.395.772-55', 'Rua Maria Luísa do Val Penteado, 101', 'André Gomes', 'agomes0130', 'AndréGomes', 'USP','2003-08-21'),	
('439.293.130-67', 'Rua dos Carijós, 12', 'Sofia Lima Ferreira', 'sflima4930', 'SofiaLima', 'USP', '2002-02-02'),
('239.872.033-01', 'Avenida São João, 360', 'Miriam Barroso', 'mbarroso2398', 'MiriamBarroso', 'USP', '2001-11-29'),
('283.103.193-39', 'Avenida Esbertalina Barbosa Damiani, 522', 'Felipe Barbosa', 'fbarbosa2983', 'FelipeBarbosa', 'USP', '1999-11-20'),
('729.231.000-13', 'Rua Serra de Bragança, 013', 'Mateus Hashimoto', 'mhashimoto1383', 'MateusHashimoto', 'USP', '1980-09-12'),
('592.004.927-99', 'Travessa Antônio Ferreira, 193', 'Alberto Fernandes Lima', 'aflima3071', 'AlbertoLima', 'USP', '1968-01-30'),
('804.128.142-00', 'Rua Arlindo Nogueira, 1049', 'Elisio Alencar de Souza', 'easouza1034', 'ElisioAlencar', 'USP', '1970-10-19'),
('284.242.193-77', 'Avenida Tocantins, 120', 'Gisele Costa Vasconcelos', 'gcvasconcelos3948', 'GiseleCosta', 'USP', '1973-08-16'),
('242.490.024-30', 'Rodovia Raposo Tavares, 625', 'Valentina Amorim', 'vamorim0103', 'ValentinaAmorim', 'USP', '1969-12-13'),
('823.108.202-18', 'Rua Paracatu, 92', 'Julia Harumi Nakata', 'jhnakata01018', 'JuliaHarumi', 'USP', '1982-04-30'),
('239.394.134-73', 'Praça da República, 739', 'João Pedro Marques', 'jpmarques2038', 'JoãoMarques', 'USP', '1972-10-18');

INSERT INTO "perfil"(codigo, tipo)
VALUES 
('Visitante'),
('Administrativo'),
('Administrativo'),
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico'),
('Academico');

INSERT INTO "servico"(descricao, tipo, id_perfil)
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
('729.231.000-13', 'Palestrante', 'Docente'),
('592.004.927-99', 'IA', 'Docente'),
('804.128.142-00', 'Álgebra Linear', 'Docente'),
('284.242.193-77', 'Cálculo Diferencial e Integral', 'Docente'),
('242.490.024-30', 'Sistemas de Software', 'Docente'),
('823.108.202-18', 'Álgebra Linear', 'Docente'),
('239.394.134-73', 'Teoria da Computação', 'Docente');

INSERT INTO "funcionario"(cpf_funcionario, especialidade, funcao_tecnica)
VALUES
('357.231.938-21', '-', 'Recepção da biblioteca'),
('392.454.139-24', '-', 'Recepção de alunos');

INSERT INTO "aluno"(cpf_aluno, curso, nota_ingresso)
VALUES
('120.395.772-55', 'Bacharelado em Ciência da Computação', 84.00),
('439.293.130-67', 'Bacharelado em Ciência da Computação', 65.00),
('239.872.033-01', 'Bacharelado em Ciência da Computação', 80.80),
('283.103.193-39', 'Bacharelado em Ciência da Computação', 75.30);

INSERT INTO "disciplina"(codigo, nome, ementa, data_criacao)
VALUES
('MAC0101', 'Integração à Universidade e Profissão', '-', '1980-01-01'),
('MAC0110', 'Introdução à Computação', '-', '1975-01-01'),
('MAT0112', 'Vetores e Geometria', '-', '1980-01-01'),
('MAT2453', 'Cálculo Diferencial e Integral I', '-', '1982-01-01'),
('MAC0216', 'Técnicas de Programação I', '-', '1970-01-01'),
('MAT0122', 'Álgebra Linear I', '-', '1975-01-01'),
('MAC0121', 'Algoritmos e Estrutura de Dados I', '-', '1980-01-01'),
('MAC0323', 'Algoritmos e Estrutura de Dados II', '-', '1980-01-01'),
('MAC0422', 'Sistemas Operacionais', '-', '1975-01-01'),
('MAC0338', 'Análise de Algoritmos', '-', '1977-01-01'),
('MAC0210', 'Laboratório de Métodos Numéricos', '-', '1982-01-01');

INSERT INTO "rel_pessoa_perfil"(id_pessoa, id_perfil)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14);


INSERT INTO "rel_docente_aluno_disciplina"(id_docente, id_aluno, id_disciplina, nota_obtida, data_inicio, data_fim)
VALUES
(1, 4, 3, 8.80, '2020-08-07', '2020-12-07'),
(1, 3, 3, 8.50, '2020-08-07', '2020-12-07'),

(1, 1, 3, 5.50, '2021-03-15', '2021-07-15'),
(1, 2, 3, 6.50, '2021-03-15', '2021-07-15'),

(1, 3, 1, 7.00, '2021-03-15', '2021-07-15'),
(1, 4, 1, 8.80, '2021-03-15', '2021-07-15'),
(1, 2, 1, 8.10, '2021-03-15', '2021-07-15'),

(1, 1, 2, 10.00, '2021-08-07', '2021-12-07'),
(1, 2, 2, 10.00, '2021-08-07', '2021-12-07'),
(1, 3, 2, 10.00, '2021-08-07', '2021-12-07'),

(2, 1, 2, 8.75, '2021-03-15', '2021-07-15'),
(2, 2, 2, 10.00, '2021-03-15', '2021-07-15'),
(2, 3, 2, 9.75, '2021-03-15', '2021-07-15'),

(3, 4, 3, 5.75, '2021-08-07', '2021-12-07'),
(3, 1, 3, 9.75, '2021-08-07', '2021-12-07'),
(3, 2, 3, 10.00, '2021-08-07', '2021-12-07'),

(3, 1, 6, 9.50, '2022-03-15', '2022-07-15'),
(3, 4, 6, 9.50, '2022-03-15', '2022-07-15'),
(3, 3, 6, 9.50, '2022-03-15', '2022-07-15'),

(4, 1, 4, 10.00, '2021-03-15', '2021-07-15'),
(4, 4, 4, 9.80, '2021-03-15', '2021-07-15'),
(4, 3, 4, 9.50, '2021-03-15', '2021-07-15'),

(5, 1, 9, 8.40, '2021-03-15', '2021-07-15'),
(5, 4, 9, 8.00, '2021-03-15', '2021-07-15'),
(5, 3, 9, 7.90, '2021-03-15', '2021-07-15'),

(5, 1, 5, 9.50, '2021-08-07', '2021-12-07'),
(5, 2, 5, 9.50, '2021-08-07', '2021-12-07'),

(5, 3, 5, 9.50, '2022-08-07', '2022-12-07'),
(5, 4, 5, 9.30, '2022-08-07', '2022-12-07'),

(5, 1, 11, 8.51, '2023-03-15', '2023-07-15'),
(5, 2, 11, 5.50, '2023-03-15', '2023-07-15'),
(5, 3, 11, 9.56, '2023-03-15', '2023-07-15'),
(5, 4, 11, 7.50, '2023-03-15', '2023-07-15'),

(6, 1, 6, 10.00, '2022-08-07', '2022-12-07'),
(6, 2, 6, 8.10, '2022-08-07', '2022-12-07'),
(6, 3, 6, 6.50, '2022-08-07', '2022-12-07'),
(6, 4, 6, 7.50, '2022-08-07', '2022-12-07'),

(7, 1, 7, 7.30, '2021-08-07', '2021-12-07'),
(7, 2, 7, 7.30, '2021-08-07', '2021-12-07'),

(7, 1, 8, 7.30, '2022-08-07', '2022-12-07'),
(7, 2, 8, 10.00, '2022-08-07', '2022-12-07'),

(7, 1, 10, 7.30, '2022-03-15', '2022-07-15'),
(7, 2, 10, 7.34, '2022-03-15', '2022-07-15'),

(7, 3, 10, 7.34, '2023-03-15', '2023-07-15'),
(7, 4, 10, 7.32, '2023-03-15', '2023-07-15'),

(7, 3, 7, 8.85, '2023-03-15', '2023-07-15'),
(7, 4, 7, 8.50, '2023-03-15', '2023-07-15');
