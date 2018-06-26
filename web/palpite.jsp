<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Jogo"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Time"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Rodada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int numberOfRows = 0;
    int lastRowCells = 0;
    int idRodada = 1;
    ArrayList<Rodada> rodadas = Rodada.getRodadaList();
    ArrayList<Jogo> listaJogos = null;
    HashMap<String, String> times = Time.getTimesHashMap();
    if (request.getParameter("idRodada")!=null){
        idRodada = Integer.parseInt(request.getParameter("idRodada"));
    }
    String rodadaSelecionada = rodadas.get(idRodada-1).getDescricaoRodada();
    listaJogos = Jogo.getJogosList(idRodada);
    if(listaJogos!=null){
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
            
  <div class="row content">
 
      <!-- Centro -->
     <div class="col-sm-12 text-left"> 
      <center><h1>Palpites</h1></center>
      <br/>
   			
      <div class="row">
          <div class="col-md-3 col-sm-3"></div>
          <div class="col-md-1 col-sm-1">
           <form>
               <input type="hidden" name="idRodada" value="<%=(idRodada>1?idRodada-1:"")%>"/>
           <input class="btn" type="submit" value="<<" <%=(idRodada==1?"disabled":"") %>/>
          </div>
           </form>
           <div class="col-md-4 col sm-4"><h3 class="text-secondary text-center"><%=rodadaSelecionada%></h3></div>
           <div class="col-md-1 col-sm-1">
           <form>
               <input type="hidden" name="idRodada" value="<%=(idRodada<8?idRodada+1:"")%>"/>
                      <input class="btn" type="submit" value=">>" <%=(idRodada==8?"disabled":"") %>/>
           </form>
           </div>
           <div class="col-md-3 col-sm-3"></div>
       </div>
       <%if(numberOfRows==0){%>
       <h2 class="text-danger text-center">Os jogos desta fase ainda não foram definidos!</h2>
       <%}%>
<%for(int i=1; i<=numberOfRows; i++){%>  
    <div class="row">
    <%for (int j=1; j <= (i==numberOfRows&&lastRowCells>0?lastRowCells:4);j++){
        Jogo jogo = listaJogos.get(i*j-1);
    %>
<center>
<form>
 <div class="col-sm-3 col-md-3">
  	<div class="thumbnail">
            <h4><%=jogo.getData().toLocaleString()%></h4>
            <img src="<%=times.get(jogo.getTimeA())%>" alt="...">
            <div class="caption">
               <center><h4><%=jogo.getTimeA()%></h4>
                   <input type="number" name="placarA" <%=(jogo.getData().before(Timestamp.valueOf(LocalDateTime.now().plusHours(1)))?"disabled":"required") %>/></center>
            </div>
                <h4>X</h4>
            <img src="<%=times.get(jogo.getTimeB())%>" alt=""/>
              	<div class="caption">
                 	<center><h4><%=jogo.getTimeB()%></h4>
                        <input type="number" name="placarB" <%=(jogo.getData().before(Timestamp.valueOf(LocalDateTime.now().plusHours(1)))?"disabled":"required") %>/> <br/><br/><button type="submit" class="btn btn-sm btn-success" <%=(jogo.getData().before(Timestamp.valueOf(LocalDateTime.now().plusHours(1)))?"disabled":"") %>>Enviar Palpite</button></center>
              </div>
                        <%if(jogo.getPlacarTimeA()>=0 && jogo.getPlacarTimeB()>=0){%>
                        <h4>Resultado:<br/> <%=jogo.getTimeA()+" "+jogo.getPlacarTimeA()+ " X " + jogo.getPlacarTimeB()+" "+ jogo.getTimeB()%></h4>
                        <%}%>
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
