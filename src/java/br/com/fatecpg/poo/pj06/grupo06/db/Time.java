package br.com.fatecpg.poo.pj06.grupo06.db;

import br.com.fatecpg.poo.pj06.grupo06.web.DatabaseConnector;
import java.util.ArrayList;
import java.util.HashMap;

public class Time {
    public static HashMap<String, String> getTimesHashMap() throws Exception{
        HashMap<String,String> times = new HashMap<>(32);
        ArrayList<Object[]> list = DatabaseConnector.executeQuery("select * from time", new Object[]{});
        
        for(Object[] row: list){
            times.put((String)row[0], (String)row[1]);
        }
        
        return times;
    }
}
