<%-- 
    Document   : empleado
    Created on : 9/10/2020, 02:00:57 PM
    Author     : Erick
--%>

<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.Puestos"%>
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
        <br>
        <!-- Modal -->
        <div class="modal fade" id="modal_empleado" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
        <div class="modal-header">
        <h4 class="modal-title">Registro de empleados</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <div class="container">
        <form class="form-group" action="" method="post">
                <label for="lbl_id" ><b>ID</b></label>
                <input class="form-control" type="text" name="txt_id" id="txt_id" value="0" readonly>
                <label for="lbl_nombres" ><b>Nombres</b></label>
                <input class="form-control" type="text" name="txt_nombres" id="txt_nombres" required>
                <label for="lbl_apellidos" ><b>Apellidos</b></label>
                <input class="form-control" type="text" name="txt_apellidos" id="txt_apellidos" required>
                <label for="lbl_direccion" ><b>Direccion</b></label>
                <input class="form-control" type="text" name="txt_direccion" id="txt_direccion" required>
                <label for="lbl_telefono" ><b>Telefono</b></label>
                <input class="form-control" type="text" name="txt_telefono" id="txt_telefono" required>
                <label for="lbl_dpi" ><b>DPI</b></label>
                <input class="form-control" type="text" name="txt_dpi" id="txt_dpi" required>
                <label for="lbl_genero"><b>Genero</b></label>
                <select class="form-control" name="drop_genero" id="drop_genero" required>
                    <option >0</option>
                    <option >1</option>  
                </select>
                <label for="lbl_fecha_nacimiento"><b>Fecha Nacimiento</b></label>
                <input class="form-control" type="date" name="txt_fecha_nacimiento" id="txt_fecha_nacimiento" required>
                <label for="lbl_puesto"><b>Puesto</b></label>
                <select class="form-control" name="drop_puesto" id="drop_puesto" required>
                    <%
                        Puestos puesto = new Puestos();
                        HashMap<String,String> drop = puesto.drop_puesto();
                        for (String i: drop.keySet()) {
                            out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                        }
                    %>
                </select>
                <label for="lbl_finicio_labores"><b>Fecha inicio de labores</b></label>
                <input class="form-control" type="date" name="txt_finicio_labores" id="txt_finicio_labores" required>
                <br>
                <div class="modal-footer">
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-success">Agregar</button>
                <button type="button" class="btn btn-primary" id="btn_modificar">Modificar</button>
                <button type="button" class="btn btn-primary" id="btn_eliminar">Eliminar</button>
                <button type="button" class="btn btn-primary" id="btn_puestos">Puestos</button>
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
            <h1>Empleados</h1>
            <br>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()" id="btn_nuevo">Nuevo</button>
            <a href="puestos.jsp" class="btn btn-success">Ir a Puestos</a>
               <a href="menu.jsp" class="btn btn-success">Menu</a>
                <a href="login.jsp" class="btn btn-outline-danger">Salir</a>
            <br>
            <br>
            <table class="table table-dark table-hover table-responsive">
                <thead class="thead-responsive thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>DPI</th>
                        <th>Genero</th>
                        <th>Fecha Nacimiento</th>
                        <th>Puesto</th>
                        <th>Fecha Inicio</th>
                        <th>Fecha Ingreso</th>
                        <th class="d-none">Id Puesto</th>
                    </tr>
                </thead>
                <tbody id="tbl_empleados">
                    <%
                        Empleado emp = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = emp.leer();
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
                            out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 9) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 10) + "</td>");
                            out.println("<td class="+ "'d-none'" + ">" + tabla.getValueAt(t, 11) + "</td>");
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
                $("#txt_direccion").val('');
                $("#txt_telefono").val('');
                $("#txt_dpi").val('');
                $("#drop_genero").val('');
                $("#txt_fecha_nacimiento").val('');
                $("#drop_puesto").val('1');
                $("#txt_finicio_labores").val('');
            }
            
            /*para que el modal no se cierre al dar clic afuera*/
            $(document).ready(function(){
                $("#btn_nuevo").click(function(){
                $("#modal_empleado").modal({backdrop: "static"});
                });
                });
                
            /*para que al hacer clic se abra la ventana modal*/
            $('#tbl_empleados').on('click','tr td',function(){
               var target,id,nombres,apellidos,direccion,telefono,dpi,genero,fecha_nacimiento,puesto,fecha_inicio_labores,fechaingreso,idPuesto; 
               target = $(event.target);
               id = target.parent("tr").find("td").eq(0).html();
               nombres = target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html();
               direccion = target.parent("tr").find("td").eq(3).html();
               telefono = target.parent("tr").find("td").eq(4).html();
               dpi = target.parent("tr").find("td").eq(5).html();
               genero = target.parent("tr").find("td").eq(6).html();
               fecha_nacimiento = target.parent("tr").find("td").eq(7).html();
               puesto = target.parent("tr").find("td").eq(8).html();
               fecha_inicio_labores = target.parent("tr").find("td").eq(9).html();
               fechaingreso = target.parent("tr").find("td").eq(10).html();
               idPuesto = target.parent("tr").find("td").eq(11).html();
               $("#txt_id").val(id);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_direccion").val(direccion);
               $("#txt_telefono").val(telefono);
               $("#txt_dpi").val(dpi);
               $("#drop_genero").val(genero);
               $("#txt_fecha_nacimiento").val(fecha_nacimiento);
               $("#drop_puesto").val(puesto);
               $("#txt_finicio_labores").val(fecha_inicio_labores);
               $("#modal_producto").modal('show');
            });
        
        </script>

    </body>
</html>