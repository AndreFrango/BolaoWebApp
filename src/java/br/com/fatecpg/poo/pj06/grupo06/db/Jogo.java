package br.com.fatecpg.poo.pj06.grupo06.db;

import br.com.fatecpg.poo.pj06.grupo06.web.DatabaseConnector;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Jogo {
    private int idJogo;
    private Timestamp data;
    private String timeA;
    private Integer placarTimeA;
    private String timeB;
    private Integer placarTimeB;
    private int idRodada;

    public Jogo(int idJogo, Timestamp data, String timeA, int placarTimeA, String timeB, int placarTimeB, int idRodada) {
        this.idJogo = idJogo;
        this.data = data;
        this.timeA = timeA;
        this.placarTimeA = placarTimeA;
        this.timeB = timeB;
        this.placarTimeB = placarTimeB;
        this.idRodada = idRodada;
    }

    public int getIdJogo() {
        return idJogo;
    }

    public Timestamp getData() {
        return data;
    }

    public String getTimeA() {
        return timeA;
    }

    public int getPlacarTimeA() {
        return placarTimeA;
    }

    public String getTimeB() {
        return timeB;
    }

    public int getPlacarTimeB() {
        return placarTimeB;
    }

    public int getIdRodada() {
        return idRodada;
    }

    public void setIdJogo(int idJogo) {
        this.idJogo = idJogo;
    }

    public void setData(Timestamp data) {
        this.data = data;
    }

    public void setTimeA(String timeA) {
        this.timeA = timeA;
    }

    public void setPlacarTimeA(int placarTimeA) {
        this.placarTimeA = placarTimeA;
    }

    public void setTimeB(String timeB) {
        this.timeB = timeB;
    }

    public void setPlacarTimeB(int placarTimeB) {
        this.placarTimeB = placarTimeB;
    }

    public void setIdRodada(int idRodada) {
        this.idRodada = idRodada;
    }
    
    public static ArrayList<Jogo> getJogosList(int idRodada) throws Exception{
        ArrayList<Jogo> jogos = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.executeQuery("select * from jogo where ID_RODADA = ?", new Object[]{idRodada});
        if (list.isEmpty()){
            return null;
        } else{
            for (Object[] row:list){
                jogos.add(new Jogo((int)row[0], (Timestamp)row[1], (String)row[2], (Integer)row[3], (String)row[4], (Integer)row[5], (int)row[6]));
            }
        }
        return jogos;
    }
}
