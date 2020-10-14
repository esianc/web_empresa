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
        <br>
        <!-- Modal -->
        <div class="modal fade" id="modal_puesto" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
            <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">Static Backdrop</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        <!-- Modal body-->
            <div class="modal-body">
            <div class="container">
            <h1>Puestos</h1>
            <form class="form-group" action="sr_puesto" method="post">
                <label for="lbl_idp" ><b>ID</b></label>
                <input class="form-control" type="text" name="txt_idp" id="txt_idp" value="0" readonly>
                <label for="lbl_puesto" ><b>Puesto</b></label>
                <input class="form-control" type="text" name="txt_puesto" id="txt_puesto" required>
            </form>
            </div>
            </div>
            <div class="modal-footer">
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-info">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-outline-info">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-outline-danger" onclick="javascritp:if(!confirm('¿Desea Eliminar'))return false">Eliminar</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
            </div>
            </div>
            </div>
            <div class="container">
                <br>
                <h1>Puestos</h1>
                <br>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_puesto" onclick="limpiar()" id="btn_nuevo">Nuevo</button>
                <a href="empleado.jsp" class="btn btn-success">Ir a Empleados</a>
                <a href="menu.jsp" class="btn btn-success">Menu</a>
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
