package br.com.fatecpg.poo.pj06.grupo06.db;

import br.com.fatecpg.poo.pj06.grupo06.web.DatabaseConnector;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Usuario {
    private int id;
    private String nome;
    private Timestamp dataCadastro;
    private String login;
    private int senha;
    private int pontuacao;

    public Usuario(int id, String nome, Timestamp dataCadastro, String login, int senha, int pontuacao) {
        this.id = id;
        this.nome = nome;
        this.dataCadastro = dataCadastro;
        this.login = login;
        this.senha = senha;
        this.pontuacao = pontuacao;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getSenha() {
        return senha;
    }

    public void setSenha(int senha) {
        this.senha = senha;
    }

    public int getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(int pontuacao) {
        this.pontuacao = pontuacao;
    }
    
    public static Usuario getUsuario(String login, String senha) throws Exception{
        String SQL = "select * from Usuario where login = ? and senha = ?";
        Object[] parameters = {login, senha.hashCode()};
        ArrayList<Object[]> list = DatabaseConnector.executeQuery(SQL, parameters);
        if (list.isEmpty()){
            return null;
        } else{
            Object[] row = list.get(0);
            Usuario u = new Usuario((int)row[0], (String)row[1], (Timestamp)row[2], (String)row[3], (int)row[4], (int)row[5]);
            return u;
        }
    }
}
