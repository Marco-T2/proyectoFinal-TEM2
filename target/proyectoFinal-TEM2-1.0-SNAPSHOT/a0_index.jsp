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
        <title>Sistema de ventas</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- IonIcons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/adminlte.min.css">
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
                    <jsp:param name="opcion" value="a0_index"/>
                </jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <div class="content-header">

                    </div>
                    <!-- /.content-header -->

                    <!-- Main content -->
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <c:set var="stotal" value="0" />
                                <c:forEach items="${compras}" var="valor">
                                    <c:set var="stotal" value="${stotal + valor}" />
                                </c:forEach>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="small-box bg-primary">
                                        <div class="inner">
                                            <h4 style="font-size:17px;">
                                                <strong>Bs./ ${stotal}</strong>
                                            </h4>
                                            <p>Compras</p>
                                        </div>
                                        <div class="icon">
                                            <i class="ion ion-bag"></i>
                                        </div>
                                        <a href="ingreso.php" class="small-box-footer">Compras <i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <c:set var="suma" value="0" />
                                <c:forEach items="${ventas}" var="numero">
                                    <c:set var="suma" value="${suma + numero}" />
                                </c:forEach>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="small-box bg-green">
                                        <div class="inner">
                                            <h4 style="font-size:17px;">
                                                <strong>Bs./ ${suma}</strong>
                                            </h4>
                                            <p>Ventas</p>
                                        </div>
                                        <div class="icon">
                                            <i class="ion ion-bag"></i>
                                        </div>
                                        <a href="venta.php" class="small-box-footer">Ventas <i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="card">
                                        <div class="card-header border-0">
                                            <div class="d-flex justify-content-between">
                                                <h3 class="card-title">Compras realializadas por mes </h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <!-- /.d-flex -->
                                            <div class="position-relative mb-4">
                                                <canvas id="compras" height="200"></canvas>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- /.card -->

                                    <div class="card">
                                        <div class="card-header border-0">
                                            <h3 class="card-title">Products</h3>
                                            <div class="card-tools">
                                                <a href="#" class="btn btn-tool btn-sm">
                                                    <i class="fas fa-download"></i>
                                                </a>
                                                <a href="#" class="btn btn-tool btn-sm">
                                                    <i class="fas fa-bars"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="card-body table-responsive p-0">
                                            <table class="table table-striped table-valign-middle">
                                                <thead>
                                                    <tr>
                                                        <th>Producto</th>
                                                        <th>Precio</th>
                                                        <th>Sales</th>
                                                        <th>More</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                            Some Product
                                                        </td>
                                                        <td>$14 USD</td>
                                                        <td>
                                                            <small class="text-success mr-1">
                                                                <i class="fas fa-arrow-up"></i>
                                                                12%
                                                            </small>
                                                            12,000 Sold
                                                        </td>
                                                        <td>
                                                            <a href="#" class="text-muted">
                                                                <i class="fas fa-search"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                            Another Product
                                                        </td>
                                                        <td>$29 USD</td>
                                                        <td>
                                                            <small class="text-warning mr-1">
                                                                <i class="fas fa-arrow-down"></i>
                                                                0.5%
                                                            </small>
                                                            123,234 Sold
                                                        </td>
                                                        <td>
                                                            <a href="#" class="text-muted">
                                                                <i class="fas fa-search"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                            Amazing Product
                                                        </td>
                                                        <td>$1,230 USD</td>
                                                        <td>
                                                            <small class="text-danger mr-1">
                                                                <i class="fas fa-arrow-down"></i>
                                                                3%
                                                            </small>
                                                            198 Sold
                                                        </td>
                                                        <td>
                                                            <a href="#" class="text-muted">
                                                                <i class="fas fa-search"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                            Perfect Item
                                                            <span class="badge bg-danger">NEW</span>
                                                        </td>
                                                        <td>$199 USD</td>
                                                        <td>
                                                            <small class="text-success mr-1">
                                                                <i class="fas fa-arrow-up"></i>
                                                                63%
                                                            </small>
                                                            87 Sold
                                                        </td>
                                                        <td>
                                                            <a href="#" class="text-muted">
                                                                <i class="fas fa-search"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- /.card -->
                                </div>
                                <!-- /.col-md-6 -->

                                <div class="col-lg-6">
                                    <div class="card">
                                        <div class="card-header border-0">
                                            <div class="d-flex justify-content-between">
                                                <h3 class="card-title">Ventas por mes</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <!--<div class="d-flex">
                                                <p class="d-flex flex-column">
                                                    <span class="text-bold text-lg">Total de ventas en Bs. ${suma}</span>
                                                </p>

                                            </div>-->
                                            <!-- /.d-flex -->

                                            <div class="position-relative mb-4">
                                                <canvas id="ventas" height="200"></canvas>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- /.card -->

                                    <div class="card">
                                        <div class="card-header border-0">
                                            <h3 class="card-title">Online Store Overview</h3>
                                            <div class="card-tools">
                                                <a href="#" class="btn btn-sm btn-tool">
                                                    <i class="fas fa-download"></i>
                                                </a>
                                                <a href="#" class="btn btn-sm btn-tool">
                                                    <i class="fas fa-bars"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                                                <p class="text-success text-xl">
                                                    <i class="ion ion-ios-refresh-empty"></i>
                                                </p>
                                                <p class="d-flex flex-column text-right">
                                                    <span class="font-weight-bold">
                                                        <i class="ion ion-android-arrow-up text-success"></i> 12%
                                                    </span>
                                                    <span class="text-muted">CONVERSION RATE</span>
                                                </p>
                                            </div>
                                            <!-- /.d-flex -->
                                            <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                                                <p class="text-warning text-xl">
                                                    <i class="ion ion-ios-cart-outline"></i>
                                                </p>
                                                <p class="d-flex flex-column text-right">
                                                    <span class="font-weight-bold">
                                                        <i class="ion ion-android-arrow-up text-warning"></i> 0.8%
                                                    </span>
                                                    <span class="text-muted">SALES RATE</span>
                                                </p>
                                            </div>
                                            <!-- /.d-flex -->
                                            <div class="d-flex justify-content-between align-items-center mb-0">
                                                <p class="text-danger text-xl">
                                                    <i class="ion ion-ios-people-outline"></i>
                                                </p>
                                                <p class="d-flex flex-column text-right">
                                                    <span class="font-weight-bold">
                                                        <i class="ion ion-android-arrow-down text-danger"></i> 1%
                                                    </span>
                                                    <span class="text-muted">REGISTRATION RATE</span>
                                                </p>
                                            </div>
                                            <!-- /.d-flex -->
                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-md-6 -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- /.content -->
                </div>
                <!-- /.content-wrapper -->

                <!-- Control Sidebar -->
                <aside class="control-sidebar control-sidebar-dark">
                    <!-- Control sidebar content goes here -->
                </aside>
                <!-- /.control-sidebar -->

                <!-- Main Footer -->
                <jsp:include page="WEB-INF/footer.jsp">
                    <jsp:param name="opcion" value="#"/>
                </jsp:include>
        </div>
        <!-- ./wrapper -->

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
        <!-- <script src="dist/js/demo.js"></script>-->
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <!--  <script src="dist/js/pages/dashboard3.js"></script>-->

    </body>
</html>
<script type="text/javascript">
    var ctx = document.getElementById("ventas").getContext('2d');
    var compras = new Chart(ctx, {
    type: 'bar',
            data: {
            labels: [<c:forEach items="${meses}" var="mes" varStatus="status">
            '${mes}'<c:if test="${!status.last}">,</c:if>
    </c:forEach>],
                    datasets: [{
                    label:'Ventas por mes en Bs.',
                            data: [<c:forEach items="${ventas}" var="item" varStatus="status">
        ${item}<c:if test="${!status.last}">,</c:if>
    </c:forEach>],
                            backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)',
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)'
                            ],
                            borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)'
                            ],
                            borderWidth: 1
                    }]
            },
            options: {
            scales: {
            yAxes: [{
            ticks: {
            beginAtZero:true
            }
            }]
            }
            }
    });
    var ctx = document.getElementById("compras").getContext('2d');
    var ventas = new Chart(ctx, {
    type: 'bar',
            data: {
            labels: [<c:forEach items="${mescompra}" var="mesc" varStatus="status">
            '${mesc}'<c:if test="${!status.last}">,</c:if>
    </c:forEach>],
                    datasets: [{
                    label: 'Compras en Bs./ por Mes',
                            data: [<c:forEach items="${compras}" var="compra" varStatus="status">
        ${compra}<c:if test="${!status.last}">,</c:if>
    </c:forEach>],
                            backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)',
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)'
                            ],
                            borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)'
                            ],
                            borderWidth: 1
                    }]
            },
            options: {
            scales: {
            yAxes: [{
            ticks: {
            beginAtZero:true
            }
            }]
            }
            }
    });
</script>


