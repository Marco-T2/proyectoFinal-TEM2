package com.emergentes.controlador;

import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioControlador", urlPatterns = {"/UsuarioControlador"})
public class UsuarioControlador extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            UsuarioDAO dao = new UsuarioDAOimpl();
            Usuario usu = new Usuario();
            int id;
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    request.setAttribute("usuario", usu);
                    request.getRequestDispatcher("areaUsuarios.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    try {
                        // obtener el objeto que corresponde al registro
                        usu = dao.getById(id);
                    } catch (Exception ex) {
                        System.out.println("Error al obtener registro " + ex.getMessage());
                    }
                    //clocar como atributo
                    request.setAttribute("cliente", usu);
                    //Transformar el control a frmaviso.jsp
                    request.getRequestDispatcher("frmcliente.jsp").forward(request, response);
                    break;

                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    try {
                        dao.delete(id);
                    } catch (Exception ex) {
                        System.out.println("Error al eliminar: " + ex.getMessage());
                    }
                    response.sendRedirect("UsuarioControlador");
                    break;

                case "view":
                    List<Usuario> lista = new ArrayList<Usuario>();
                    try {
                        //lista = dao.getAll();
                    } catch (Exception ex) {
                        System.out.println("Error al listar: " + ex.getMessage());
                    }
                   // request.setAttribute("usuarios", lista);
                    request.getRequestDispatcher("areaUsuarios.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
            
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

}
