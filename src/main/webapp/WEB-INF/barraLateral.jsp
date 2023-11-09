<%
    String opcion = request.getParameter("opcion");
%>

<ul class="side-menu top">
    <li class="nav-link <%=(opcion.equals("areaDashboard") ? "active" : "")%>">
        <a href="DashboardControlador">
            <i class='bx bxs-dashboard' ></i>
            <span class="text">Dashboard</span>
        </a>
    </li>
    <li class="nav-link <%=(opcion.equals("areaVentas") ? "active" : "")%>">
        <a href="VentaControlador">
            <i class='bx bxs-shopping-bag-alt' ></i>
            <span class="text">Ventas</span>
        </a>
    </li>
    <li class="nav-link <%=(opcion.equals("Operaciones") ? "active" : "")%>">
        <a href="">
            <i class='bx bxs-doughnut-chart' ></i>
            <span class="text">Operaciones</span>
        </a>
    </li>
    <li class="nav-link <%=(opcion.equals("Consultas") ? "active" : "")%>">
        <a href="">
            <i class='bx bxs-group' ></i>
            <span class="text">Consultas</span>
        </a>
    </li>
    <li class="nav-link <%=(opcion.equals("Informes") ? "active" : "")%>">
        <a href="">
            <i class='bx bxs-group' ></i>
            <span class="text">Informes</span>
        </a>
    </li>
</ul>
<ul class="side-menu top">
    <li class="nav-link <%=(opcion.equals("Ajustes") ? "active" : "")%>">
        <a href="">
            <i class='bx bxs-cog' ></i>
            <span class="text">Ajustes</span>
        </a>
    </li>
    <li class="nav-link <%=(opcion.equals("areaUsuarios") ? "active" : "")%>">
        <a href="UsuarioControlador">
            <i class='bx bxs-group' ></i>
            <span class="text">Usuarios</span>
        </a>
    </li>
</ul>