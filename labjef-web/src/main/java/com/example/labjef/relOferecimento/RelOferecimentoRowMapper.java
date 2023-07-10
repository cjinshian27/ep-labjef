package com.example.labjef.relOferecimento;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RelOferecimentoRowMapper implements RowMapper<RelOferecimento> {
    @Override
    public RelOferecimento mapRow(ResultSet rs, int rowNum) throws SQLException {
        RelOferecimento relOferecimento = new RelOferecimento(rs.getInt("id"));
        
        relOferecimento.setIdDocente(rs.getInt("id_docente"));
        relOferecimento.setIdAluno(rs.getInt("id_aluno"));
        relOferecimento.setIdDisciplina(rs.getInt("id_disciplina"));
        relOferecimento.setNotaObtida(rs.getFloat("nota_obtida"));
        relOferecimento.setDataInicio(rs.getDate("data_inicio"));
        relOferecimento.setDataFim(rs.getDate("data_fim"));

        return relOferecimento;
    }
}
