package br.com.fatecpg.poo.pj06.grupo06.db;

import br.com.fatecpg.poo.pj06.grupo06.web.DatabaseConnector;
import java.util.ArrayList;

public class Rodada {
    private int id;
    private String descricaoRodada;

    public Rodada(int id, String descricaoRodada) {
        this.id = id;
        this.descricaoRodada = descricaoRodada;
    }
    
    public int getId() {
        return id;
    }

    public String getDescricaoRodada() {
        return descricaoRodada;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDescricaoRodada(String descricaoRodada) {
        this.descricaoRodada = descricaoRodada;
    }
    
    public static ArrayList<Rodada> getRodadaList() throws Exception{
        ArrayList<Rodada> rodadas = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.executeQuery("select * from rodada", new Object[]{});
        
        for(Object[] row: list){
            rodadas.add(new Rodada((int)row[0], (String)row[1]));
        }
        
        return rodadas;
    }
}
