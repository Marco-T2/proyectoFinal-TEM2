package com.emergentes.controlador;

import com.emergentes.dao.IngresoDAO;
import com.emergentes.dao.IngresoDAOimpl;
import com.emergentes.dao.VentaDAO;
import com.emergentes.dao.VentaDAOimpl;
import com.emergentes.modelo.Venta;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "A0_IndexControlador", urlPatterns = {"/A0_IndexControlador"})
public class A0_IndexControlador1 extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Vector<Double> vector = new Vector<>();
        Vector<String> meses = new Vector<>();

        Vector<Double> compras = new Vector<>();
        Vector<String> mescompra = new Vector<>();
        try {       //Permite evaluar el prametro
            Venta venta = new Venta();
            VentaDAO dao = new VentaDAOimpl();
            VentaDAO daoMes = new VentaDAOimpl();

            IngresoDAO daoCompraMeses = new IngresoDAOimpl();
            IngresoDAO daoMesC = new IngresoDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "view":
                    // ventas
                    vector = dao.getVentaMes();
                    request.setAttribute("ventas", vector);

                    meses = daoMes.getMes();
                    request.setAttribute("meses", meses);

                    // todo para compras
                    compras = daoCompraMeses.getCompraMes();
                    request.setAttribute("compras", compras);

                    mescompra = daoMesC.getMesC();
                    request.setAttribute("mescompra", mescompra);

                    request.getRequestDispatcher("a0_index.jsp").forward(request, response);

                    break;
                default:

                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error Fatal" + ex.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
