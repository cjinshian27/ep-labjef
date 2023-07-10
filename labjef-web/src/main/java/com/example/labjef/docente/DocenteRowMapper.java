package com.example.labjef.docente;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DocenteRowMapper implements RowMapper<Docente> {
    @Override
    public Docente mapRow(ResultSet rs, int rowNum) throws SQLException {
        Docente docente = new Docente(rs.getInt("id"));
        
        docente.setIdPessoa(rs.getInt("id_pessoa"));
        docente.setEspecialidade(rs.getString("especialidade"));
        docente.setFuncaoTecnica(rs.getString("funcao_tecnica"));

        return docente;
    }
}
