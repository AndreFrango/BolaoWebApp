<%-- 
    Document   : cjogos
    Created on : 26/06/2018, 16:02:37
    Author     : André
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Jogo"%>

<%
   String[] times = {"Alemanha","Arábia Saudita","Argentina","Austrália","Bélgica","Brasil","Colômbia","Coréia do Sul"
   ,"Costa Rica","Croácia","Dinamarca","Egito","Espanha","França", "Inglaterra","Irã","Islândia","Japão","Marrocos"
   ,"México","Nigéria", "Panamá","Peru","Polônia","Portugal","Rússia","Senegal","Sérvia","Suécia","Suiça","Tunísia","Uruguai"};
   
   String error = null;
   int idRodada=1;
   if(request.getParameter("formIdrod")!= null){ 
    //idRod = (request.getParameter("idrod")); 
    idRodada=Integer.parseInt(request.getParameter("idrod"));
    //response.sendRedirect(request.getRequestURI());
    
}    
   HashMap<Integer,Integer> numeroJogosRodada = new HashMap(8);
   numeroJogosRodada.put(1, 16);
   numeroJogosRodada.put(2, 16);
   numeroJogosRodada.put(3, 16);
   numeroJogosRodada.put(4, 8);
   numeroJogosRodada.put(5, 4);
   numeroJogosRodada.put(6, 2);
   numeroJogosRodada.put(7, 1);
   numeroJogosRodada.put(8, 1);
if(request.getParameter("formNewJogos")!=null){
    idRodada=Integer.parseInt(request.getParameter("idRodada"));
    try{
            //String sid[] = request.getParameterValues("idj");
            String stimea[] = request.getParameterValues("timea");
            String stimeb[] = request.getParameterValues("timeb");
            String sdata[] = request.getParameterValues("data");
            String shora[] = request.getParameterValues("hora");
            
            //Gambis
            /*int cont = sid.length;
            int[] transfer = new int[cont];            
            for(int j=0;j<sid.length;j++){
                transfer[j] =Integer.valueOf(sid[j]);
            }*/
            
           for(int i=0;i<stimea.length;i++){
               String dataHora = sdata[i]+" "+shora[i]+":00";
               //System.out.println(dataHora);
               Timestamp ts = Timestamp.valueOf(dataHora);
               
             Jogo.addJogos(ts, stimea[i],-1,stimeb[i] ,-1,idRodada);
           }
           // long id = Long.parseLong(request.getParameter("id"));
            //String model = request.getParameter("model");
            //String plate = request.getParameter("plate");
            //Period.addPeriod(model, plate);
            
            //response.sendRedirect("teste.jsp");
          //response.sendRedirect(request.getRequestURI());
        } catch(Exception e){
            error = e.getMessage();
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Jogos</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <%if(session.getAttribute("me.login")==null){%>
    <center><h2>Efetue o login</h2></center>
        
    <% } else {%>
    <center><h2>Cadastro de Jogos</h2></center>
    <br/>
    <hr/>
    <form method="post">
        <fieldset>
            <legend>Escolha a rodada</legend>
            <select name="idrod">
                <option  value="1">1</option>  
                <option  value="2">2</option>  
                <option  value="3">3</option>  
                <option  value="4">4</option>  
                <option  value="5">5</option>  
                <option  value="6">6</option>  
                <option  value="7">7</option>  
                <option  value="8">8</option>  
            </select>            
        </fieldset>
        <input type="submit" name="formIdrod" value="Escolher"/>
    </form>
    <FORM METHOD="POST">
    <center><table border="1">
        <tr>
            <th>Time A</th><th>Time B</th><th>Data</th>            
        </tr>
        
        <%for(int i = 0;i<numeroJogosRodada.get(idRodada);i++){%>
            <tr>
              <td>
            <select name="timea">
                <%for(int j = 0;j<32;j  ++){%> 
                        <option value="<%=times[j]%>"><%=times[j]%></option>     
                         <%}%>                         
                </select>
              </td>
              <td>
             <select name="timeb">
                <%for(int j = 0;j<32;j  ++){%> 
                        <option value="<%=times[j]%>"><%=times[j]%></option>     
                         <%}%>
                </select>
                 </td>
             <td><INPUT TYPE="date" NAME="data"/><input type="time" name="hora"/></td>
        </tr>
            <%}%>
    </table>
    <input type="hidden" name="idRodada" value="<%=idRodada%>"   />
    <input type="submit" name="formNewJogos" value="Adicionar"/>
    </center>
    </form>
            <%}%> <!--//else-->
    
        
    <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>