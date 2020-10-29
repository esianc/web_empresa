<%-- 
    Document   : empleado
    Created on : 9/10/2020, 02:00:57 PM
    Author     : Erick
--%>

<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Clientes"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- Barra -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="drop_empl" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Empleados</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="empleado.jsp">Empleados</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="puestos.jsp">Puestos</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="drop_cli" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ventas</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="clientes.jsp">Clientes</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="drop_comp" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Compras</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="proveedores.jsp">Proveedores</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="drop_merca" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Mercaderias</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="marcas.jsp">Marcas</a>
                        <a class="dropdown-item" href="productos.jsp">Productos</a>
                    </div>
                </li>
                </ul>
            </div>
        </nav>
        <br>
        <!-- Modal -->
        <div class="modal fade" id="modal_clientes" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
        <div class="modal-header">
        <h4 class="modal-title">Clientes</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <div class="container">
        <form class="form-group" action="sr_clientes" method="post">
                <label for="lbl_id" ><b>ID</b></label>
                <input class="form-control" type="text" name="txt_id" id="txt_id" value="0" readonly>
                <label for="lbl_nombres" ><b>Nombres</b></label>
                <input class="form-control" type="text" name="txt_nombres" id="txt_nombres" required>
                <label for="lbl_apellidos" ><b>Apellidos</b></label>
                <input class="form-control" type="text" name="txt_apellidos" id="txt_apellidos" required>
                <label for="lbl_nit" ><b>NIT</b></label>
                <input class="form-control" type="text" name="txt_nit" id="txt_nit" required>
                <label for="lbl_genero" ><b>Genero</b></label>
                <select class="form-control" name="drop_genero" id="drop_genero" required>
                    <option value="0">Masculino</option>
                    <option value="1">Femenino</option>  
                </select>
                <label for="lbl_telefono"><b>Teléfono</b></label>
                <input class="form-control" type="text" name="txt_telefono" id="txt_telefono" required>
                <label for="lbl_correoe"><b>Correo Electrónico</b></label>
                <input class="form-control" type="text" name="txt_correoe" id="txt_correoe" required>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-primary">Agregar</button>
                <button type="button" class="btn btn-outline-success" id="btn_modificar">Modificar</button>
                <button type="button" class="btn btn-outline-danger" id="btn_eliminar">Eliminar</button>
                <br>
                <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                </div>
        </form>
        </div>
        </div>
        </div>
        </div>
        </div>
        
        <br>
            <div class="container">
            <br>
            <h1>Clientes</h1>
            <br>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_clientes" onclick="limpiar()" id="btn_nuevo">Nuevo</button>
            <br>
            <br>
            <table class="table table-dark table-hover table-responsive">
                <thead class="thead-responsive thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Nit</th>
                        <th>Genero</th>
                        <th>Telefono</th>
                        <th>E-mail</th>
                        <th>Fecha Ingreso</th>
                    </tr>
                </thead>
                <tbody id="tbl_clientes">
                    <%
                        Clientes cli = new Clientes();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = cli.leer();
                        for (int t=0; t<tabla.getRowCount();t++){
                            out.println("<tr>");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
        <script type="text/javascript">
            
            //*Limpiar todas las casillas*/
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_nombres").val('');
                $("#txt_apellidos").val('');
                $("#txt_nit").val('');
                $("#drop_genero").val('');
                $("#txt_telefono").val('');
                $("#txt_correoe").val('');

            }
            
            /*para que el modal no se cierre al dar clic afuera*/
            $(document).ready(function(){
                $("#btn_nuevo").click(function(){
                $("#modal_clientes").modal({backdrop: "static"});
                });
                });
                
            /*para que al hacer clic se abra la ventana modal*/
            $('#tbl_clientes').on('click','tr td',function(){
               var target,nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso,id; 
               target = $(event.target);
               nombres = target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html();
               nit = target.parent("tr").find("td").eq(3).html();
               genero = target.parent("tr").find("td").eq(4).html();
               telefono = target.parent("tr").find("td").eq(5).html();
               correo_electronico = target.parent("tr").find("td").eq(6).html();
               fechaingreso = target.parent("tr").find("td").eq(7).html();
               id = target.parent("tr").find("td").eq(0).html();
               $("#txt_id").val(id);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_nit").val(nit);
               $("#drop_genero").val(genero);
               $("#txt_telefono").val(telefono);
               $("#txt_correoe").val(correo_electronico);
               $("#modal_clientes").modal('show');
            });
        
        </script>

    </body>
</html>