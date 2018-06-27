<%-- 
    Document   : cjogos
    Created on : 26/06/2018, 16:02:37
    Author     : André
--%>

<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Jogo"%>

<%
   String[] times = {"Alemanha","Arábia Saudita","Argentina","Austrália","Bélgica","Brasil","Colômbia","Coréia do Sul"
   ,"Costa Rica","Croácia","Dinamarca","Egito","Espanha","França", "Inglaterra","Irã","Islândia","Japão","Marrocos"
   ,"México","Nigéria", "Panamá","Peru","Polônia","Portugal","Rússia","Senegal","Sérvia","Suécia","Suiça","Tunísia","Uruguai"};
   

//ArrayList<Integer> transfer = new ArrayList<Integer>();
   String error = null;
   //String result = "";
if(request.getParameter("formNewJogos")!=null){
        try{
            String sid[] = request.getParameterValues("idj");
            String stimea[] = request.getParameterValues("timea");
            String stimeb[] = request.getParameterValues("timeb");
            String sdata[] = request.getParameterValues("data");
            
            //Gambis
            int cont = sid.length;
            int[] transfer = new int[cont];            
            for(int j=0;j<sid.length;j++){
                transfer[j]= Integer.parseInt(sid[j]);
            }
            
           for(int i=0;i<sid.length;i++){
             Jogo.addJogos(transfer[i], sdata[i], stimea[i],-1,stimeb[i] ,-1,4);
           }
           // long id = Long.parseLong(request.getParameter("id"));
            //String model = request.getParameter("model");
            //String plate = request.getParameter("plate");
            //Period.addPeriod(model, plate);
            
            response.sendRedirect("teste.jsp");
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
    <FORM METHOD="POST">
    <center><table border="1">
        <tr>
            <th>N° JOGO</th><th>Time A</th><th>Time B</th><th>Data</th>            
        </tr>
        
            <%for(int i = 49;i<=56;i++){%>
            <tr>
            <td><INPUT TYPE="text" NAME="idj" value="<%= i%>" disabled></td>
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
             <td><INPUT TYPE="text" NAME="data"></td>
        </tr>
            <%}%>
    </table>
        <input type="submit" name="formNewJogos" value="Adicionar"/>
    </center>>
            <%}%> <!--//else-->
    </form>
        
    <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
