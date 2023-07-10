package com.example.labjef.relHistorico;

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
public class RelHistoricoController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/relHistoricos")
    public String listaRelHistoricos(Model model) {
        List<RelHistorico> relHistoricos = jdbcTemplate.query(
            "SELECT * FROM rel_historico ORDER BY id DESC",
            new RelHistoricoRowMapper());
        model.addAttribute("listaRelHistoricos", relHistoricos);
        return "relHistoricos";
    }

    @GetMapping("/relHistorico")
    public String formRelHistorico(Model model) {
        model.addAttribute("relHistorico", new RelHistorico());
        return "relHistorico";
    }

    @GetMapping("/relHistorico/{id}")
    public String editRelHistorico(Model model, @PathVariable Integer id) {
        RelHistorico relHistorico = jdbcTemplate.queryForObject("SELECT * FROM rel_historico WHERE id = ?", 
            new RelHistoricoRowMapper(), id);
        model.addAttribute("relHistorico", relHistorico);
        return "relHistorico";
    }

    @PostMapping("/relHistorico")
    public String submitRelHistorico(@ModelAttribute RelHistorico relHistorico, Model model) {
        if (relHistorico.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE rel_historico SET id_pessoa = ?, id_servico = ? WHERE id = ?",
                
                relHistorico.getIdPessoa(),
                relHistorico.getIdServico(),
                relHistorico.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO rel_historico (id_pessoa, id_servico) VALUES (?, ?)",
                
                relHistorico.getIdPessoa(),
                relHistorico.getIdServico()
            );        
        }
        return "redirect:/relHistoricos";
    }

    @DeleteMapping("/relHistorico/{id}")
    public String deleteRelHistorico(@PathVariable Integer id) {
        jdbcTemplate.update(
            "DELETE FROM rel_historico WHERE ID = ?",
            id
        );
        return "redirect:/relHistoricos";
    }
}
