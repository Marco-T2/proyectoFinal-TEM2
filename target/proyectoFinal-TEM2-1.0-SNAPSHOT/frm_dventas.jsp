<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
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
                    <jsp:param name="opcion" value="usuarios"/>
                </jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <div class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1 class="m-0">Ventas</h1>
                                </div><!-- /.col -->
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item"><a href="#">Ventas</a></li>
                                        <li class="breadcrumb-item active">Venta</li>
                                    </ol>
                                </div><!-- /.col -->
                            </div><!-- /.row -->
                        </div><!-- /.container-fluid -->
                    </div>
                    <!-- /.content-header -->

                    <!-- Main content -->
                    <div class="content">
                        <section class="content">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-12">
                                        <!-- /ESTO SE TIENE QUE MODIFICAR -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h3 class="card-title">Listado de ventas</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body">
                                                <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                                    <div class="row">
                                                        <div class="col-sm-12 col-md-6">
                                                            <div class="dt-buttons btn-group flex-wrap">
                                                                <a href="B1_VentaControlador" >
                                                                    <button type="button" class="btn btn-default">Regresar</button>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <form action="B1_VentaControlador" method="post">
                                                        <input type="hidden" name="idventa" value="${venta.idventa}">

                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="" class="form-label">Cliente</label>
                                                                        <select name="idcliente" class="form-control">
                                                                            <option value="">${venta.cliente}</option>

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <!-- text input -->
                                                                    <div class="form-group">
                                                                        <label>Fecha</label>
                                                                        <input type="date" name="fecha_hora" value="${venta.fecha_hora}" class="form-control" placeholder="Ingresa fecha">
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Tipo Comprobante(*):</label>
                                                                        <input type="text"  value="${venta.tipo_comprobante}" class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <!-- text input -->
                                                                    <div class="form-group">
                                                                        <label>Serie</label>
                                                                        <input type="text" name="serie_comprobante" value="${venta.serie_comprobante}" class="form-control" placeholder="Ingresa serie de comprobante">
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <!-- text input -->
                                                                    <div class="form-group">
                                                                        <label>Número</label>
                                                                        <input type="text" name="num_comprobante" value="${venta.num_comprobante}" class="form-control" placeholder="Ingresa número">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                                                <table id="detalles" class="table table-striped table-bordered table-condensed table-hover">
                                                                    <thead style="background-color:#A9D0F5">
                                                                    <th>id</th>
                                                                    <th>Articuculo</th>
                                                                    <th>Cantidad</th>
                                                                    <th>Precio</th>
                                                                    <th>Descuento</th>
                                                                    <th>Sub total</th>
                                                                    </thead>
                                                                    <c:forEach var="item" items="${d_ventas}">
                                                                        <tr>
                                                                            <td>${item.idventa}</td>
                                                                            <td>${item.articulo}</td>
                                                                            <td>${item.cantidad}</td>
                                                                            <td>${item.precio_venta}</td>
                                                                            <td>${item.descuento}</td>
                                                                            <td>${item.subtotal}</td>
                                                                        </tr>                                                              
                                                                    </c:forEach>
                                                                    <tfoot>
                                                                    <th colspan="5">TOTAL</th>
                                                                    <th>Bs. ${venta.total_venta}</th> 
                                                                    </tfoot>
                                                                    <tbody>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer justify-content-between">
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

                <!-- Main Footer -->
                <jsp:include page="WEB-INF/footer.jsp">
                    <jsp:param name="opcion" value="#"/>
                </jsp:include>       

        </div>
        <!-- REQUIRED SCRIPTS -->

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
        </script>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    </body>
</html>
