package com.example.labjef.servico;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServicoRowMapper implements RowMapper<Servico> {
    @Override
    public Servico mapRow(ResultSet rs, int rowNum) throws SQLException {
        Servico servico = new Servico(rs.getInt("id"));
        
        servico.setCodigo(rs.getString("codigo"));
        servico.setDescricao(rs.getString("descricao"));
        servico.setTipo(rs.getString("tipo"));
        servico.setIdPerfil(rs.getInt("id_perfil"));

        return servico;
    }
}
