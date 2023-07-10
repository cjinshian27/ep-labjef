package com.example.labjef.pessoa;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

@Controller
public class PessoaController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/pessoas")
    public String listaPessoas(Model model) {
        List<Pessoa> pessoas = jdbcTemplate.query(
            "SELECT * FROM pessoa ORDER BY id DESC",
            new PessoaRowMapper());
        model.addAttribute("listaPessoas", pessoas);
        return "pessoas";
    }

    @GetMapping("/pessoa")
    public String formPessoa(Model model) {
        model.addAttribute("pessoa", new Pessoa());
        return "pessoa";
    }

    @GetMapping("/pessoa/{id}")
    public String editPessoa(Model model, @PathVariable Integer id) {
        Pessoa pessoa = jdbcTemplate.queryForObject("SELECT * FROM pessoa WHERE id = ?", 
            new PessoaRowMapper(), id);
        model.addAttribute("pessoa", pessoa);
        return "pessoa";
    }

    @PostMapping("/pessoa")
    public String submitPessoa(@ModelAttribute Pessoa pessoa, Model model) {
        if (pessoa.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE pessoa SET cpf = ?, nome = ?, endereco = ?, senha = ?, login = ?, instituicao = ?, data_nascimento = ? WHERE id = ?",
                
                pessoa.getCpf(),
                pessoa.getNome(),
                pessoa.getEndereco(),
                pessoa.getSenha(),
                pessoa.getLogin(),
                pessoa.getInstituicao(),
                pessoa.getDataNascimento(),
                pessoa.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO pessoa (cpf, nome, endereco, senha, login, instituicao, data_nascimento) VALUES (?, ?, ?, ?, ?, ?, ?)",
                
                pessoa.getCpf(),
                pessoa.getNome(),
                pessoa.getEndereco(),
                pessoa.getSenha(),
                pessoa.getLogin(),
                pessoa.getInstituicao(),
                pessoa.getDataNascimento()
            );        
        }
        return "redirect:/pessoas";
    }

    @DeleteMapping("/pessoa/{id}")
    public String deletePessoa(@PathVariable Integer id) {
        jdbcTemplate.update(
            "DELETE FROM pessoa WHERE ID = ?",
            id
        );
        return "redirect:/pessoas";
    }
}
