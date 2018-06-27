<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Palpite"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Jogo"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Time"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.poo.pj06.grupo06.db.Rodada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("subResultado")!=null){
        Jogo.updatePlacar(Integer.parseInt(request.getParameter("idJogo")), Integer.parseInt(request.getParameter("placarA")), Integer.parseInt(request.getParameter("placarB")));
    }
    int numberOfRows = 0;
    int lastRowCells = 0;
    int idRodada = 1;
    int idUsuario = 0;
    if(session.getAttribute("me.id")!=null){
        idUsuario= (int)session.getAttribute("me.id");
    }
    ArrayList<Rodada> rodadas = Rodada.getRodadaList();
    ArrayList<Jogo> listaJogos = null;
    HashMap<String, String> times = Time.getTimesHashMap();
    //HashMap<Integer, Palpite> palpitesUsuario = new HashMap();
    if (request.getParameter("idRodada")!=null){
        idRodada = Integer.parseInt(request.getParameter("idRodada"));
    }
    String rodadaSelecionada = rodadas.get(idRodada-1).getDescricaoRodada();
    listaJogos = Jogo.getJogosList(idRodada);
    
    
    if(listaJogos!=null && idUsuario>0){
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
        <title>JSP Page</title>
    </head>
    <body>
        <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lançar resultados</title>
    </head>
    
    <body>
       <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <div class="container-fluid text-center"> 
            <%if(session.getAttribute("me.login")!=null){%>
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
<%for(int i=0; i<numberOfRows; i++){%>  
    <div class="row">
    <%for (int j=0; j < (i==numberOfRows-1&&lastRowCells>0?lastRowCells:4);j++){
        Jogo jogo = listaJogos.get(i*4+j);
    %>
<center>
<form>
 <div class="col-sm-3 col-md-3">
  	<div class="thumbnail">
            <input type="hidden" name="idRodada" value="<%=idRodada%>"/>
            <input type="hidden" name="idJogo" value="<%=jogo.getIdJogo()%>"/>
            <h4><%=jogo.getData().toLocaleString()%></h4>
            <img src="<%=times.get(jogo.getTimeA())%>" alt="...">
            <div class="caption">
               <center><h4><%=jogo.getTimeA()%></h4>
                   <input type="number" name="placarA" min="0" step="1" value='<%=jogo.getPlacarTimeA()>-1?jogo.getPlacarTimeA():""%>' /></center>
            </div>
                <h4>X</h4>
            <img src="<%=times.get(jogo.getTimeB())%>" alt=""/>
              	<div class="caption">
                 	<center><h4><%=jogo.getTimeB()%></h4>
                        <input type="number" name="placarB" min="0" step="1" value="<%=jogo.getPlacarTimeB()>-1?jogo.getPlacarTimeB():""%>" /> <br/><br/><button type="submit" name="subResultado" class="btn btn-sm btn-success" >Enviar Resultado</button></center>
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
     </div></div>
        <%}else{%>
        <h2 class="text-danger">Efetue o login para palpitar</h2>
        <%}%>
        </div>

</body>
    </body>
</html>
