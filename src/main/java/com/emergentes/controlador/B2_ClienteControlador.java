/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.emergentes.controlador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.modelo.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author marco
 */
@WebServlet(name = "B2_ClienteControlador", urlPatterns = {"/B2_ClienteControlador"})
public class B2_ClienteControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Permite evaluar el prametro
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            ClienteDAO dao = new ClienteDAOimpl();
            Persona per = new Persona();
            int id;

            switch (action) {
                case "add":
                    request.setAttribute("cliente", per);
                    request.getRequestDispatcher("b2_frclientes.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("idpersona"));
                    per = dao.getById(id);
                    request.setAttribute("cliente", per);
                    request.getRequestDispatcher("b2_frclientes.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("idpersona"));
                    dao.delete(id);
                    response.sendRedirect("B2_ClienteControlador");
                    break;
                case "view":
                    //obtener la lista de objetos (registros)
                    List<Persona> lista = dao.getAll();
                    //Ponerlo como atributo de lista
                    request.setAttribute("clientes", lista);
                    //Pasamos el control
                    request.getRequestDispatcher("b2_clientes.jsp").forward(request, response);
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
       
        int idpersona = Integer.parseInt(request.getParameter("idpersona"));
        String tipo_persona = request.getParameter("tipo_persona");
        String nombre = request.getParameter("nombre");
        String ci_documento = request.getParameter("ci_documento");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");

        Persona per = new Persona();

        per.setIdpersona(idpersona);
        per.setTipo_persona(tipo_persona);
        per.setNombre(nombre);
        per.setCi_documento(ci_documento);
        per.setDireccion(direccion);
        per.setTelefono(telefono);
        per.setEmail(email);

        ClienteDAO dao = new ClienteDAOimpl();
        if (idpersona == 0) {
            try {
                // Nuevo registro
                dao.insert(per);
            } catch (Exception ex) {
                System.out.println("Error al insertar " + ex.getMessage());
            }
        } else {
            try {
                // Edicion de registro
                dao.update(per);
            } catch (Exception ex) {
                System.out.println("Error al editar " + ex.getMessage());
            }
        }
        response.sendRedirect("B2_ClienteControlador");

    }

}
