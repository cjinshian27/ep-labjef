package com.example.labjef.relPessoaPerfil;

public class RelPessoaPerfil {

    private Integer id;
    private Integer idPessoa;
    private Integer idPerfil;

    public RelPessoaPerfil() {
        this.id = -1;
    }

    public RelPessoaPerfil(Integer id) {
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
    
    public Integer getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(Integer idPerfil) {
        this.idPerfil = idPerfil;
    }
    
}
