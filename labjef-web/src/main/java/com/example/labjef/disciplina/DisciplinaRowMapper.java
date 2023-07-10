package com.example.labjef.disciplina;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DisciplinaRowMapper implements RowMapper<Disciplina> {
    @Override
    public Disciplina mapRow(ResultSet rs, int rowNum) throws SQLException {
        Disciplina disciplina = new Disciplina(rs.getInt("id"));
        
        disciplina.setCodigo(rs.getString("codigo"));
        disciplina.setNome(rs.getString("nome"));
        disciplina.setEmenta(rs.getString("ementa"));
        disciplina.setDataCriacao(rs.getDate("data_criacao"));

        return disciplina;
    }
}
