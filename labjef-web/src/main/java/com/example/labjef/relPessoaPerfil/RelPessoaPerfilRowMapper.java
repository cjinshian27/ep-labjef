package com.example.labjef.relPessoaPerfil;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RelPessoaPerfilRowMapper implements RowMapper<RelPessoaPerfil> {
    @Override
    public RelPessoaPerfil mapRow(ResultSet rs, int rowNum) throws SQLException {
        RelPessoaPerfil relPessoaPerfil = new RelPessoaPerfil(rs.getInt("id"));
        
        relPessoaPerfil.setIdPessoa(rs.getInt("id_pessoa"));
        relPessoaPerfil.setIdPerfil(rs.getInt("id_perfil"));

        return relPessoaPerfil;
    }
}
