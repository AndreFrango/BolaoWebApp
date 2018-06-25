<%-- 
    Document   : palpite
    Created on : 24/06/2018, 22:53:10
    Author     : janaina
--%>

<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Jogo"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Time"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Rodada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int numberOfRows = 0;
    int lastRowCells = 0;
    ArrayList<Rodada> rodadas = Rodada.getRodadaList();
    String rodadaSelecionada="Escolha uma rodada nos botões acima";
    ArrayList<Jogo> listaJogos = null;
    HashMap<String, String> times = Time.getTimesHashMap();
    if (request.getParameter("descricaoRodada")!=null){
        rodadaSelecionada = request.getParameter("descricaoRodada");
        listaJogos = Jogo.getJogosList(Integer.parseInt(request.getParameter("idRodada")));
        numberOfRows = listaJogos.size()/4;
        lastRowCells = listaJogos.size()%4;
        if(lastRowCells>0){
            numberOfRows++;
        }
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Palpites</title>
    </head>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <body>
       
        <div class="container-fluid text-center"> 
            <div name="rodadas">
                
                <%for(Rodada r:rodadas){%>
                    <form>
                        <input type="hidden" name="idRodada" value="<%=r.getId()%>"/>
                        <input class="btn btn-primary" type="submit" name="descricaoRodada" value="<%=r.getDescricaoRodada()%>"/>
                    </form>
                <%}%>
                
            </div>
  <div class="row content">
 
      <!-- Centro -->
     <div class="col-sm-12 text-left"> 
      <center><h1>Palpites</h1></center>
      <br/>
   			
       <center><p><%=rodadaSelecionada%></p></center>
       
<%for(int i=1; i<=numberOfRows; i++){%>  
    <div class="row">
    <%for (int j=1; j <= (i==numberOfRows&&lastRowCells>0?lastRowCells:4);j++){%>
<center>
<form>
 <div class="col-sm-3 col-md-3">
     <h5><%=listaJogos.get(i*j-1).getData().toLocaleString()%></h5>
  	<div class="thumbnail">
            <img src="<%=times.get(listaJogos.get(i*j-1).getTimeA())%>" alt="...">
            <div class="caption">
               <center><h4><%=listaJogos.get(i*j-1).getTimeA()%></h4>
                 <input type="number" name="placarA"/></center>
            </div>
                <h4>X</h4>
            <img src="<%=times.get(listaJogos.get(i*j-1).getTimeB())%>" alt=""/>
              	<div class="caption">
                 	<center><h4><%=listaJogos.get(i*j-1).getTimeB()%></h4>
                        <input type="number" name="placarB"/> <br/><br/><button type="submit" class="btn btn-sm btn-success">Enviar Palpite</button></center>
              </div>
  	</div>
</div>
</form>
</center>
<%}%>

</div> <!--row-->
<%}%>
     </div></div></div>

</body>
<%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
<%@include file="WEB-INF/jspf/login.jspf" %>
