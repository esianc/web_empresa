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
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
                    <select class="form-control" name="drop_series" id="drop_series" required>
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
                    <button class="btn btn-outline-primary"data-toggle="modal" data-target="#" data-backdrop="static"><i class='fas fa-search'></i></button>
                    <button class="btn btn-outline-primary" id="btn_ultimo" value="ultimo"><i class='fas fa-plus'></i></button>
                </div>
                <div class="col-2 col-auto">
                    <input class="form-control" type="text" name="txt_numero" id="txt_numero" required>
                    <br>
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
                    <button class="btn btn-outline-primary"data-toggle="modal" data-target="#modal_ventas3" data-backdrop="static"><i class='fas fa-user-alt'></i></button>
                </div>
                <div class="col-2 col-auto">
                    <input class="form-control" type="text" name="txt_empleadof" id="txt_empleadof" required>
                </div>
                <div class="col-1 col-auto">
                    <input class="d-none" type="text" name="txt_idempl" id="txt_idempl" display="none">
                </div>   
            </div><br>
            <div class="form-row">
                <div class="col-1 col-auto">
                    <label for="lbl_buscar" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal_ventas1" data-backdrop="static"><b>Cliente</b></label>
                </div>
                <div class="col-5 col-auto">
                    <input class="form-control" type="text" name="txt_nombresc" id="txt_nombresc" required>
                </div>
                <div class="col-1 col-auto">
                    <input class="d-none" type="text" name="txt_idclie" id="txt_idclie" display="none">
                </div>
            
            </div><br>
            <div class="form-row">
                <div class="col-1 col-auto">
                    <label for="lbl_nombresc"><b>NIT</b></label>
                </div>
                <div class="col-2 col-auto">
                    <input class="form-control" type="text" name="txt_nitc" id="txt_nitc" required>
                </div>
                <div class="col-1 col-auto" align="right">
                    <button class="btn btn-outline-primary"data-toggle="modal" data-target="#modal_ventas2" data-backdrop="static"><i class='fas fa-search'></i></button>
                </div>
                <div class="col-2 col-auto">
                    <input class="form-control" type="text" name="txt_buscar" id="txt_buscar" required>
                    <br>
                </div>
            </div> 
            <div class="form-row">
                <div class="col-1 col-auto">
                    <label for="lbl_descripcion"><b>Descripcion</b></label>
                </div>
                <div class="col-5 col-auto">
                    <input class="form-control" type="text" name="txt_descripcionp" id="txt_descripcionp" required>
                    <br>
                </div>
            </div> 
            <div class="form-row">    
                    <div class="col-1 col-auto">
                        <label for="lbl_preciof"><b>Precio</b></label>
                    </div>
                    <div class="col-1 col-auto">
                        <input class="form-control" type="text" name="txt_preciof" id="txt_preciof" required>
                    </div>
                    <div class="col-1 col-auto">
                        <label for="lbl_existencia"><b>Exsitencia</b></label>
                    </div>
                    <div class="col-1 col-auto">
                        <input class="form-control" type="text" name="txt_existenciaf" id="txt_existenciaf" readonly>
                    </div>
                    <div class="col-1 col-auto">
                        <label for="lbl_cantidad"><b>Cantidad</b></label>
                    </div>
                    <div class="col-1 col-auto">
                        <input class="form-control" type="number" name="txt_cantidad" id="txt_cantidad" required>
                    </div>
                    <div class="col-1 col-auto">
                        <button class="btn btn-outline-primary"data-toggle="modal" data-target="#" data-backdrop="static"><i class='fas fa-plus'></i></button>
                    </div>
                    <div class="col-1 col-auto" align="right">
                        <label for="lbl_cantidad"><b>TOTAL</b></label>
                    </div>
                    <div class="col-2 col-auto">
                        <input class="form-control" type="text" name="txt_total" id="txt_total" readonly>
                    </div>
            </div>                    
            </form><br>
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
                        <tbody id="tbl_ventasp">
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
        <div class="form-row">     
            <!-- Modal Empleados (datos factura) -->
            <div class="modal fade" id="modal_ventas3"> 
            <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Empleados</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <table class="table table-dark table-hover table-responsive">
                        <thead class="thead-responsive thead-dark">
                            <tr>
                            <th>Cod.</th>
                            <th>Nombres</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Fecha ingreso</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_ventas3">
                            <%
                                Ventas ventas3 = new Ventas();
                                DefaultTableModel tabla3 = new DefaultTableModel();
                                tabla3 = ventas3.lee_empl();
                                for (int t=0; t<tabla3.getRowCount();t++){
                                    out.println("<tr>");
                                    out.println("<td>" + tabla3.getValueAt(t, 0) + "</td>");
                                    out.println("<td>" + tabla3.getValueAt(t, 1) + "</td>");
                                    out.println("<td>" + tabla3.getValueAt(t, 2) + "</td>");
                                    out.println("<td>" + tabla3.getValueAt(t, 3) + "</td>");
                                    out.println("<td>" + tabla3.getValueAt(t, 4) + "</td>");
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
                        telefono = target.parent("tr").find("td").eq(3).html();
                        correo_electronico = target.parent("tr").find("td").eq(4).html();
                        $("#txt_nombresc").val(ncompleto);
                        $("#txt_nitc").val(nit);
                        $("#txt_idclie").val(id);
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
                        precio_venta = target.parent("tr").find("td").eq(3).html();
                        existencia = target.parent("tr").find("td").eq(4).html();
                        $("#txt_buscar").val(producto);
                        $("#txt_descripcionp").val(descripcion);
                        $("#txt_preciof").val(precio_venta);
                        $("#txt_existenciaf").val(existencia);
                        $('#modal_ventas2').modal('hide');
                        });
                </script>
                
                <script>
                        $('#tbl_ventas3').on('click','tr td',function(){
                        var target,id,ncompleto,direccion,telefono,fechaingreso; 
                        target = $(event.target);
                        id = target.parent("tr").find("td").eq(0).html();
                        ncompleto = target.parent("tr").find("td").eq(1).html();
                        direccion = target.parent("tr").find("td").eq(2).html();
                        telefono = target.parent("tr").find("td").eq(3).html();
                        fechaingreso = target.parent("tr").find("td").eq(4).html();
                        $("#txt_idempl").val(id);
                        $("#txt_empleadof").val(ncompleto);
                        $('#modal_ventas3').modal('hide');
                        });
                </script>

                        
                        
    </body>
</html>
