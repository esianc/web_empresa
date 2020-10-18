<%-- 
    Document   : marcas
    Created on : 18/10/2020, 03:12:59 PM
    Author     : Erick
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Marcas"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcas</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        
    <!-- Modal -->
        <div class="modal fade" id="modal_marcas" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
            <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">Marcas</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        <!-- Modal body-->
            <div class="modal-body">
            <div class="container">
            <form class="form-group" action="sr_marcas" method="post">
                <label for="lbl_idp" ><b>ID</b></label>
                <input class="form-control" type="text" name="txt_idm" id="txt_idm" value="0" readonly>
                <label for="lbl_puesto" ><b>Marca</b></label>
                <input class="form-control" type="text" name="txt_marca" id="txt_marca" required>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-primary">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-outline-success">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-outline-danger" onclick="javascritp:if(!confirm('¿Desea Eliminar'))return false">Eliminar</button>
            </form>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
            </div>
            </div>
            </div>
            <div class="container">
                <br>
                <br>
                <h1>Mantenimiento de Marcas</h1>
                <br>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_puesto" onclick="limpiar()" id="btn_nuevo">Nuevo</button>
                <a href="empleado.jsp" class="btn btn-success">Ir a Empleados</a>               
                <br>
                <br>
                <table class="table table-dark table-hover table-responsive">
                    <thead class="thead-responsive thead-dark">
                        <tr>
                        <th>ID</th>
                        <th>Descripcion de marca</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_marcas">
                        <%
                            Marcas marcas = new Marcas();
                            DefaultTableModel tabla = new DefaultTableModel();
                            tabla = marcas.leer();
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
                $("#modal_marcas").modal({backdrop: "static"});
                });
                });
                
                //*Limpiar todas las casillas*/
                function limpiar(){
                    $("#txt_idm").val(0);
                    $("#txt_marca").val('');
                }
                
                $('#tbl_marcas').on('click','tr td',function(){
                var target,idp,puesto;
                target = $(event.target);
                idp = target.parent("tr").find("td").eq(0).html();
                puesto = target.parent("tr").find("td").eq(1).html();
                    $("#txt_idm").val(idp);
                    $("#txt_marca").val(puesto);
                    $("#modal_marcas").modal('show');
            });
            </script>
    </body>
</html>
