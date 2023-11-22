package com.emergentes.controlador;

import com.emergentes.dao.ArticuloDAO;
import com.emergentes.dao.ArticuloDAOimpl;
import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.dao.VentaDAO;
import com.emergentes.dao.VentaDAOimpl;
import com.emergentes.modelo.Articulo;
import com.emergentes.modelo.Persona;
import com.emergentes.modelo.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        int id = Integer.parseInt(request.getParameter("idarticulo"));
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        int stock = Integer.parseInt(request.getParameter("stock"));
        String descripcion = request.getParameter("descripcion");
        String imagen = "";
        int condicion = 1;
        int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
        Venta articulo = new Venta();
        /*articulo.setIdarticulo(id);
        articulo.setCodigo(codigo);
        articulo.setNombre(nombre);
        articulo.setStock(stock);
        articulo.setDescripcion(descripcion);
        articulo.setImagen(imagen);
        articulo.setCondicion(condicion);
        articulo.setIdcategoria(idcategoria);*/
        if (id == 0) {
            //Nuevo
            VentaDAO dao = new VentaDAOimpl();
            try {
                // Nuevo registro
                dao.insert(articulo);
                response.sendRedirect("D1_ArticuloControlador");
            } catch (Exception ex) {
                System.out.println("Error al insertar " + ex.getMessage());
            }
        } else {
            //Editar
            VentaDAO dao = new VentaDAOimpl();
            try {
                dao.update(articulo);
                response.sendRedirect("D1_ArticuloControlador");
            } catch (Exception ex) {
                System.out.println("Error al editar" + ex.getMessage());
            }
        }
    }

}
