/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.poo.pj06.grupo06.db;

import br.com.fatecpg.poo.pj06.grupo06.web.DatabaseConnector;
import java.util.ArrayList;

/**
 *
 * @author André
 */
//package br.com.fatecpg.parking.db;

public class Rank {
    private int id;
    private String name;
    private int pontuacao;
    
        public Rank(int id, String name, int pontuacao) {
        this.id = id;
        this.name = name;
        this.pontuacao = pontuacao;

    }
    
      public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(int pontuacao) {
        this.pontuacao = pontuacao;
    } 
    
    public static ArrayList<Rank> getRank()
            throws Exception{
        String SQL ="SELECT ID_USUARIO,NOME,PONTUACAO FROM USUARIO order by pontuacao, data_cadastro";
        ArrayList<Rank> rank = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.executeQuery(SQL, new Object[]{});
        for(int i=0;i<list.size();i++){
            Object row[] =  list.get(i);
            Rank r = new Rank(
                      (int)row[0]
                    , (String) row[1]
                    , (int)row[2]);
            rank.add(r);
        }
            return rank;
        
    }

  
    
    
}
