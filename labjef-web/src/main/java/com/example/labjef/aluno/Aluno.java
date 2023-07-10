package com.example.labjef.aluno;

public class Aluno {

    private Integer id;
    private Integer idPessoa;
    private String curso;
    private Float notaIngresso;

    public Aluno() {
        this.id = -1;
    }

    public Aluno(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(Integer idPessoa) {
        this.idPessoa = idPessoa;
    }
    
    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }
    
    public Float getNotaIngresso() {
        return notaIngresso;
    }

    public void setNotaIngresso(Float notaIngresso) {
        this.notaIngresso = notaIngresso;
    }
    
}
