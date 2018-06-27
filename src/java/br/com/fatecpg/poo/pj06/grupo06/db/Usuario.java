package br.com.fatecpg.poo.pj06.grupo06.db;

import br.com.fatecpg.poo.pj06.grupo06.web.DatabaseConnector;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;

public class Usuario {
    private int id;
    private String nome;
    private Timestamp dataCadastro;
    private String login;
    private int senha;
    private int pontuacao;
    private String role;

    public Usuario(int id, String nome, Timestamp dataCadastro, String login, int senha, int pontuacao, String role) {
        this.id = id;
        this.nome = nome;
        this.dataCadastro = dataCadastro;
        this.login = login;
        this.senha = senha;
        this.pontuacao = pontuacao;
        this.role = role;
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
    
        public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    
    public static Usuario getUsuario(String login, String senha) throws Exception{
        String SQL = "select * from Usuario where login = ? and senha = ?";
        Object[] parameters = {login, senha.hashCode()};
        ArrayList<Object[]> list = DatabaseConnector.executeQuery(SQL, parameters);
        if (list.isEmpty()){
            return null;
        } else{
            Object[] row = list.get(0);
            Usuario u = new Usuario((int)row[0], (String)row[1], (Timestamp)row[2], (String)row[3], (int)row[4], (int)row[5], (String)row[6]);
            return u;
        }
    }
    
    public static ArrayList<Usuario> getUsuarios() throws Exception{
        String SQL = "SELECT * FROM USUARIO";   
        ArrayList<Usuario> usuarios = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.executeQuery(SQL, new Object[]{});
            for(int i= 0 ; i < list.size(); i ++) {
                Object row [] = list.get(i);
                Usuario u = new Usuario
                (
                         (int)row[0]
                        ,(String)row[1]
                        ,(Timestamp)row[2]
                        ,(String)row[3]
                        ,(int)row[4]
                        ,(int)row[5]
                        ,(String)row[6] 
                );
                
               usuarios.add(u);
            }
        return usuarios;
    }
    
    
    public static Usuario validarUsuario(String login, String senha) throws Exception{
        String Query = "SELECT * FROM Usuario WHERE login = ? AND senha = ?";
        ArrayList<Object[]> list = DatabaseConnector.executeQuery(Query, new Object[]{login, senha.hashCode()});
        if(list.size()>0){
            Object[] row = list.get(0);
            Usuario u = new Usuario((int)row[0], (String)row[1], (Timestamp)row[2], (String)row[3], (int)row[4], (int)row[5], (String)row[6]);
            return u;
        }else{
            return null;
        }
    }
    
     public static void addUsuario(String nome, Timestamp data, String login, int senha, int pontuacao, String role) throws Exception{
        String SQL = "INSERT INTO USUARIO VALUES("
                + "default"
                + ",  ?"
                + ",  ?"
                + ",  ?"
                + ",  ?"
                + ",  ?"
                + ",  ?"
                + ")";
        Object parameters[] = {nome, data, login, senha, pontuacao, role};
        DatabaseConnector.executeCommand(SQL, parameters);
    }
    
     public static void removeUsuario(int id) throws Exception{
        String SQL = "DELETE FROM USUARIO WHERE ID_USUARIO = ? " ;              
        Object parameters[] = {id};
        DatabaseConnector.executeCommand(SQL, parameters);
    
    }

     
    public static void alteraUsuario(int id, String role) throws Exception{
        DatabaseConnector.executeCommand(
                "update usuario set role=?, where id_usuario=?", 
                new Object[]{id, role});
    }
    

    public static Usuario getUsuarioPorId(int idUsuario) throws Exception{
        String SQL = "select * from Usuario where ID_USUARIO=?";
        Object[] parameters = {idUsuario};
        ArrayList<Object[]> list = DatabaseConnector.executeQuery(SQL, parameters);
        if (list.isEmpty()){
            return null;
        } else{
            Object[] row = list.get(0);
            Usuario u = new Usuario((int)row[0], (String)row[1], (Timestamp)row[2], (String)row[3], (int)row[4], (int)row[5], (String)row[6]);
            return u;
        }
    }
    public static void updatePontuacao(int idUsuario, int pontos) throws Exception{
        DatabaseConnector.executeCommand("update usuario set pontuacao=? where id_usuario=?", new Object[]{pontos, idUsuario});
    }

}

