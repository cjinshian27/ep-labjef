package com.example.labjef.relOferecimento;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

public class RelOferecimento {

    private Integer id;
    private Integer idDocente;
    private Integer idAluno;
    private Integer idDisciplina;
    private Float notaObtida;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dataInicio;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dataFim;

    public RelOferecimento() {
        this.id = -1;
    }

    public RelOferecimento(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getIdDocente() {
        return idDocente;
    }

    public void setIdDocente(Integer idDocente) {
        this.idDocente = idDocente;
    }
    
    public Integer getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(Integer idAluno) {
        this.idAluno = idAluno;
    }
    
    public Integer getIdDisciplina() {
        return idDisciplina;
    }

    public void setIdDisciplina(Integer idDisciplina) {
        this.idDisciplina = idDisciplina;
    }
    
    public Float getNotaObtida() {
        return notaObtida;
    }

    public void setNotaObtida(Float notaObtida) {
        this.notaObtida = notaObtida;
    }
    
    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }
    
    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }
    
}
