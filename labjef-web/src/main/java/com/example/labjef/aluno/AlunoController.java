package com.example.labjef.aluno;

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
public class AlunoController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/alunos")
    public String listaAlunos(Model model) {
        List<Aluno> alunos = jdbcTemplate.query(
            "SELECT * FROM aluno ORDER BY id DESC",
            new AlunoRowMapper());
        model.addAttribute("listaAlunos", alunos);
        return "alunos";
    }

    @GetMapping("/aluno")
    public String formAluno(Model model) {
        model.addAttribute("aluno", new Aluno());
        return "aluno";
    }

    @GetMapping("/aluno/{id}")
    public String editAluno(Model model, @PathVariable Integer id) {
        Aluno aluno = jdbcTemplate.queryForObject("SELECT * FROM aluno WHERE id = ?", 
            new AlunoRowMapper(), id);
        model.addAttribute("aluno", aluno);
        return "aluno";
    }

    @PostMapping("/aluno")
    public String submitAluno(@ModelAttribute Aluno aluno, Model model) {
        if (aluno.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE aluno SET id_pessoa = ?, curso = ?, nota_ingresso = ? WHERE id = ?",
                
                aluno.getIdPessoa(),
                aluno.getCurso(),
                aluno.getNotaIngresso(),
                aluno.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO aluno (id_pessoa, curso, nota_ingresso) VALUES (?, ?, ?)",
                
                aluno.getIdPessoa(),
                aluno.getCurso(),
                aluno.getNotaIngresso()
            );        
        }
        return "redirect:/alunos";
    }

    @DeleteMapping("/aluno/{id}")
    public String deleteAluno(@PathVariable Integer id) {
        jdbcTemplate.update(
            "DELETE FROM aluno WHERE ID = ?",
            id
        );
        return "redirect:/alunos";
    }
}
