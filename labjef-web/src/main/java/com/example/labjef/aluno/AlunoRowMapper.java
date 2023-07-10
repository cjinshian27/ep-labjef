package com.example.labjef.aluno;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AlunoRowMapper implements RowMapper<Aluno> {
    @Override
    public Aluno mapRow(ResultSet rs, int rowNum) throws SQLException {
        Aluno aluno = new Aluno(rs.getInt("id"));
        
        aluno.setIdPessoa(rs.getInt("id_pessoa"));
        aluno.setCurso(rs.getString("curso"));
        aluno.setNotaIngresso(rs.getFloat("nota_ingresso"));

        return aluno;
    }
}
