-- Consulta 1
-- Liste os serviços que podem ser utilizados por pessoas de acordo com os perfis
CREATE OR REPLACE FUNCTION servicos_por_pessoa()
RETURNS TABLE (id_pessoa INT, id_servico INT)
LANGUAGE plpgsql AS
$$
BEGIN
  RETURN QUERY
  SELECT rpp.id_pessoa, servico.id AS id_servico
  FROM rel_pessoa_perfil AS rpp, servico
  WHERE rpp.id_perfil = servico.id_perfil;
END
$$;	

-- Consulta 2
-- Liste em ordem crescente o total de serviços utilizados agrupados pelo perfil de pessoas
CREATE OR REPLACE FUNCTION servicos_utilizados_por_perfil()
RETURNS TABLE(id_perfil INT, servicos_utilizados BIGINT)
LANGUAGE plpgsql AS
$$
BEGIN
  RETURN QUERY
  SELECT servico.id_perfil, COUNT(*) AS servicos_utilizados
  FROM rel_historico, servico
  WHERE rel_historico.id_servico = servico.id
  GROUP BY servico.id_perfil
  ORDER BY servicos_utilizados;
END
$$;

-- Consulta 3
-- Liste as 5 (cinco) disciplinas mais oferecidas com seus respectivos professores e alunos
CREATE OR REPLACE FUNCTION cinco_disciplinas_mais_oferecidas()
RETURNS TABLE(id_disciplina INT, id_docente INT, id_aluno INT, num_oferecimentos BIGINT)
LANGUAGE plpgsql AS
$$
BEGIN
  RETURN QUERY
  WITH disciplinas_mais_oferecidas AS (
    SELECT
      rel_oferecimento.id_disciplina AS id,
      COUNT(DISTINCT rel_oferecimento.data_inicio) AS num_oferecimentos
    FROM rel_oferecimento
    GROUP BY rel_oferecimento.id_disciplina
    ORDER BY num_oferecimentos DESC
    LIMIT 5
  )
  SELECT
    oferecimento.id_disciplina,
    oferecimento.id_docente,
    oferecimento.id_aluno,
    disciplinas_mais_oferecidas.num_oferecimentos
  FROM rel_oferecimento as oferecimento, disciplinas_mais_oferecidas
  WHERE oferecimento.id_disciplina = disciplinas_mais_oferecidas.id
  ORDER BY disciplinas_mais_oferecidas.num_oferecimentos DESC, oferecimento.id_disciplina;
END
$$;

-- Consulta 4
-- Liste os 5 docentes que mais ministraram disciplinas oferecidas no período de maio de 2020 a maio de 2023
CREATE OR REPLACE FUNCTION cinco_docentes_que_mais_ministraram()
RETURNS TABLE(id_docente INT, num_disciplinas_ministradas BIGINT)
LANGUAGE plpgsql AS
$$
BEGIN
  RETURN QUERY
  WITH disciplinas_por_docente AS (
    SELECT DISTINCT
      rel_oferecimento.id_docente,
      rel_oferecimento.id_disciplina,
      rel_oferecimento.data_inicio
    FROM rel_oferecimento
    WHERE rel_oferecimento.data_inicio >= '2020-05-01' AND rel_oferecimento.data_inicio < '2023-05-01'
  )
  SELECT
    disciplinas_por_docente.id_docente,
    COUNT(*) as num_disciplinas_ministradas
  FROM disciplinas_por_docente
  GROUP BY disciplinas_por_docente.id_docente
  ORDER BY num_disciplinas_ministradas DESC
  LIMIT 5;
END
$$;
