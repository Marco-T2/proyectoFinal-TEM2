
package com.emergentes.controlador;

import com.emergentes.utiles.Validate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Recuperamos los parametros enviados desde el LOGIN>JSP
        String login=request.getParameter("login");
        String clave = request.getParameter("clave");
      
        String usuario="";
        String rol;
                
        //Verificar lode datos de inicio
        Validate v = new Validate();
        if(v.checkUser(login, clave)){
            //System.out.println("Todo ok");
            HttpSession ses = request.getSession();
            ses.setAttribute("login", "OK");
            ses.setAttribute("usuario",login);
            
             
            //ses.setAttribute("login", usuario);
            response.sendRedirect("A0_IndexControlador");
        }
        else{
            //System.out.println("Incorrecto ");
            response.sendRedirect("login.jsp");
        }
       
    }


}
