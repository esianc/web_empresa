<%-- 
    Document   : login
    Created on : 7/10/2020, 06:49:42 PM
    Author     : Erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Empresa</title>
    </head>
    <%  String r="";
        if (request.getParameter("r")!=null){
            int re = Integer.parseInt(request.getParameter("r"));
            if (re==0){
                r="Datos incorrectos";
            }
        }
    %>    
    <body>
        <div class="container mt-5" style="width:400px">
            <form class="form-group" action="sr_login" method="post">
            <h1 align="center">Login Empresa</h1>
            <br>
            <input class="form-control" type="text" name="txt_usuario" id="txt_usuario" placeholder="Ingrese usuario"><br>
            <input class="form-control" type="password" name="txt_pass" id="pass" placeholder="Ingrese contraseña"><br>
            <br>
            <button name="btn_login" id="btn_login" value="" class="btn btn-primary btn-block" >Login</button>
            <p style="color: red;"><%=r %></p>
            </form>
        </div>
        
    </body>
</html>
