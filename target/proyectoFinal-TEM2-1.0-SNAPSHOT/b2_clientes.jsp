<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/header.jsp"/>

<jsp:include page="WEB-INF/sidebarMenu.jsp">
    <jsp:param name="opcion" value="b2_clientes"/>
</jsp:include>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Clientes</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Ventas</a></li>
                        <li class="breadcrumb-item active">Clientes</li>
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
                                <h3 class="card-title">Tabla de clientes</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="dt-buttons btn-group flex-wrap">
                                                <a href="B2_ClienteControlador?action=add">
                                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-lg">
                                                        Nuevo
                                                    </button>
                                                </a>
                                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                    <a href="reportes/b2_reporteClientes.jsp">
                                                        <button type="button" class="btn btn-success">
                                                            <i class="fa fa-table" aria-hidden="true"></i> Descargar xml
                                                            <i class="fa fa-arrow-down" aria-hidden="true"></i>

                                                        </button>
                                                    </a>
                                                </div>  
                                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                    <a href="B2_ClienteControlador?action=repClientes" target="_blank">
                                                        <button type="button" class="btn btn-secondary">
                                                            <i class="fa fa-file" aria-hidden="true"></i> Descargar PDF
                                                            <i class="fa fa-arrow-down" aria-hidden="true"></i>
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
                                                <thead>
                                                    <tr>
                                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Id</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Tipo Pesona</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">Nombre</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">CI</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Direccion</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Telefono</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Email</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending"></th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="item" items="${clientes}">
                                                        <tr class="odd">
                                                            <td class="dtr-control sorting_1" tabindex="0">${item.idpersona}</td>
                                                            <td>${item.tipo_persona}</td>
                                                            <td>${item.nombre}</td>
                                                            <td>${item.ci_documento}</td>
                                                            <td>${item.direccion}</td>
                                                            <td>${item.telefono}</td>
                                                            <td>${item.email}</td>
                                                            <td><a href="B2_ClienteControlador?action=edit&idpersona=${item.idpersona}"><i class="fa-solid fa-pen-to-square"><ion-icon name="create-outline"></ion-icon></i></a></td>
                                                            <td><a href="B2_ClienteControlador?action=delete&idpersona=${item.idpersona}"onclick="return(confirm('Estas seguro de eliminar'))"><i class="fa-solid fa-trash-can"><ion-icon name="trash-outline"></ion-icon></i></a></td>
                                                        </tr>                                                                   
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

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

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->

<!-- Main Footer -->
<footer class="main-footer">
    <strong>Copyright &copy; 2023 <a href="https://adminlte.io">TEM - 2</a>.</strong>
    Todos los derechos reservados.
    <div class="float-right d-none d-sm-inline-block">
        <b>Version</b> 0.1.0
    </div>
</footer>
</div>


<!-- MODAL -->
<div class="modal fade" id="modal-lg">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Informacion cliente</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="#" method="post">
                <input type="hidden" name="id" value="${cliente.idpersona}">
                <div class="modal-body">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Tipo persona</label>
                            <input type="text" value="${cliente.tipo_persona}" class="form-control" placeholder="Enter ...">
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <!-- text input -->
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <input type="text" value="${cliente.nombre}" class="form-control" placeholder="Enter ...">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <!-- text input -->
                                <div class="form-group">
                                    <label>Carnet de Identidad</label>
                                    <input type="text" value="${cliente.ci_documento}" class="form-control" placeholder="Enter ...">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <!-- text input -->
                                <div class="form-group">
                                    <label>Direccion</label>
                                    <input type="text" value="${cliente.direccion}" class="form-control" placeholder="Enter ...">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <!-- text input -->
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <input type="text" value="${cliente.telefono}" class="form-control" placeholder="Enter ...">
                                </div>
                            </div>
                        </div>
                        <!-- text input -->
                        <div class="form-group">
                            <label>Correo</label>
                            <input type="text" value="${cliente.email}" class="form-control" placeholder="Enter ...">
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </form>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <jsp:include page="WEB-INF/footer.jsp"/>