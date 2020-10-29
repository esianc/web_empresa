<%-- 
    Document   : ventas
    Created on : 26/10/2020, 02:10:08 PM
    Author     : Erick
--%>

<%@page import="modelo.Productos"%>
<%@page import="java.util.HashMap"%>
<%@page import="modelo.Ventas"%>
<%@page import="modelo.Clientes"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Series"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Ventas</title>
    </head>
    <body>
        <div class="container container-md">
            <form>
            <br>
                <h1>Ventas</h1>
            <br>    
            <div class="form-row">
                <div class="col-1 col-auto">
                    <label for="lbl_serie"><b>Serie</b></label>
                </div>
                <div class="col-1 col-auto">
                    <select class="form-control" name="drop_marca" id="drop_marca" required>
                        <%
                            Series serie = new Series();
                            HashMap<String,String> drop = serie.drop_serie();
                            for (String i: drop.keySet()) {
                                out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                            }
                        %>
                    </select>
                </div>
                <div class="col-2 col-auto" align="right">
                    <label for="lbl_numero"><b> Numero</b></label>
                </div>
                <div class="col-1 col-auto">
                    <label for="lbl_nuevonumero" class="btn btn-outline-primary" data-toggle="modal" data-target="#" data-backdrop="static"><b>#</b></label>
                    <label for="lbl_consulta " class="btn btn-outline-primary"data-toggle="modal" data-target="#" data-backdrop="static"><b>?</b></label>
                </div>
                <div class="col-2 col-auto">
                    <input class="form-control" type="text" name="txt_numero" id="txt_numero" required>
                </div>
            </div>
            <div class="form-row">
                <div class="col-1 col-auto">
                    <label for="lbl_fecha"><b>Fecha</b></label>
                </div>
                <div class="col-2 col-auto">
                    <input class="form-control" type="date" name="txt_fecha" id="txt_fecha" required>
                </div>
                <div class="col-1 col-auto">
                    <label for="lbl_cliente" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal_ventas1" data-backdrop="static"><b>Nit</b></label>
                </div>
                <div class="col-3 col-auto">
                    <input class="form-control" type="text" name="txt_nitc" id="txt_nitc" required>
                </div>
            </div>
            <div class="form-row">
                <div class="col-1 col-auto">
                    <label for="lbl_nombresc"><b>Nombres</b></label>
                </div>
                <div class="col-6 col-auto">
                    <input class="form-control" type="text" name="txt_nombresc" id="txt_nombresc" required>
                </div>
            </div>    
            <div class="form-row">
                <div class="col-2 col-auto">
                    <label for="lbl_buscar" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal_ventas2" data-backdrop="static"><b>Buscar Productos</b></label>
                </div>
                <div class="col-5 col-auto">
                    <input class="form-control" type="text" name="txt_buscar" id="txt_buscar" required>
                </div>
            </div>    
            </form>
        </div>
        
                <div class="container container-md">     
                    <table class="table table-dark table-hover table-responsive">
                        <thead class="thead-responsive thead-dark">
                            <tr>
                            <th class="d-none">Id</th>
                            <th>Codigo</th>
                            <th>Cantidad</th>
                            <th>Descripcion</th>
                            <th>Precio Unitario</th>
                            <th>Precio Total</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_ventas3">
                            <td>Uno</td>
                            <td>codigo prueba</td>
                            <td>descripcion p</td>
                            <td>precio prueba</td>
                            <td>cantidad*precio</td>
                        </tbody>
                    </table>
        </div>
        
            
            <div class="form-row">     
            <!-- Modal Productos (datos factura) -->
            <div class="modal fade" id="modal_ventas2"> 
            <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Productos</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <table class="table table-hover table-striped">
                        <thead class="thead-responsive">
                            <tr>
                            <th class="d-none">Id</th>
                            <th>Codigo</th>
                            <th>Descripcion</th>
                            <th>Precio</th>
                            <th>Existencia</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_ventas2">
                            <%
                                Ventas venta1 = new Ventas();
                                DefaultTableModel tabla2 = new DefaultTableModel();
                                tabla2 = venta1.lee_prod();
                                for (int t=0; t<tabla2.getRowCount();t++){
                                    out.println("<tr>");
                                    out.println("<td class="+ "'d-none'" + ">" + tabla2.getValueAt(t, 0) + "</td>");
                                    out.println("<td>" + tabla2.getValueAt(t, 1) + "</td>");
                                    out.println("<td>" + tabla2.getValueAt(t, 2) + "</td>");
                                    out.println("<td>" + tabla2.getValueAt(t, 3) + "</td>");
                                    out.println("<td>" + tabla2.getValueAt(t, 4) + "</td>");
                                    out.println("</tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                </div>
                </div>
               </div>
             </div>
        </div> 
                        
        <div class="form-row">     
            <!-- Modal Clientes (datos factura) -->
            <div class="modal fade" id="modal_ventas1"> 
            <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Clientes</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <table class="table table-dark table-hover table-responsive">
                        <thead class="thead-responsive thead-dark">
                            <tr>
                            <th class="d-none">Id</th>
                            <th>Nit</th>
                            <th>Nombres</th>
                            <th>Telefono</th>
                            <th>E-mail</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_ventas1">
                            <%
                                Ventas venta = new Ventas();
                                DefaultTableModel tabla1 = new DefaultTableModel();
                                tabla1 = venta.leer_cliente();
                                for (int t=0; t<tabla1.getRowCount();t++){
                                    out.println("<tr>");
                                    out.println("<td class="+ "'d-none'" + ">" + tabla1.getValueAt(t, 0) + "</td>");
                                    out.println("<td>" + tabla1.getValueAt(t, 1) + "</td>");
                                    out.println("<td>" + tabla1.getValueAt(t, 2) + "</td>");
                                    out.println("<td>" + tabla1.getValueAt(t, 3) + "</td>");
                                    out.println("<td>" + tabla1.getValueAt(t, 4) + "</td>");
                                    out.println("</tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                </div>
                </div>
               </div>
             </div>
        </div>                
                        
                <script>
                        $('#tbl_ventas1').on('click','tr td',function(){
                        var target,id,nit,ncompleto,telefono,correo_electronico; 
                        target = $(event.target);
                        id = target.parent("tr").find("td").eq(0).html();
                        nit = target.parent("tr").find("td").eq(1).html();
                        ncompleto = target.parent("tr").find("td").eq(2).html();
                        telefono = target.parent("tr").find("td").eq(4).html();
                        correo_electronico = target.parent("tr").find("td").eq(5).html();
                        $("#txt_nombresc").val(ncompleto);
                        $("#txt_nitc").val(nit);
                        $('#modal_ventas1').modal('hide');
                        });
                </script>
                
                <script>
                        $('#tbl_ventas2').on('click','tr td',function(){
                        var target,id,producto,descripcion,precio_venta,existencia; 
                        target = $(event.target);
                        id = target.parent("tr").find("td").eq(0).html();
                        producto = target.parent("tr").find("td").eq(1).html();
                        descripcion = target.parent("tr").find("td").eq(2).html();
                        precio_venta = target.parent("tr").find("td").eq(4).html();
                        existencia = target.parent("tr").find("td").eq(5).html();
                        $("#txt_buscar").val(producto);
                        $('#modal_ventas2').modal('hide');
                        });
                </script>

                        
                        
    </body>
</html>
