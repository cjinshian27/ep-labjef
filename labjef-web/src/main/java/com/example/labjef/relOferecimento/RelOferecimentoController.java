package com.example.labjef.relOferecimento;

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
public class RelOferecimentoController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/relOferecimentos")
    public String listaRelOferecimentos(Model model) {
        List<RelOferecimento> relOferecimentos = jdbcTemplate.query(
            "SELECT * FROM rel_oferecimento ORDER BY id DESC",
            new RelOferecimentoRowMapper());
        model.addAttribute("listaRelOferecimentos", relOferecimentos);
        return "relOferecimentos";
    }

    @GetMapping("/relOferecimento")
    public String formRelOferecimento(Model model) {
        model.addAttribute("relOferecimento", new RelOferecimento());
        return "relOferecimento";
    }

    @GetMapping("/relOferecimento/{id}")
    public String editRelOferecimento(Model model, @PathVariable Integer id) {
        RelOferecimento relOferecimento = jdbcTemplate.queryForObject("SELECT * FROM rel_oferecimento WHERE id = ?", 
            new RelOferecimentoRowMapper(), id);
        model.addAttribute("relOferecimento", relOferecimento);
        return "relOferecimento";
    }

    @PostMapping("/relOferecimento")
    public String submitRelOferecimento(@ModelAttribute RelOferecimento relOferecimento, Model model) {
        if (relOferecimento.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE rel_oferecimento SET id_docente = ?, id_aluno = ?, id_disciplina = ?, nota_obtida = ?, data_inicio = ?, data_fim = ? WHERE id = ?",
                
                relOferecimento.getIdDocente(),
                relOferecimento.getIdAluno(),
                relOferecimento.getIdDisciplina(),
                relOferecimento.getNotaObtida(),
                relOferecimento.getDataInicio(),
                relOferecimento.getDataFim(),
                relOferecimento.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO rel_oferecimento (id_docente, id_aluno, id_disciplina, nota_obtida, data_inicio, data_fim) VALUES (?, ?, ?, ?, ?, ?)",
                
                relOferecimento.getIdDocente(),
                relOferecimento.getIdAluno(),
                relOferecimento.getIdDisciplina(),
                relOferecimento.getNotaObtida(),
                relOferecimento.getDataInicio(),
                relOferecimento.getDataFim()
            );        
        }
        return "redirect:/relOferecimentos";
    }

    @DeleteMapping("/relOferecimento/{id}")
    public String deleteRelOferecimento(@PathVariable Integer id) {
        jdbcTemplate.update(
            "DELETE FROM rel_oferecimento WHERE ID = ?",
            id
        );
        return "redirect:/relOferecimentos";
    }
}
