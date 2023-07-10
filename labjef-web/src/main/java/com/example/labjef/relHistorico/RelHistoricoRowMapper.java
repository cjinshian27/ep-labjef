package com.example.labjef.relHistorico;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RelHistoricoRowMapper implements RowMapper<RelHistorico> {
    @Override
    public RelHistorico mapRow(ResultSet rs, int rowNum) throws SQLException {
        RelHistorico relHistorico = new RelHistorico(rs.getInt("id"));
        
        relHistorico.setIdPessoa(rs.getInt("id_pessoa"));
        relHistorico.setIdServico(rs.getInt("id_servico"));

        return relHistorico;
    }
}
