<%-- 
    Document   : palpite
    Created on : 24/06/2018, 22:53:10
    Author     : janaina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
   			
       <center><p>Fase de Grupos - Rodada 1 de 3 </p></center>
       

  
<div class="row">
<center>
<form>
 <div class="col-sm-3 col-md-3">
  	<div class="thumbnail">
  		<img src="img/russia.png" alt="...">
            <div class="caption">
               <center><h4>Rússia</h4>
                 <input type="number" name="placarA"/> <!--<button type="submit" class="btn btn-sm btn-success">OK</button>--></center>
            </div>
               <br/>
            <img src="img/arabia-saudita.png" alt=""/>
              	<div class="caption">
                 	<center><h4>Arábia Saudita</h4>
                        <input type="number" name="placarB"/> <br/><br/><button type="submit" class="btn btn-sm btn-success">Enviar Palpite</button></center>
              </div>
  	</div>
</div>
</form>
</center>

<center>
<form>
 <div class="col-sm-3 col-md-3">
  	<div class="thumbnail">
            <img src="img/egito.png" alt=""/>
              <div class="caption">
                <center><h4>Egito</h4> <!--<button type="submit" class="btn btn-sm btn-success">OK</button>--></center>
                 <input type="number" name="placarA"/>
              </div>
               <br/>
            <img src="img/uruguai.png" alt="...">
              	<div class="caption">
               <center><h4>Uruguai</h4>
                 <input type="number" name="placarB"/> <br/><br/><button type="submit" class="btn btn-sm btn-success">Enviar Palpite</button></center>
              </div>
  	</div>
    
</div>
</form>
</center>
    
<center>
<form>
 <div class="col-sm-3 col-md-3">
  	<div class="thumbnail">
            <img src="img/marrocos.png" alt=""/>
              <div class="caption">
                <center><h4>Marrocos</h4> <!--<button type="submit" class="btn btn-sm btn-success">OK</button>--></center>
                 <input type="number" name="placarA"/>
              </div>
               <br/>
            <img src="img/irã.png" alt="...">
              	<div class="caption">
               <center><h4>Irã</h4>
                 <input type="number" name="placarB"/> <br/><br/><button type="submit" class="btn btn-sm btn-success">Enviar Palpite</button></center>
              </div>
  	</div>
    
</div>
</form>
</center>
    
<center>
<form>
 <div class="col-sm-3 col-md-3">
  	<div class="thumbnail">
            <img src="img/portugal.png" alt=""/>
              <div class="caption">
                <center><h4>Portugal</h4> <!--<button type="submit" class="btn btn-sm btn-success">OK</button>--></center>
                 <input type="number" name="placarA"/>
              </div>
               <br/>
            <img src="img/espanha.png" alt="...">
              	<div class="caption">
               <center><h4>Espanha</h4>
                 <input type="number" name="placarB"/> <br/><br/><button type="submit" class="btn btn-sm btn-success">Enviar Palpite</button></center>
              </div>
  	</div>
    
</div>
</form>
</center>
    
    
    
    
    
    
    
    
    
</div> <!--row-->
     

</body>
<%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
<%@include file="WEB-INF/jspf/login.jspf" %>
