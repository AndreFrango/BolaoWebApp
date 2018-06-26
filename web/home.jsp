<%-- 
    Document   : home
    Created on : 24/06/2018, 20:05:58
    Author     : Janaina
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Rank"%>
<%
    ArrayList<Rank> r = Rank.getRank();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Bolão</title>
    </head>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
    <%if(session.getAttribute("me.login")==null){%>
    <center><h2>Efetue o login</h2></center>
        <%}else{%>
    <body>
        <div class="container-fluid text-center">    
          <div class="row content">

          <!-- Lado esquerdo -->
            <div class="col-sm-3 sidenav">
              <h3><b>Regras</b></h3>
                <div class="row">
                   <div class="thumbnail">
                        <div class="caption text-left">
                            <p>1. Os palpites podem ser lançados até uma hora antes do início da partida;</p>       
                            <p>2. Pontuação:</p>       
                            <p>   Acertar o vencedor da partida/empate: 10 pontos</p>       
                            <p>   Vencedor + placar de um dos times: 15 pontos</p>       
                            <p>   Placar exato: 20 pontos</p>       
                            <p>   Exemplo: Resultado: 2 x 1</p>       
                            <p>   Palpite 1: 2 x 1 - 20 pontos</p>       
                            <p>   Palpite 2: 2 x 0 - 15 pontos</p>       
                            <p>   Palpite 3: 3 x 1 - 15 pontos</p>       
                            <p>   Palpite 4: 0 x 1 -  0 pontos</p>       
                            <p>   Palpite 5: 0 x 0 -  0 pontos</p>   
                            <p>3. Em caso de empate na pontuação, é utilizada a data de cadastro como critério de desempate.</p>   
                            
                        </div>
                    </div>
                </div>
            </div>

           <!-- Centro -->
            <div class="col-sm-6 text-left"> 
               
                        
              <center>
                  <h1><b>Seja bem vindo(a), <%=session.getAttribute("me.nome")%>!</b></h1>
                  <h2>Bolão Copa do Mundo 2018</h2>
              </center>   
            </div>

            <!-- Lado direito -->
            <div class="col-sm-3 sidenav">
              <h3><b>Ranking</b></h3>
              <div class="row">
                <div class="thumbnail">
                    <div class="caption">
                        <table class="table table-striped">
                            <tr><th>#</th><th>Nome</th><th>Pontos</th></tr>
                        <%for(int i=0; i<r.size(); i++){%>
                            <tr><td><%=i+1%></td><td><%=r.get(i).getName()%></td><td><%=r.get(i).getPontuacao()%></td></tr>
                       <%}%>
                        </table>
                    </div>
                </div>
            </div>
          </div>
        </div>
    </body>
<%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
 <%}%>

   