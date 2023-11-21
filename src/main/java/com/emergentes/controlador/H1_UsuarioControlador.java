package com.emergentes.controlador;

import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "H1_UsuarioControlador", urlPatterns = {"/H1_UsuarioControlador"})
public class H1_UsuarioControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            //Permite evaluar el prametro
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            UsuarioDAO dao = new UsuarioDAOimpl();
            Usuario user = new Usuario();
            int id;

            switch (action) {
                case "add":
                    request.setAttribute("usuario", user);
                    request.getRequestDispatcher("frm_usuario.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("idusuario"));
                    user = dao.getById(id);
                    request.setAttribute("usuario", user);
                    request.getRequestDispatcher("frm_usuario.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("idusuario"));
                    dao.delete(id);
                    response.sendRedirect("H1_UsuarioControlador");
                    break;
                case "view":
                    //obtener la lista de objetos (registros)
                    List<Usuario> lista = dao.getAll();
                    //Ponerlo como atributo de lista
                    request.setAttribute("usuarios", lista);
                    //Pasamos el control
                    request.getRequestDispatcher("h1_usuarios.jsp").forward(request, response);
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

    }
}
