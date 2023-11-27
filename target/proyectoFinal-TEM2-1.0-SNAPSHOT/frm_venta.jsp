<%
    if (session.getAttribute("usuario") != null) {
       
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AdminLTE 3 | Dashboard 3</title>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- IonIcons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/adminlte.min.css">
        <!-- DataTable CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="index3.html" class="nav-link">Inicio</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="#" class="nav-link">Contacto</a>
                    </li>
                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Navbar Search -->
                    <li class="nav-item">
                        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                            <i class="fas fa-search"></i>
                        </a>
                        <div class="navbar-search-block">
                            <form class="form-inline">
                                <div class="input-group input-group-sm">
                                    <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                                    <div class="input-group-append">
                                        <button class="btn btn-navbar" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                        <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                            <i class="fas fa-expand-arrows-alt"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                            <i class="fas fa-th-large"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="index3.html" class="brand-link">
                    <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">TEM 2</span>
                </a>

                <jsp:include page="WEB-INF/sidebarMenu.jsp">
                    <jsp:param name="opcion" value="b2_clientes"/>
                </jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Main content -->
                    <br
                        <div class="content">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <!-- /ESTO SE TIENE QUE MODIFICAR -->
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="card-title">Crear nuevo usuario</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body"> 
                                            <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                                <form action="B1_VentaControlador" method="post">
                                                    <input type="hidden" name="idventa" value="${venta.idventa}">
                                                    
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <input type="text"name="idusuario" value="${usuario.idusuario}">
                                                                <div class="form-group">
                                                                    <label for="" class="form-label">Cliente</label>
                                                                    <select name="idcliente" class="form-control">
                                                                        <option value="">--Seleccione--</option>
                                                                        <c:forEach var="item" items="${lista_clientes}">
                                                                            <option value="${item.idpersona}" 
                                                                                    <c:if test="${venta.idcliente== item.idpersona}">
                                                                                        selected
                                                                                    </c:if>
                                                                                    >${item.nombre}</option>                            
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <!-- text input -->
                                                                <div class="form-group">
                                                                    <label>Fecha</label>
                                                                    <input type="date" name="fecha_hora" value="${venta.fecha_hora}" class="form-control" placeholder="Ingresa fecha">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Tipo Comprobante(*):</label>
                                                                    <select name="tipo_comprobante" id="tipo_comprobante" class="form-control selectpicker" required="">
                                                                        <option value="Boleta">Boleta</option>
                                                                        <option value="Factura">Factura</option>
                                                                        <option value="Ticket">Ticket</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <!-- text input -->
                                                                <div class="form-group">
                                                                    <label>Serie</label>
                                                                    <input type="text" name="serie_comprobante" value="${venta.serie_comprobante}" class="form-control" placeholder="Ingresa serie de comprobante">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <!-- text input -->
                                                                <div class="form-group">
                                                                    <label>Número</label>
                                                                    <input type="text" name="num_comprobante" value="${venta.num_comprobante}" class="form-control" placeholder="Ingresa número">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                            <a data-toggle="modal" href="#myModal">           
                                                                <button id="btnAgregarArt" type="button" class="btn btn-primary"> <span class="fa fa-plus"></span> Agregar Artículos</button>
                                                            </a>
                                                        </div>

                                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                                            <table id="detalles" class="table table-striped table-bordered table-condensed table-hover">
                                                                <thead style="background-color:#A9D0F5">
                                                                <th>Opciones</th>
                                                                <th>Artículo</th>
                                                                <th>Cantidad</th>
                                                                <th>Precio Venta</th>
                                                                <th>Descuento</th>
                                                                <th>Sub Total </th>
                                                                <th></th>
                                                                </thead>
                                                                <tfoot>
                                                                <th>TOTAL</th>
                                                                <th></th>
                                                                <th></th>
                                                                <th></th>
                                                                <th></th>
                                                                
                                                                <th><h4 id="total">Bs</h4><input type="hidden" name="total_venta" id="total_venta"></th> 
                                                                </tfoot>
                                                                <tbody>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer justify-content-between">
                                                        <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i> Guardar</button>
                                                        <a href="B1_VentaControlador?action=view">
                                                            <button id="btnCancelar" class="btn btn-danger" type="button"><i class="fa fa-arrow-circle-left"></i> Cancelar</button>
                                                        </a>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- /.card-body -->
                                        </div>
                                        <!-- /ESTO SE TIENE QUE MODIFICAR -->
                                        <!-- /.card -->
                                    </div>
                                    <!-- /.col -->
                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.container-fluid -->
                    </section>
                </div>
                <!-- /.Main content -->
        </div>
        <!-- /.content-wrapper -->       
        <!-- MODAL inicio -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Informacion cliente</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
                                <thead>
                                    <tr>
                                        <th sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">ID</th>
                                        <th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Nombre</th>
                                        <th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Categoria</th>
                                        <th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">Codigo</th>
                                        <th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">Stock</th>
                                        <th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Precio Venta</th>
                                        <th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Operación</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${articulos}">
                                        <tr class="odd">
                                            <td class="dtr-control sorting_1" tabindex="0">${item.idarticulo}</td>
                                            <td>${item.nombre}</td>
                                            <td>${item.categoria}</td>
                                            <td>${item.codigo}</td>
                                            <td>${item.stock}</td>
                                            <td></td>
                                           <!-- <td><a href="D1_ArticuloControlador?action=add&idarticulo=${item.idarticulo}&nombre=${item.nombre}"><i class="fa-solid fa-pen-to-square"><ion-icon name="create-outline"></ion-icon></i></a></td>-->
                                            <td><button id="btn" class="btn btn-success" onclick="agregarDetalle(${item.idarticulo}, '${item.nombre}', 0)"><ion-icon name="add"></ion-icon> Agregar</button></td>
                                        </tr>                                                                   
                                    </c:forEach>
                                </tbody>onclick="saludar()"
                            </table>
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
        <!-- MODAL fin -->

        <!-- Main Footer -->
        <footer class="main-footer">
            <strong>Copyright &copy; 2023 <a href="https://adminlte.io">TEM - 2</a>.</strong>
            Todos los derechos reservados.
            <div class="float-right d-none d-sm-inline-block">
                <b>Version</b> 0.1.0
            </div>
        </footer>
    </div>
    <!-- ./wrapper -->
    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE -->
    <script src="dist/js/adminlte.js"></script>

    <!-- OPTIONAL SCRIPTS -->
    <script src="plugins/chart.js/Chart.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard3.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap4.min.js"></script>
    <script>
                                                $(document).ready(function () {
                                                    $('#example1').DataTable();
                                                });

                                                var cont = 0;
                                                function agregarDetalle(idarticulo, articulo, precio_venta)
                                                {
                                                    var cantidad = 1;
                                                    var descuento = 0;

                                                    if (idarticulo != "")
                                                    {
                                                        var subtotal = cantidad * precio_venta;
                                                        var fila = '<tr class="filas" id="fila' + cont + '">' +
                                                                '<td><button type="button" class="btn btn-danger" onclick="eliminarDetalle(' + cont + ')">X</button></td>' +
                                                                '<td><input type="hidden" name="idarticulo[]" value="' + idarticulo + '">' + articulo + '</td>' +
                                                                '<td><input type="number" name="cantidad[]" id="cantidad[]" value="' + cantidad + '"></td>' +
                                                                '<td><input type="number" name="precio_venta[]" id="precio_venta[]" value="' + precio_venta + '"></td>' +
                                                                '<td><input type="number" name="descuento[]" value="' + descuento + '"></td>' +
                                                                '<td><span name="subtotal" id="subtotal' + cont + '">' + subtotal + '</span></td>' +
                                                                '<td><button type="button" onclick="modificarSubototales()" class="btn btn-info"><ion-icon name="logo-ionic"></ion-icon></button></td>' +
                                                                '</tr>';
                                                        cont++;
                                                        detalles = detalles + 1;
                                                        $('#detalles').append(fila);
                                                        // modificarSubototales();
                                                    } else
                                                    {
                                                        alert("Error al ingresar el detalle, revisar los datos del artículo");
                                                    }
                                                }

                                                function modificarSubototales()
                                                {
                                                    var cant = document.getElementsByName("cantidad[]");
                                                    var prec = document.getElementsByName("precio_venta[]");
                                                    var desc = document.getElementsByName("descuento[]");
                                                    var sub = document.getElementsByName("subtotal");

                                                    for (var i = 0; i < cant.length; i++) {
                                                        var inpC = cant[i];
                                                        var inpP = prec[i];
                                                        var inpD = desc[i];
                                                        var inpS = sub[i];

                                                        inpS.value = (inpC.value * inpP.value) - inpD.value;
                                                        document.getElementsByName("subtotal")[i].innerHTML = inpS.value;
                                                    }
                                                    calcularTotales();

                                                }

                                                function calcularTotales() {
                                                    var sub = document.getElementsByName("subtotal");
                                                    var total = 0.0;

                                                    for (var i = 0; i < sub.length; i++) {
                                                        total += document.getElementsByName("subtotal")[i].value;
                                                    }
                                                    $("#total").html("Bs/. " + total);
                                                    $("#total_venta").val(total);
                                                    evaluar();
                                                }

                                                function evaluar() {
                                                    if (detalles > 0)
                                                    {
                                                        $("#btnGuardar").show();
                                                    } else
                                                    {
                                                        $("#btnGuardar").show();
                                                        cont = 0;
                                                    }
                                                }

                                                function eliminarDetalle(indice) {
                                                    $("#fila" + indice).remove();
                                                    calcularTotales();
                                                    detalles = detalles - 1;
                                                    evaluar()
                                                }
    </script>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
<%}else{
response.sendRedirect("login.jsp");
    }
%>


