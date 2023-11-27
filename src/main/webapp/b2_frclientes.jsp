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
                                                <a href="B2_ClienteControlador?action=view">
                                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal-lg">
                                                        Regresar
                                                    </button>
                                                </a>
                                            </div>                                                            
                                        </div>    
                                    </div>                                                    
                                    <form action="B2_ClienteControlador" method="post">
                                        <input type="hidden" name="idpersona" value="${cliente.idpersona}">

                                        <div class="card-body">
                                            <div class="form-group">
                                                <label>Tipo persona</label>
                                                <input type="text" name="tipo_persona" value="${cliente.tipo_persona != null ? 'Cliente' : cliente.tipo_persona}" class="form-control"  readonly>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <!-- text input -->
                                                    <div class="form-group">
                                                        <label>Nombre Apellido</label>
                                                        <input type="text" name="nombre" value="${cliente.nombre}" class="form-control" placeholder="Ingresa el nombre">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <!-- text input -->
                                                    <div class="form-group">
                                                        <label>Carnet de Identidad</label>
                                                        <input type="number" name="ci_documento" value="${cliente.ci_documento}" class="form-control" placeholder="Ingresa tu CI">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <!-- text input -->
                                                    <div class="form-group">
                                                        <label>Direccion</label>
                                                        <input type="text" name="direccion" value="${cliente.direccion}" class="form-control" placeholder="Ingresa el departamento">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <!-- text input -->
                                                    <div class="form-group">
                                                        <label>Telefono</label>
                                                        <input type="number" name="telefono" value="${cliente.telefono}" class="form-control" placeholder="Ingresa Nro telefono o Celular">
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>Correo</label>
                                                <input type="email" name="email" value="${cliente.email}" class="form-control" placeholder="Ingresa tu correo">
                                            </div>
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="submit" class="btn btn-primary">Guardar</button>
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

<jsp:include page="WEB-INF/footer.jsp"/>