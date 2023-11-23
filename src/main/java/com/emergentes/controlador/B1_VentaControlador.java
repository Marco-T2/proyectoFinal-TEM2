package com.emergentes.controlador;

import com.emergentes.dao.ArticuloDAO;
import com.emergentes.dao.ArticuloDAOimpl;
import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.dao.Detalle_ventaDAO;
import com.emergentes.dao.Detalle_ventaDAOimpl;
import com.emergentes.dao.VentaDAO;
import com.emergentes.dao.VentaDAOimpl;
import com.emergentes.modelo.Articulo;
import com.emergentes.modelo.Detalle_venta;
import com.emergentes.modelo.Persona;
import com.emergentes.modelo.Venta;
import com.emergentes.utiles.ConexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;

@WebServlet(name = "B1_VentaControlador", urlPatterns = {"/B1_VentaControlador"})
public class B1_VentaControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            VentaDAO dao = new VentaDAOimpl();
            ClienteDAO daoCliente = new ClienteDAOimpl();
            ArticuloDAO daoArticulo = new ArticuloDAOimpl();
            int id;
            List<Persona> lista_clientes = null;
            Venta venta = new Venta();

            Detalle_ventaDAO daoDetalleV = new Detalle_ventaDAOimpl();
            //Detalle_venta d_venta = new Detalle_venta();
            List<Detalle_venta> lista1 = null;

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    List<Articulo> lista_articulos = daoArticulo.getAll();
                    request.setAttribute("articulos", lista_articulos);

                    lista_clientes = daoCliente.getAll();
                    request.setAttribute("lista_clientes", lista_clientes);

                    request.setAttribute("venta", venta);
                    request.getRequestDispatcher("frm_venta.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("idventa"));
                    venta = dao.getById(id);
                    lista_clientes = daoCliente.getAll();
                    request.setAttribute("lista_clientes", lista_clientes);
                    // Colocar como atributo
                    request.setAttribute("venta", venta);
                    // Transferir el control a frmventa.jsp
                    request.getRequestDispatcher("frm_venta.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("idventa"));
                    dao.delete(id);
                    response.sendRedirect("B1_VentaControlador");
                    break;
                case "view":
                    //Obtener la lista de registros
                    List<Venta> lista = dao.getAll();
                    request.setAttribute("ventas", lista);
                    request.getRequestDispatcher("b1_ventas.jsp").forward(request, response);
                    break;
                case "detalle_venta":
                    id = Integer.parseInt(request.getParameter("idventa"));
                    lista1 = daoDetalleV.getAllId(id);
                    request.setAttribute("d_ventas", lista1);
                    
                    // Transferir el control a frmventa.jsp
                    venta = dao.getById(id);
                    request.setAttribute("venta", venta);

                    request.getRequestDispatcher("frm_dventas.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("idventa"));
        int idcliente = Integer.parseInt(request.getParameter("idcliente"));
        //int idusuario = Integer.parseInt(request.getParameter("idusuario"));
        int idusuario = 10; //aqui debe remplazar el usuario que tiene en su base de datos
        String tipo_comprobante = request.getParameter("tipo_comprobante");
        String serie_comprobante = request.getParameter("serie_comprobante");
        String num_comprobante = request.getParameter("num_comprobante");
        double total_venta = Double.parseDouble(request.getParameter("total_venta"));
        Date fecha_hora = Date.valueOf(request.getParameter("fecha_hora"));
        String estado = "Aceptado";

        //int iddetalle = Integer.parseInt(request.getParameter("iddetalle_venta"));
        int id_venta = 0;
        String[] idarticulo = request.getParameterValues("idarticulo[]");
        String[] cantidad = request.getParameterValues("cantidad[]");
        String[] precio_venta = request.getParameterValues("precio_venta[]");
        String[] descuento = request.getParameterValues("descuento[]");
        //int idarticulo = Integer.parseInt(request.getParameter("idarticulo[]"));
        // int cantidad = Integer.parseInt(request.getParameter("cantidad[]"));
        //double precio_venta = Double.parseDouble(request.getParameter("precio_venta[]"));
        //double descuento = Double.parseDouble(request.getParameter("descuento[]"));
        /* for (int i = 0; i < idarticulo.length; i++) {
            System.out.println("idarticulo: " + idarticulo[i] + " cantidad: " + cantidad[i] + " precio_venta: " + precio_venta[i] + " descuento: " + descuento[i]);
        }*/

        Venta venta = new Venta();
        venta.setIdventa(id);
        venta.setIdcliente(idcliente);
        venta.setIdusuario(idusuario);
        venta.setTipo_comprobante(tipo_comprobante);
        venta.setSerie_comprobante(serie_comprobante);
        venta.setNum_comprobante(num_comprobante);
        venta.setFecha_hora(fecha_hora);
        venta.setTotal_venta(total_venta);
        venta.setEstado(estado);

        // List<Detalle_venta> detalles = new ArrayList<>();
        Detalle_venta de_venta = new Detalle_venta();
        //de_venta.setIddetalle_venta(iddetalle);
        //de_venta.setIdventa(idventa);
        /*de_venta.setIdarticulo(idarticulo);
        de_venta.setCantidad(cantidad);
        de_venta.setPrecio_venta(precio_venta);
        de_venta.setDescuento(descuento);*/
        if (id == 0) {
            //Nuevo
            VentaDAO dao = new VentaDAOimpl();
            Detalle_ventaDAO daoDV = new Detalle_ventaDAOimpl();
            try {
                // Nuevo registro
                id_venta = dao.insert(venta);
                //venta.setIdventa(id_venta);
                System.out.println("id de venta: " + id_venta);
                // registrando detalle de venta
                String url = "jdbc:mysql://localhost:3306/db_sistema"; // Esta variable contiene la dirección de la base de datos
                String user = "root"; // Esta variable contiene el nombre de usuario
                String password = ""; // Esta variable contiene la contraseña
                Connection conn = DriverManager.getConnection(url, user, password);
                PreparedStatement dv = conn.prepareStatement("INSERT INTO detalle_venta (idventa,idarticulo,cantidad,precio_venta,descuento) values (?,?,?,?,?)");

                for (int i = 0; i < idarticulo.length; i++) {
                    dv.setInt(1, id_venta);
                    dv.setInt(2, (Integer.parseInt(idarticulo[i])));
                    dv.setInt(3, (Integer.parseInt(cantidad[i])));
                    dv.setInt(4, (Integer.parseInt(precio_venta[i])));
                    dv.setInt(5, (Integer.parseInt(descuento[i])));
                    dv.executeUpdate();
                    /*de_venta.setIdventa(id_venta);
                    de_venta.setIdarticulo(Integer.parseInt(idarticulo[i]));
                    de_venta.setCantidad(Integer.parseInt(cantidad[i]));
                    de_venta.setPrecio_venta(Double.parseDouble(precio_venta[i]));
                    de_venta.setDescuento(Double.parseDouble(descuento[i]));*/

                    System.out.println("contador: " + i);
                }
                // daoDV.insert(de_venta);

                response.sendRedirect("B1_VentaControlador");
                dv.close(); // Cerrar el objeto que contiene la sentencia SQL preparada
                conn.close();
            } catch (Exception ex) {
                System.out.println("Error al insertar " + ex.getMessage());
            }
        } else {
            //Editar
            VentaDAO dao = new VentaDAOimpl();
            try {
                dao.update(venta);
                response.sendRedirect("D1_ArticuloControlador");
            } catch (Exception ex) {
                System.out.println("Error al editar" + ex.getMessage());
            }
        }

    }

}
