package br.com.fatecpg.poo.pj06.grupo06.db;

import br.com.fatecpg.poo.pj06.grupo06.web.DatabaseConnector;
import java.util.ArrayList;

public class Palpite {
    private int idUsuario;
    private int idJogo;
    private int palpiteTimeA;
    private int palpiteTimeB;
    private int pontos;

    public Palpite(int idUsuario, int idJogo, int palpiteTimeA, int palpiteTimeB, int pontos) {
        this.idUsuario = idUsuario;
        this.idJogo = idJogo;
        this.palpiteTimeA = palpiteTimeA;
        this.palpiteTimeB = palpiteTimeB;
        this.pontos = pontos;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdJogo() {
        return idJogo;
    }

    public void setIdJogo(int idJogo) {
        this.idJogo = idJogo;
    }

    public int getPalpiteTimeA() {
        return palpiteTimeA;
    }

    public void setPalpiteTimeA(int palpiteTimeA) {
        this.palpiteTimeA = palpiteTimeA;
    }

    public int getPalpiteTimeB() {
        return palpiteTimeB;
    }

    public void setPalpiteTimeB(int palpiteTimeB) {
        this.palpiteTimeB = palpiteTimeB;
    }

    public int getPontos() {
        return pontos;
    }

    public void setPontos(int pontos) {
        this.pontos = pontos;
    }
    
    public static Palpite getPalpite(int idUsuario, int idJogo) throws Exception{
        ArrayList<Object[]> list = DatabaseConnector.executeQuery("select * from palpite where ID_USUARIO=? and ID_JOGO=?", new Object[]{idUsuario, idJogo});
        if (list.isEmpty()){
            return null;
        } else{
            Object[] row=list.get(0);
            Palpite p = new Palpite((int)row[0], (int)row[1], (int)row[2], (int)row[3], (int)row[4]);
            return p;
        }
    }
    
    public static void insertPalpite(int idUsuario, int idJogo, int palpiteTimeA, int palpiteTimeB, int pontos) throws Exception{
        DatabaseConnector.executeCommand("insert into palpite values (?,?,?,?,?)", new Object[]{idUsuario, idJogo, palpiteTimeA, palpiteTimeB, pontos});
    }
    
    public static void updatePalpite(int idUsuario, int idJogo, int palpiteTimeA, int palpiteTimeB) throws Exception{
        DatabaseConnector.executeCommand("update palpite set PALPITE_TIME_A=?, PALPITE_TIME_B=? where id_usuario=? and id_jogo=?", new Object[]{palpiteTimeA, palpiteTimeB, idUsuario, idJogo});
    }
    
    public static void atualizarPontos(int idUsuario, int idJogo, int pontos) throws Exception{
        //Utilizar este método ao inserir o placar na parte de admin
        DatabaseConnector.executeCommand("update palpite set pontos=? where id_usuario=? and id_jogo=?", new Object[]{pontos, idUsuario, idJogo});
    }
    
}
