<%-- 
    Document   : home
    Created on : 24/06/2018, 20:05:58
    Author     : Janaina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Bolão</title>
        

    </head>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <body>
        

        <div class="container-fluid text-center">    
          <div class="row content">

          <!-- Lado esquerdo -->
            <div class="col-sm-3 sidenav">
              <h3><b>Regras</b></h3>
                <div class="row">
                   <div class="thumbnail">
                        <div class="caption">
                            <p>1. É permitido palpitar apenas uma vez por partida;</p>       
                        </div>
                    </div>
                </div>
            </div>

           <!-- Centro -->
            <div class="col-sm-6 text-left"> 
              <center><h1>Bolão Copa do Mundo 2018</h1></center>   
            </div>

            <!-- Lado direito -->
            <div class="col-sm-3 sidenav">
              <h3><b>Ranking</b></h3>
              <div class="row">
                <div class="thumbnail">
                    <div class="caption">
                       <p>1. Maria</p> 
                       <p>2. José</p>  
                    </div>
                </div>
            </div>
          </div>
        </div>
    </body>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>

<%@include file="WEB-INF/jspf/login.jspf" %>

   