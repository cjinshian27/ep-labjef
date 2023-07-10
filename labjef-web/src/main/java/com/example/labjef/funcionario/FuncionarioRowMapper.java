package com.example.labjef.funcionario;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FuncionarioRowMapper implements RowMapper<Funcionario> {
    @Override
    public Funcionario mapRow(ResultSet rs, int rowNum) throws SQLException {
        Funcionario funcionario = new Funcionario(rs.getInt("id"));
        
        funcionario.setIdPessoa(rs.getInt("id_pessoa"));
        funcionario.setEspecialidade(rs.getString("especialidade"));
        funcionario.setFuncaoTecnica(rs.getString("funcao_tecnica"));

        return funcionario;
    }
}
