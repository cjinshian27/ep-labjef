package com.example.labjef.funcionario;

public class Funcionario {

    private Integer id;
    private Integer idPessoa;
    private String especialidade;
    private String funcaoTecnica;

    public Funcionario() {
        this.id = -1;
    }

    public Funcionario(Integer id) {
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
    
    public String getEspecialidade() {
        return especialidade;
    }

    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }
    
    public String getFuncaoTecnica() {
        return funcaoTecnica;
    }

    public void setFuncaoTecnica(String funcaoTecnica) {
        this.funcaoTecnica = funcaoTecnica;
    }
    
}
