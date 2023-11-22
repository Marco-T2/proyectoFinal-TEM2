package com.emergentes.controlador;

import com.emergentes.dao.ArticuloDAO;
import com.emergentes.dao.ArticuloDAOimpl;
import com.emergentes.dao.CategoriaDAO;
import com.emergentes.dao.CategoriaDAOimpl;
import com.emergentes.modelo.Articulo;
import com.emergentes.modelo.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "D1_ArticuloControlador", urlPatterns = {"/D1_ArticuloControlador"})
public class D1_ArticuloControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ArticuloDAO dao = new ArticuloDAOimpl();
            CategoriaDAO daoCat = new CategoriaDAOimpl();
            int id;
            List<Categoria> lista_categorias = null;
            Articulo articulo = new Articulo();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    lista_categorias = daoCat.getAll();
                    request.setAttribute("lista_categorias", lista_categorias);
                    request.setAttribute("articulo", articulo);
                    request.getRequestDispatcher("frm_articulo.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("idarticulo"));
                    articulo = dao.getById(id);
                    lista_categorias = daoCat.getAll();
                    request.setAttribute("lista_categorias", lista_categorias);
                    // Colocar como atributo
                    request.setAttribute("articulo", articulo);
                    // Transferir el control a frmventa.jsp
                    request.getRequestDispatcher("frm_articulo.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("idarticulo"));
                    dao.delete(id);
                    response.sendRedirect("D1_ArticuloControlador");
                    break;
                case "view":
                    //Obtener la lista de registros
                    List<Articulo> lista = dao.getAll();
                    request.setAttribute("articulos", lista);
                    request.getRequestDispatcher("d1_articulos.jsp").forward(request, response);
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
        int stock =Integer.parseInt( request.getParameter("stock"));
        String descripcion = request.getParameter("descripcion");
        String imagen = "";
        int condicion = 1;
        int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
        Articulo articulo = new Articulo();
        articulo.setIdarticulo(id);
        articulo.setCodigo(codigo);
        articulo.setNombre(nombre);
        articulo.setStock(stock);
        articulo.setDescripcion(descripcion);
        articulo.setImagen(imagen);
        articulo.setCondicion(condicion);
        articulo.setIdcategoria(idcategoria);
        if (id == 0) {
            //Nuevo
            ArticuloDAO dao = new ArticuloDAOimpl();
            try {
                // Nuevo registro
                dao.insert(articulo);
                response.sendRedirect("D1_ArticuloControlador");
            } catch (Exception ex) {
                System.out.println("Error al insertar " + ex.getMessage());
            }
        } else {
            //Editar
            ArticuloDAO dao = new ArticuloDAOimpl();
            try {
                dao.update(articulo);
                response.sendRedirect("D1_ArticuloControlador");
            } catch (Exception ex) {
                System.out.println("Error al editar" + ex.getMessage());
            }
        }
    }
}
