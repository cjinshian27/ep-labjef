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
CREATE OR REPLACE FUNCTION 5_disciplinas_mais_oferecidas()
RETURNS TABLE()
LANGUAGE plpgsql AS
$$
BEGIN
	RETURN QUERY
	SELECT
	FROM 
	WHERE
	ORDER BY
END
$$;

-- Consulta 4
-- Liste os 5 docentes que mais ministraram disciplinas oferecidas no período de maio de 2020 a maio de 2023
CREATE OR REPLACE FUNCTION cinco_docentes_que_mais_ministraram()
CREATE OR REPLACE FUNCTION 5_docentes_que_mais_ministraram()
RETURNS TABLE()
LANGUAGE plpgsql AS
$$
BEGIN
	RETURN QUERY
	SELECT
	FROM 
	WHERE
	ORDER BY
END
$$;