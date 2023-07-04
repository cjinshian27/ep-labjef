-- Consulta 1
-- Liste os serviços que podem ser utilizados por pessoas de acordo com os perfis
CREATE OR REPLACE FUNCTION servico_por_pessoa()
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
