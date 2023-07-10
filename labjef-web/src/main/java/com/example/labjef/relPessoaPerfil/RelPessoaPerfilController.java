package com.example.labjef.relPessoaPerfil;

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
public class RelPessoaPerfilController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/relPessoasPerfis")
    public String listaRelPessoasPerfis(Model model) {
        List<RelPessoaPerfil> relPessoasPerfis = jdbcTemplate.query(
            "SELECT * FROM rel_pessoa_perfil ORDER BY id DESC",
            new RelPessoaPerfilRowMapper());
        model.addAttribute("listaRelPessoasPerfis", relPessoasPerfis);
        return "relPessoasPerfis";
    }

    @GetMapping("/relPessoaPerfil")
    public String formRelPessoaPerfil(Model model) {
        model.addAttribute("relPessoaPerfil", new RelPessoaPerfil());
        return "relPessoaPerfil";
    }

    @GetMapping("/relPessoaPerfil/{id}")
    public String editRelPessoaPerfil(Model model, @PathVariable Integer id) {
        RelPessoaPerfil relPessoaPerfil = jdbcTemplate.queryForObject("SELECT * FROM rel_pessoa_perfil WHERE id = ?", 
            new RelPessoaPerfilRowMapper(), id);
        model.addAttribute("relPessoaPerfil", relPessoaPerfil);
        return "relPessoaPerfil";
    }

    @PostMapping("/relPessoaPerfil")
    public String submitRelPessoaPerfil(@ModelAttribute RelPessoaPerfil relPessoaPerfil, Model model) {
        if (relPessoaPerfil.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE rel_pessoa_perfil SET id_pessoa = ?, id_perfil = ? WHERE id = ?",
                
                relPessoaPerfil.getIdPessoa(),
                relPessoaPerfil.getIdPerfil(),
                relPessoaPerfil.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO rel_pessoa_perfil (id_pessoa, id_perfil) VALUES (?, ?)",
                
                relPessoaPerfil.getIdPessoa(),
                relPessoaPerfil.getIdPerfil()
            );        
        }
        return "redirect:/relPessoasPerfis";
    }

    @DeleteMapping("/relPessoaPerfil/{id}")
    public String deleteRelPessoaPerfil(@PathVariable Integer id) {
        jdbcTemplate.update(
            "DELETE FROM rel_pessoa_perfil WHERE ID = ?",
            id
        );
        return "redirect:/relPessoasPerfis";
    }
}
