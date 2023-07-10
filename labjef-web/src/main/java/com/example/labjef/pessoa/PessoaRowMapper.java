package com.example.labjef.pessoa;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PessoaRowMapper implements RowMapper<Pessoa> {
    @Override
    public Pessoa mapRow(ResultSet rs, int rowNum) throws SQLException {
        Pessoa pessoa = new Pessoa(rs.getInt("id"));
        
        pessoa.setCpf(rs.getString("cpf"));
        pessoa.setNome(rs.getString("nome"));
        pessoa.setEndereco(rs.getString("endereco"));
        pessoa.setSenha(rs.getString("senha"));
        pessoa.setLogin(rs.getString("login"));
        pessoa.setInstituicao(rs.getString("instituicao"));
        pessoa.setDataNascimento(rs.getDate("data_nascimento"));

        return pessoa;
    }
}
