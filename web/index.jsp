<%-- 
    Document   : index
    Created on : 29/09/2021, 22:02:20
    Author     : gerar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Clientes" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        
    </head>
    <body>
        <h1>Formulario empleados</h1>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_cliente" onclick="limpiar()">
            Nuevo
        </button>
        <div class="container">
            
            <!-- The Modal -->
            <div class="modal fade" id="modal_cliente">
              <div class="modal-dialog">
                <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">Formulario Empleado</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                     <form action="sr_clientes" method="post" class="form-group">
                        <label for="lbl_id"><b>ID</b></label>
                        <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                        <label for="lbl_nit"><b>NIT:</b></label>
                        <input type="text" name="txt_nit" placeholder="Ejemplo: 123456789" id="txt_nit" class="form-control" required>
                        <label for="lbl_nombres"><b>Nombres:</b></label>
                        <input type="text" name="txt_nombres" placeholder="nombre1 nombre2" id="txt_nombres" class="form-control" required>
                        <label for="lbl_apellidos"><b>Apellidos:</b></label>
                        <input type="text" name="txt_apellidos" placeholder="apellido1 apellido2" id="txt_apellidos" class="form-control" required>
                        <label for="lbl_direccion"><b>Direccion:</b></label>
                        <input type="text" name="txt_direccion" placeholder="# Casa Calle zona Ciudad" id="txt_direccion" class="form-control" required>
                        <label for="lbl_telefono"><b>Telefono:</b></label>
                        <input type="number" name="txt_telefono" placeholder="12345678" id="txt_telefono" class="form-control" required>
                        <label for="lbl_fechaNacimiento"><b>Fecha de Nacimiento:</b></label>
                        <input type="date" name="txt_fechaNacimiento" id="txt_fechaNacimiento" class="form-control" required>

                        <br>
                        <button class="btn btn-outline-primary btn-lg" value="agregar" name="btn_agregar" id="btn_agrgegar">Agregar</button>
                        <button class="btn btn-outline-success btn-lg" value="modificar" name="btn_modificar" id="btn_modificar" onclick="javascript:if(!confirm('Esta seguro que desea modificar?'))return false">Modificar</button>
                        <button class="btn btn-outline-danger btn-lg" value="eliminar" name="btn_eliminar" id="btn_eliminar" onclick="javascript:if(!confirm('Esta seguro que desea eliminar?'))return false">Eliminar</button>
                        <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">Cerrar</button>
                    </form>
                  </div>

                </div>
              </div>
            </div>
            
           
                <table class="table table-striped">
                    <br>
                    <thead>
                        <tr>
                            <th>NIT</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Nacimiento</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_clientes">
                        <tr>
                        <%
                        Clientes clientes = new Clientes();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = clientes.mostrar();
                        for(int t =0; t<tabla.getRowCount();t++){
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("</tr>");
                            
                          
                          
                        }
                        %>
                        </tr>
                     
                    </tbody>
                </table>
            
            
            
        </div>
                        <script type="text/javascript">
                            function limpiar(){
                                $("#txt_id").val(0);
                                $("#txt_nit").val('');
                                $("#txt_nombres").val('');
                                $("#txt_apellidos").val('');
                                $("#txt_direccion").val('');
                                $("#txt_telefono").val('');
                                $("#txt_fechaNacimiento").val('');
                            }
                            
                            $('#tbl_clientes').on('click','tr td',function(evt){
                                var target, id,nit,nombres,apellidos,direccion,telefono,nacimiento;
                                target = $(event.target);
                                id = target.parent().data('id');
                                nit = target.parent("tr").find("td").eq(0).html();
                                nombres = target.parent("tr").find("td").eq(1).html();
                                apellidos = target.parent("tr").find("td").eq(2).html();
                                direccion = target.parent("tr").find("td").eq(3).html();
                                telefono = target.parent("tr").find("td").eq(4).html();
                                nacimiento = target.parent("tr").find("td").eq(5).html();
                                $("#txt_id").val(id);
                                $("#txt_nit").val(nit);
                                $("#txt_nombres").val(nombres);
                                $("#txt_apellidos").val(apellidos);
                                $("#txt_direccion").val(direccion);
                                $("#txt_telefono").val(telefono);
                                $("#txt_fechaNacimiento").val(nacimiento);
                                
                                $("#modal_cliente").modal('show');
                            });
                            
                        </script>  
    </body>
</html>
