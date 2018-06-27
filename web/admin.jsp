<%-- 
    Document   : admin
    Created on : 24/06/2018, 22:53:45
    Author     : janaina
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Área Administrativa</title>
    </head>
      <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
     <%if(session.getAttribute("me.login")==null){%>
    <center><h2>Efetue o login</h2></center> <!-- Corrigir-->
        <%}else{%>
    <body>
        <center>
            
            <h1>Bolão Copa do Mundo 2018</h1>
       	
          <button type="button" class="btn btn-success btn-lg">Cadastro de Jogos</button>
          
          <button type="button" class="btn btn-success btn-lg">Cadastro de Placar</button>
          
          <button type="button" class="btn btn-success btn-lg"><a style="text-decoration: none" href="usuarios.jsp">Cadastro de Usuários</a></button>
        
        </center>
    </body>
     <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
<%}%>

 