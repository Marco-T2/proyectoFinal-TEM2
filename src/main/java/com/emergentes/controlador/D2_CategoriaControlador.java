package com.emergentes.controlador;

import com.emergentes.dao.CategoriaDAO;
import com.emergentes.dao.CategoriaDAOimpl;
import com.emergentes.modelo.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "D2_CategoriaControlador", urlPatterns = {"/D2_CategoriaControlador"})
public class D2_CategoriaControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Permite evaluar el prametro
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            CategoriaDAO dao = new CategoriaDAOimpl();
            Categoria cat = new Categoria();
            int id;
            switch (action) {
                case "add":
                    request.setAttribute("categoria", cat);
                    request.getRequestDispatcher("frm_categoria.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("idcategoria"));
                    cat = dao.getById(id);
                    request.setAttribute("categoria", cat);
                    request.getRequestDispatcher("frm_categoria.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("idcategoria"));
                    dao.delete(id);
                    response.sendRedirect("D2_CategoriaControlador");
                    break;
                case "view":
                    //obtener la lista de objetos (registros)
                    List<Categoria> lista = dao.getAll();
                    //Ponerlo como atributo de lista
                    request.setAttribute("categorias", lista);
                    //Pasamos el control
                    request.getRequestDispatcher("d2_categorias.jsp").forward(request, response);
                    break;
                default:

                    break;
            }
        } catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        int condicion = 1;
        Categoria cat = new Categoria();
        cat.setIdcategoria(idcategoria);
        cat.setNombre(nombre);
        cat.setDescripcion(descripcion);
        cat.setCondicion(condicion);
        CategoriaDAO dao = new CategoriaDAOimpl();
        if (idcategoria == 0) {
            try {
                // Nuevo registro
                dao.insert(cat);
            } catch (Exception ex) {
                System.out.println("Error al insertar " + ex.getMessage());
            }
        } else {
            try {
                // Edicion de registro
                dao.update(cat);
            } catch (Exception ex) {
                System.out.println("Error al editar " + ex.getMessage());
            }
        }
        response.sendRedirect("D2_CategoriaControlador");
    }

}
