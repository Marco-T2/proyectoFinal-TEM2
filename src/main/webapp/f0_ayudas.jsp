<%
    if(session.getAttribute("usuario")!=null){
   
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/header.jsp"/>

<jsp:include page="WEB-INF/sidebarMenu.jsp">
    <jsp:param name="opcion" value="f0_ayudas"/>
</jsp:include>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Ayuda</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <section class="content">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Tabla de clientes</h3>
                    </div><!-- comment -->
                    <div class="card-body"> 
                        <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">   
                                <div class="col-ms-12">
                                    <h1>Aqui ira el contenido de la ayuda.. completar</h1>  
                                </div>
                            </div>
                        </div>
                    </div>

                </div><!-- comment -->
            </div><!-- comment -->
            <!-- /.container-fluid -->
        </section>
    </div>
    <!-- /.Main content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="WEB-INF/footer.jsp"/>
<%}else{
response.sendRedirect("login.jsp");
    }
%>