package com.emergentes.controlador;

import com.emergentes.dao.ArticuloDAO;
import com.emergentes.dao.ArticuloDAOimpl;
import com.emergentes.dao.Detalle_ingresoDAO;
import com.emergentes.dao.Detalle_ingresoDAOimpl;
import com.emergentes.dao.IngresoDAO;
import com.emergentes.dao.IngresoDAOimpl;
import com.emergentes.dao.ProveedorDAO;
import com.emergentes.dao.ProveedorDAOimpl;
import com.emergentes.modelo.Articulo;
import com.emergentes.modelo.Detalle_ingreso;
import com.emergentes.modelo.Ingreso;
import com.emergentes.modelo.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "IngresoControlador", urlPatterns = {"/IngresoControlador"})
public class IngresoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            IngresoDAO dao = new IngresoDAOimpl();
            ProveedorDAO daoProveedor = new ProveedorDAOimpl();
            ArticuloDAO daoArticulo = new ArticuloDAOimpl();
            int id;
            List<Persona> lista_proveedores = null;

            Ingreso ingreso = new Ingreso();
            Detalle_ingresoDAO daoDetalleI = new Detalle_ingresoDAOimpl();
            List<Detalle_ingreso> lista1 = null;
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    List<Articulo> lista_articulos = daoArticulo.getAll();
                    request.setAttribute("articulos", lista_articulos);

                    lista_proveedores = daoProveedor.getAll();
                    request.setAttribute("lista_proveedores", lista_proveedores);

                    request.setAttribute("ingreso", ingreso);
                    request.getRequestDispatcher("frm_ingreso.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("idingreso"));
                    ingreso = dao.getById(id);
                    lista_proveedores = daoProveedor.getAll();
                    request.setAttribute("lista_proveedores", lista_proveedores);
                    // Colocar como atributo
                    request.setAttribute("ingreso", ingreso);
                    // Transferir el control a frmventa.jsp
                    request.getRequestDispatcher("frm_ingreso.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("idingreso"));
                    dao.delete(id);
                    response.sendRedirect("IngresoControlador");
                    break;
                case "view":
                    List<Ingreso> lista = dao.getAll();
                    request.setAttribute("ingresos", lista);
                    request.getRequestDispatcher("v_ingresos.jsp").forward(request, response);
                    break;
                case "detalle_venta":
                    id = Integer.parseInt(request.getParameter("idingreso"));
                    lista1 = daoDetalleI.getAllId(id);
                    request.setAttribute("d_ingresos", lista1);

                    ingreso = dao.getById(id);
                    request.setAttribute("ingreso", ingreso);

                    request.getRequestDispatcher("frm_dingresos.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error Fatal" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //datos para el registro de la tabla ingreso
        int id = Integer.parseInt(request.getParameter("idingreso"));
        int idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
        //int idusuario = Integer.parseInt(request.getParameter("idusuario"));
        int idusuario = Integer.parseInt(request.getParameter("idusuario"));
        String tipo_comprobante = request.getParameter("tipo_comprobante");
        String serie_comprobante = request.getParameter("serie_comprobante");
        String num_comprobante = request.getParameter("num_comprobante");
        Date fecha_hora = Date.valueOf(request.getParameter("fecha_hora"));
        double total_compra = Double.parseDouble(request.getParameter("total_compra"));
        String estado = "Aceptado";
        // datos para el registro de la tabla detalle_ingreso
        //int iddetalle = Integer.parseInt(request.getParameter("iddetalle_venta"));
        int id_ingreso = 0;
        String[] idarticulo = request.getParameterValues("idarticulo[]");
        String[] cantidad = request.getParameterValues("cantidad[]");
        String[] precio_compra = request.getParameterValues("precio_compra[]");
        String[] precio_venta = request.getParameterValues("precio_venta[]");
       
        Ingreso ingreso = new Ingreso();
        ingreso.setIdingreso(id);
        ingreso.setIdproveedor(idproveedor);
        ingreso.setIdusuario(idusuario);
        ingreso.setTipo_comprobante(tipo_comprobante);
        ingreso.setSerie_comprobante(serie_comprobante);
        ingreso.setNum_comprobante(num_comprobante);
        ingreso.setFecha_hora(fecha_hora);
        ingreso.setTotal_compra(total_compra);
        ingreso.setEstado(estado);

        Detalle_ingreso de_ingreso = new Detalle_ingreso();
        
        if (id == 0) {
            IngresoDAO dao = new IngresoDAOimpl();
            Detalle_ingresoDAO daoDI = new Detalle_ingresoDAOimpl();
            try {
                // Nuevo registro
                id_ingreso = dao.insert(ingreso);
                // conexion para registar el detalle
                String url = "jdbc:mysql://localhost:3306/db_sistema"; // Esta variable contiene la dirección de la base de datos
                String user = "root"; // Esta variable contiene el nombre de usuario
                String password = ""; // Esta variable contiene la contraseña
                Connection conn = DriverManager.getConnection(url, user, password);
                PreparedStatement di = conn.prepareStatement("INSERT INTO detalle_ingreso (idingreso,idarticulo,cantidad,precio_compra,precio_venta) values (?,?,?,?,?)");

                for (int i = 0; i < idarticulo.length; i++) {
                    di.setInt(1, id_ingreso);
                    di.setInt(2, (Integer.parseInt(idarticulo[i])));
                    di.setInt(3, (Integer.parseInt(cantidad[i])));
                    di.setDouble(4, (Double.parseDouble(precio_compra[i])));
                    di.setDouble(5, (Double.parseDouble(precio_venta[i])));
                    di.executeUpdate();
                }
                response.sendRedirect("IngresoControlador");
                di.close(); // Cerrar el objeto que contiene la sentencia SQL preparada
                conn.close();
            } catch (Exception ex) {
                System.out.println("Error al insertar " + ex.getMessage());
            }
        } else {
            //Editar
            IngresoDAO dao = new IngresoDAOimpl();
            try {
                dao.update(ingreso);
                response.sendRedirect("IngresoControlador");
            } catch (Exception ex) {
                System.out.println("Error al editar" + ex.getMessage());
            }
        }
    }
}
