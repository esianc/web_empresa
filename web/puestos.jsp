<%-- 
    Document   : puestos
    Created on : 10/10/2020, 08:17:34 PM
    Author     : Erick
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Puestos"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
         <!-- Barra -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Empleados</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="empleado.jsp">Empleados</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="puestos.jsp">Puestos</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Clientes</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    </div>
                </li>
                </ul>
            </div>
        </nav>
        <br>
        <!-- Modal -->
        <div class="modal fade" id="modal_puesto" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
            <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">Puestos</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        <!-- Modal body-->
            <div class="modal-body">
            <div class="container">
            <form class="form-group" action="sr_puesto" method="post">
                <label for="lbl_idp" ><b>ID</b></label>
                <input class="form-control" type="text" name="txt_idp" id="txt_idp" value="0" readonly>
                <label for="lbl_puesto" ><b>Puesto</b></label>
                <input class="form-control" type="text" name="txt_puesto" id="txt_puesto" required>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-primary">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-outline-success">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-outline-danger" onclick="javascritp:if(!confirm('¿Desea Eliminar'))return false">Eliminar</button>
            </form>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
            </div>
            </div>
            </div>
            <div class="container">
                <br>
                <br>
                <h1>Mantenimiento de Puestos</h1>
                <br>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_puesto" onclick="limpiar()" id="btn_nuevo">Nuevo</button>
                <a href="empleado.jsp" class="btn btn-success">Ir a Empleados</a>
                <a href="login.jsp" class="btn btn-outline-danger">Salir</a>
                <br>
                <br>
                <table class="table table-dark table-hover table-responsive">
                    <thead class="thead-responsive thead-dark">
                        <tr>
                        <th>ID</th>
                        <th>Descripcion del puesto</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_puestos">
                        <%
                            Puestos puestos = new Puestos();
                            DefaultTableModel tabla = new DefaultTableModel();
                            tabla = puestos.leer();
                            for (int t=0; t<tabla.getRowCount();t++){
                                out.println("<tr>");
                                out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                                out.println("</tr>");
                            }
                        %>
                    </tbody>
            </table>
            </div>
            <script type="text/javascript">
                
            /*para que el modal no se cierre al dar clic afuera*/
                $(document).ready(function(){
                $("#btn_nuevo").click(function(){
                $("#modal_puesto").modal({backdrop: "static"});
                });
                });
                
                //*Limpiar todas las casillas*/
                function limpiar(){
                    $("#txt_idp").val(0);
                    $("#txt_puesto").val('');
                }
                
                $('#tbl_puestos').on('click','tr td',function(evt){
                var target,idp,puesto;
                target = $(event.target);
                idp = target.parent("tr").find("td").eq(0).html();
                puesto = target.parent("tr").find("td").eq(1).html();
                    $("#txt_idp").val(idp);
                    $("#txt_puesto").val(puesto);
                    $("#modal_puesto").modal('show');
            });
            </script>
    </body>
</html>
