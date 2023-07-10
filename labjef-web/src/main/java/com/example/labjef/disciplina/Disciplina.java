package com.example.labjef.disciplina;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

public class Disciplina {

    private Integer id;
    private String codigo;
    private String nome;
    private String ementa;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dataCriacao;

    public Disciplina() {
        this.id = -1;
    }

    public Disciplina(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }
    
    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }
    
}
