package com.example.labjef.perfil;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PerfilRowMapper implements RowMapper<Perfil> {
    @Override
    public Perfil mapRow(ResultSet rs, int rowNum) throws SQLException {
        Perfil perfil = new Perfil(rs.getInt("id"));
        
        perfil.setCodigo(rs.getString("codigo"));
        perfil.setTipo(rs.getString("tipo"));

        return perfil;
    }
}
