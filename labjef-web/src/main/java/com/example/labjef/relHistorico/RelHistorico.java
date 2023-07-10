package com.example.labjef.relHistorico;

public class RelHistorico {

    private Integer id;
    private Integer idPessoa;
    private Integer idServico;

    public RelHistorico() {
        this.id = -1;
    }

    public RelHistorico(Integer id) {
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
    
    public Integer getIdServico() {
        return idServico;
    }

    public void setIdServico(Integer idServico) {
        this.idServico = idServico;
    }
    
}
