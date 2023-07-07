
INSERT INTO "pessoa"(cpf, nome, endereco, senha, login, instituicao, data_nascimento)
VALUES 
('239.872.033-01', 'John John', 'Rua b', 'abdc', 'johnjohn' , 'IME', '1998-10-05'),
('729.231.000-13', 'Doe Doe'  , 'Rua a', 'adcb', 'doedoe'   , 'IME', '1999-12-15'),
('592.004.927-99', 'Eduardo'  , 'Rua f', 'aood', 'eduardo'  , 'IME', '1999-01-15'),
('804.128.142-00', 'Mariana'  , 'Rua u', 'bdrd', 'mariana'  , 'IME', '2000-02-15'),
('284.242.193-77', 'Pereira'  , 'Rua a', 'aood', 'pereira'  , 'FAU', '2000-03-15'),
('439.293.130-67', 'John Doe' , 'Rua a', 'abcd', 'johndoe'  , 'FAU', '2001-04-05'),
('283.103.193-39', 'Doe John' , 'Rua f', 'adoc', 'doejohn'  , 'FAU', '2002-04-05'),
('242.490.024-30', 'Machado'  , 'Rua h', 'bbid', 'machado'  , 'VET', '2003-06-15'),
('823.108.202-18', 'Dummont'  , 'Rua u', 'ttod', 'dummont'  , 'VET', '2003-07-15'),
('239.394.134-73', 'Andrade'  , 'Rua i', 'otod', 'andrade'  , 'VET', '2003-10-15');

INSERT INTO "perfil"(codigo, tipo)
VALUES 
('a', 'Visitante'),
('b', 'Administrativo'),
('c', 'Administrativo'),
('d', 'Academico'),
('e', 'Academico'),
('f', 'Academico');

INSERT INTO "servico"(codigo, descricao, tipo, id_perfil)
VALUES
('a', '-', 'Visualização' , 1),
('b', '-', 'Inserção'     , 1),
('c', '-', 'Remoção'      , 2),
('d', '-', 'Visualização' , 3),
('e', '-', 'Alteração'    , 3),
('f', '-', 'Inserção'     , 4),
('g', '-', 'Remoção'      , 4),
('h', '-', 'Alteração'    , 4),
('i', '-', 'Visualização' , 5),
('j', '-', 'Alteração'    , 6),
('k', '-', 'Visualização' , 6);

INSERT INTO "docente"(cpf_docente, especialidade, funcao_tecnica)
VALUES
('729.231.000-13', 'Palestrante'    , 'Ensino'),
('592.004.927-99', 'IA'             , 'Ensino'),
('804.128.142-00', 'Álgebra Linear' , 'Ensino'),
('284.242.193-77', 'Cálculo'        , 'Ensino'),
('242.490.024-30', 'Sistemas'       , 'Ensino'),
('823.108.202-18', 'Álgebra Linear' , 'Diretoria'),
('239.394.134-73', 'Teoria'         , 'Diretoria');

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
('MAC0101', 'Integração à Universidade e Profissão' , '-', '1980-01-01'),
('MAC0110', 'Introdução à Computação'               , '-', '1975-01-01'),
('MAT0112', 'Vetores e Geometria'                   , '-', '1980-01-01'),
('MAT2453', 'Cálculo Diferencial e Integral I'      , '-', '1982-01-01'),
('MAC0216', 'Técnicas de Programação I'             , '-', '1970-01-01'),
('MAT0122', 'Álgebra Linear I'                      , '-', '1975-01-01'),
('MAC0121', 'Algoritmos e Estrutura de Dados I'     , '-', '1980-01-01'),
('MAC0323', 'Algoritmos e Estrutura de Dados II'    , '-', '1980-01-01'),
('MAC0422', 'Sistemas Operacionais'                 , '-', '1975-01-01'),
('MAC0338', 'Análise de Algoritmos'                 , '-', '1977-01-01'),
('MAC0210', 'Laboratório de Métodos Numéricos'      , '-', '1982-01-01');

INSERT INTO "rel_pessoa_perfil"(id_pessoa, id_perfil)
VALUES
(1, 1),
(1, 2),
(3, 3),
(4, 2),
(5, 2),
(5, 6),
(6, 4),
(7, 5),
(9, 2),
(10, 1),
(10, 2),
(10, 3);

INSERT INTO "rel_oferecimento"(id_docente, id_aluno, id_disciplina, nota_obtida, data_inicio, data_fim)
VALUES
(1, 4, 3, 8.80, '2020-08-07', '2020-12-07'),
(1, 3, 3, 8.50, '2020-08-07', '2020-12-07'),

(1, 1, 3, 5.50, '2021-03-15', '2021-07-15'),
(1, 2, 3, 6.50, '2021-03-15', '2021-07-15'),

(1, 3, 1, 7.00, '2021-03-15', '2021-07-15'),
(1, 4, 1, 8.80, '2021-03-15', '2021-07-15'),
(1, 2, 1, 8.10, '2021-03-15', '2021-07-15'),

(1, 1, 2,10.00, '2021-08-07', '2021-12-07'),
(1, 2, 2,10.00, '2021-08-07', '2021-12-07'),
(1, 3, 2,10.00, '2021-08-07', '2021-12-07'),

(2, 1, 2, 8.75, '2021-03-15', '2021-07-15'),
(2, 2, 2,10.00, '2021-03-15', '2021-07-15'),
(2, 3, 2, 9.75, '2021-03-15', '2021-07-15'),

(3, 4, 3, 5.75, '2021-08-07', '2021-12-07'),
(3, 1, 3, 9.75, '2021-08-07', '2021-12-07'),
(3, 2, 3,10.00, '2021-08-07', '2021-12-07'),

(3, 1, 6, 9.50, '2022-03-15', '2022-07-15'),
(3, 4, 6, 9.50, '2022-03-15', '2022-07-15'),
(3, 3, 6, 9.50, '2022-03-15', '2022-07-15'),

(4, 1, 4,10.00, '2021-03-15', '2021-07-15'),
(4, 4, 4, 9.80, '2021-03-15', '2021-07-15'),
(4, 3, 4, 9.50, '2021-03-15', '2021-07-15'),

(5, 1, 9, 8.40, '2021-03-15', '2021-07-15'),
(5, 4, 9, 8.00, '2021-03-15', '2021-07-15'),
(5, 3, 9, 7.90, '2021-03-15', '2021-07-15'),

(5, 1, 5, 9.50, '2021-08-07', '2021-12-07'),
(5, 2, 5, 9.50, '2021-08-07', '2021-12-07'),

(5, 3, 5, 9.50, '2022-08-07', '2022-12-07'),
(5, 4, 5, 9.30, '2022-08-07', '2022-12-07'),

(5, 1,11, 8.51, '2023-03-15', '2023-07-15'),
(5, 2,11, 5.50, '2023-03-15', '2023-07-15'),
(5, 3,11, 9.56, '2023-03-15', '2023-07-15'),
(5, 4,11, 7.50, '2023-03-15', '2023-07-15'),

(6, 1, 6,10.00, '2022-08-07', '2022-12-07'),
(6, 2, 6, 8.10, '2022-08-07', '2022-12-07'),
(6, 3, 6, 6.50, '2022-08-07', '2022-12-07'),
(6, 4, 6, 7.50, '2022-08-07', '2022-12-07'),

(7, 1, 7, 7.30, '2021-08-07', '2021-12-07'),
(7, 2, 7, 7.30, '2021-08-07', '2021-12-07'),

(7, 1, 8, 7.30, '2022-08-07', '2022-12-07'),
(7, 2, 8,10.00, '2022-08-07', '2022-12-07'),

(7, 1,10, 7.30, '2022-03-15', '2022-07-15'),
(7, 2,10, 7.34, '2022-03-15', '2022-07-15'),

(7, 3,10, 7.34, '2023-03-15', '2023-07-15'),
(7, 4,10, 7.32, '2023-03-15', '2023-07-15'),

(7, 3, 7, 8.85, '2023-03-15', '2023-07-15'),
(7, 4, 7, 8.50, '2023-03-15', '2023-07-15');

INSERT INTO "rel_historico"(id_pessoa, id_servico)
VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 4),
(3, 2),
(3, 5),
(4, 8),
(4, 6),
(5, 3),
(6, 3),
(6, 7),
(7, 7),
(8, 7),
(9, 9);

