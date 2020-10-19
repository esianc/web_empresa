<%-- 
    Document   : productos
    Created on : 18/10/2020, 04:04:38 PM
    Author     : Erick
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Productos"%>
<%@page import="java.util.HashMap"%>
<%@page import="modelo.Marcas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
         <!-- Modal -->
        <div class="modal fade" id="modal_productos" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
        <div class="modal-header">
        <h4 class="modal-title">Mantenimiento de Productos</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <div class="container">
        <form class="form-group" action="sr_productos" method="post">
                <label for="lbl_id" ><b>ID</b></label>
                <input class="form-control" type="text" name="txt_idprod" id="txt_idprod" value="0" readonly>
                <label for="lbl_codigo" ><b>Codigo</b></label>
                <input class="form-control" type="text" name="txt_codigo" id="txt_codigo" required>
                <label for="lbl_marca" ><b>Marca</b></label>
                <select class="form-control" name="drop_marca" id="drop_marca" required>
                    <%
                        Marcas marca = new Marcas();
                        HashMap<String,String> drop = marca.drop_marca();
                        for (String i: drop.keySet()) {
                            out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                        }
                    %>
                </select>
                <label for="lbl_descripcion" ><b>Descripcion</b></label>
                <input class="form-control" type="text" name="txt_descripcion" id="txt_descripcion" required>
                <label for="lbl_imagen" ><b>Imagen</b></label>
                <input class="form-control" type="text" name="txt_imagen" id="txt_imagen">
                <label for="lbl_precio_costo" ><b>Precio Costo</b></label>
                <input class="form-control" type="number" name="txt_precioc" id="txt_precioc" required min="0" value="0" step="0.01" placeholder="0.00">
                <label for="lbl_precio_venta" ><b>Precio Venta</b></label>
                <input class="form-control" type="number" name="txt_preciov" id="txt_preciov" required min="0" value="0" step="0.01" placeholder="0.00">                
                <label for="lbl_existencia"><b>Existencia</b></label>
                <input class="form-control" type="text" name="txt_existencia" id="txt_existencia" required placeholder="0">
                <label for="lbl_fecha_ingreso"><b>Fecha de ingreso</b></label>
                <input class="form-control" type="date" name="txt_fingreso" id="txt_fingreso" required>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-primary">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-outline-success">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-outline-danger">Eliminar</button>
                <br>
        </form>
                <div class="modal-footer">
                <a href="marcas.jsp" class="btn btn-success">Marcas</a>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                </div>
        </div>
        </div>
        </div>
        </div>
        </div>
        <br>
            <div class="container">
            <br>
            <h1>Mantenimiento de Productos</h1>
            <br>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_productos" onclick="limpiar()" id="btn_nuevo">Nuevo</button>
            <a href="marcas.jsp" class="btn btn-success">Ir a Marcas</a>
            <br>
            <br>
            <table class="table table-dark table-hover table-responsive">
                <thead class="thead-responsive thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Codigo</th>
                        <th>Marca</th>
                        <th>Descripcion</th>
                        <th>Imagen</th>
                        <th>Precio Costo</th>
                        <th>Precio Venta</th>
                        <th>Existencia</th>
                        <th>Fecha Ingreso</th>
                        <th class="d-none">Id Marca</th>
                    </tr>
                </thead>
                <tbody id="tbl_productos">
                    <%
                        Productos prod = new Productos();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = prod.leer();
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
                            out.println("<td class="+ "'d-none'" + ">" + tabla.getValueAt(t, 9) + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
        <script type="text/javascript">
            //*Limpiar todas las casillas*/
            function limpiar(){
                $("#txt_idprod").val(0);
                $("#txt_codigo").val('');
                $("#drop_marca").val('1');
                $("#txt_descripcion").val('');
                $("#txt_imagen").val('');
                $("#txt_precioc").val('');
                $("#txt_preciov").val('');
                $("#txt_existencia").val('');
                $("#txt_fingreso").val('');
            }
            
            /*para que el modal no se cierre al dar clic afuera*/
            $(document).ready(function(){
                $("#btn_nuevo").click(function(){
                $("#modal_productos").modal({backdrop: "static"});
                });
                });
                
            /*para que al hacer clic se abra la ventana modal*/
            $('#tbl_productos').on('click','tr td',function(){
               var target,id,producto,marca,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso,idMarca; 
               target = $(event.target);
               id = target.parent("tr").find("td").eq(0).html();
               producto = target.parent("tr").find("td").eq(1).html();
               marca = target.parent("tr").find("td").eq(2).html();
               descripcion = target.parent("tr").find("td").eq(3).html();
               imagen = target.parent("tr").find("td").eq(4).html();
               precio_costo = target.parent("tr").find("td").eq(5).html();
               precio_venta = target.parent("tr").find("td").eq(6).html();
               existencia = target.parent("tr").find("td").eq(7).html();
               fecha_ingreso = target.parent("tr").find("td").eq(8).html();
               idMarca = target.parent("tr").find("td").eq(9).html();
               $("#txt_idprod").val(id);
               $("#txt_codigo").val(producto);
               $("#drop_marca").val(idMarca);
               $("#txt_descripcion").val(descripcion);
               $("#txt_imagen").val(imagen);
               $("#txt_precioc").val(precio_costo);
               $("#txt_preciov").val(precio_venta);
               $("#txt_existencia").val(existencia);
               $("#txt_fingreso").val(fecha_ingreso);
               $("#modal_productos").modal('show');
            });
        
        </script>

    </body>
</html>
