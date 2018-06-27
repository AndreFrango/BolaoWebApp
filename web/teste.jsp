<%-- 
    Document   : teste
    Created on : 27/06/2018, 00:41:53
    Author     : André
--%>

<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Jogo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   String error = null;
    if(request.getParameter("formDeleteJogo")!= null){
     try{
         int id = Integer.parseInt(request.getParameter("id"));
         Jogo.removeJogo(id);
         response.sendRedirect(request.getRequestURI());
     }
     catch(Exception e){   
        error = e.getMessage();
    }
        
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enviado -Editar</title>
    </head>
     <body>
     <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
     <%if(session.getAttribute("me.login")==null){%>
    <center><h2>Efetue o login</h2></center> <!-- Corrigir-->
        <%}else{%>       
       <center><table border="1">
        <tr>
            <th>Rodada</th><th>N° JOGO</th><th>Time A</th><th>Time B</th><th>Data</th>            
        </tr>
        <% for (Jogo j: Jogo.getJogos()) {%>
                <tr>   
                    
                    <td><%=j.getIdRodada() %></td>
                    <td><%=j.getIdJogo() %></td>
                    <td><%=j.getTimeA() %></td>
                     <td><%=j.getTimeB()%></td>
                     <td><%=j.getData() %></td>
                     
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=j.getIdJogo() %>" />
                            <input type="submit" name="formDeleteJogo" value="Excluir" />
                            
                        </form>
                    </td>
                </tr>
            <% } %>
        </table></center>
    </body>
</html>
