<%-- 
    Document   : puestos
    Created on : 10/10/2020, 08:17:34 PM
    Author     : Erick
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Proveedores"%>
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
        <div class="modal fade" id="modal_proveedores" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
            <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">Proveedores</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        <!-- Modal body-->
            <div class="modal-body">
            <div class="container">
            <form class="form-group" action="sr_proveedores" method="post">
                <label for="lbl_idprov" ><b>ID</b></label>
                <input class="form-control" type="text" name="txt_idprov" id="txt_idprov" value="0" readonly>
                <label for="lbl_nit" ><b>NIT</b></label>
                <input class="form-control" type="text" name="txt_nit" id="txt_nit" required>
                <label for="lbl_proveedor" ><b>Razon Social</b></label>
                <input class="form-control" type="text" name="txt_proveedor" id="txt_proveedor" required>
                <label for="lbl_direccion" ><b>Dirección</b></label>
                <input class="form-control" type="text" name="txt_direccion" id="txt_direccion" required>
                <label for="lbl_telefono" ><b>Teléfono</b></label>
                <input class="form-control" type="text" name="txt_telefono" id="txt_telefono" required>
                
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
                <h1>Mantenimiento de Proveedores</h1>
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
                        <th>NIT</th>
                        <th>Nombre</th>
                        <th>Direccion</th>
                        <th>Teléfono</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_puestos">
                        <%
                            Proveedores prove = new Proveedores();
                            DefaultTableModel tabla = new DefaultTableModel();
                            tabla = prove.leer();
                            for (int t=0; t<tabla.getRowCount();t++){
                                out.println("<tr>");
                                out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
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
                $("#modal_proveedores").modal({backdrop: "static"});
                });
                });
                
                //*Limpiar todas las casillas*/
                function limpiar(){
                    $("#txt_idprov").val(0);
                    $("#txt_nit").val('');
                    $("#txt_proveedor").val('');
                    $("#txt_direccion").val('');
                    $("#txt_telefono").val('');
                    
                }
                
                $('#tbl_puestos').on('click','tr td',function(evt){
                var target,id,nit,proveedor,direccion,telefono;
                target = $(event.target);
                id = target.parent("tr").find("td").eq(0).html();
                nit = target.parent("tr").find("td").eq(1).html();
                proveedor = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                    $("#txt_idprov").val(id);
                    $("#txt_nit").val(nit);
                    $("#txt_proveedor").val(proveedor);
                    $("#txt_direccion").val(direccion);
                    $("#txt_telefono").val(telefono);
                    $("#modal_puesto").modal('show');
            });
            </script>
    </body>
</html>
