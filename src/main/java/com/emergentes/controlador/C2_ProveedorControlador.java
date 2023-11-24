/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.emergentes.controlador;

import com.emergentes.dao.ProveedorDAO;
import com.emergentes.dao.ProveedorDAOimpl;
import com.emergentes.modelo.Persona;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import java.io.IOException;
import java.io.OutputStream;
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
@WebServlet(name = "C2_ProveedorControlador", urlPatterns = {"/C2_ProveedorControlador"})
public class C2_ProveedorControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Permite evaluar el prametro
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            ProveedorDAO dao = new ProveedorDAOimpl();
            Persona per = new Persona();
            int id;

            switch (action) {
                case "add":
                    request.setAttribute("proveedor", per);
                    request.getRequestDispatcher("c2_frproveedores.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("idpersona"));
                    per = dao.getById(id);
                    request.setAttribute("proveedor", per);
                    request.getRequestDispatcher("c2_frproveedores.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("idpersona"));
                    dao.delete(id);
                    response.sendRedirect("C2_ProveedorControlador");
                    break;
                case "view":
                    //obtener la lista de objetos (registros)
                    List<Persona> lista = dao.getAll();
                    //Ponerlo como atributo de lista
                    request.setAttribute("proveedores", lista);
                    //Pasamos el control
                    request.getRequestDispatcher("c2_proveedores.jsp").forward(request, response);
                    break;
                case "repProveedores":
                    generarReporteProveedores(response);
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

        ProveedorDAO dao = new ProveedorDAOimpl();
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
        response.sendRedirect("C2_ProveedorControlador");

    }

    private void generarReporteProveedores(HttpServletResponse response) throws IOException, Exception {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=reporte_empresa.pdf");

        OutputStream out = response.getOutputStream();
// Configurar los márgenes del documento (en puntos)
        float marginLeft = 36; // Márgen izquierdo en puntos
        float marginRight = 36; // Márgen derecho en puntos
        float marginTop = 72; // Márgen superior en puntos
        float marginBottom = 72; // Márgen inferior en puntos
        try {
            Document documento = new Document(PageSize.A4.rotate(), marginLeft, marginRight, marginTop, marginBottom);

            //PdfWriter.getInstance(documento, new FileOutputStream("ruta/del/archivo.pdf"));
            documento.open();

            // Insertar HTML en el PDF usando HtmlConverter de iText
            String htmlContent = "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "<head>\n"
                    + "<title>Reporte de Empresa</title>\n"
                    + "<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n"
                    + "<style>\n"
                    + ".company-info h3 {\n"
                    + "   margin-top: 0; /* Elimina el espacio superior */\n"
                    + "}\n"
                    + ".company-logo img {\n"
                    + "   max-width: 100px; /* Ajusta el ancho máximo de la imagen */\n"
                    + "   height: auto; /* Mantén la relación de aspecto */\n"
                    + "}\n"
                    + ".center-text {\n"
                    + "   text-align: center; /* Centra el texto horizontalmente */\n"
                    + "}\n"
                    + "</style>\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "<div class=\"container\">\n"
                    + "<div class=\"row\">\n"
                    + // Fila para el logo
                    "<div class=\"col-md-12\">\n"
                    + "<div class=\"company-logo text-center\">\n"
                    + "<img src=\"https://www.innovaweb.cl/wp-content/uploads/2018/10/logo2-1.png\" alt=\"Logo de la Empresa\" class=\"img-fluid\">\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "<div class=\"row\">\n"
                    + // Fila para la información de la empresa
                    "<div class=\"col-md-12\">\n"
                    + "<div class=\"company-info\">\n"
                    + "<h3>Universidad publica del El Alto</h3>\n"
                    + "<p>La Paz</p>\n"
                    + "<p>Teléfono: 123-456-7890</p>\n"
                    + "<p>Correo electrónico: tem2@sisempresa.com</p>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "<div class=\"row\">\n"
                    + // Fila para el reporte de ventas
                    "<div class=\"col-md-12 center-text\">\n" // Agrega la clase center-text
                    + "<h2>Reporte clientes</h2>\n"
                    + "<table class=\"table table-bordered table-striped\">\n"
                    + "<thead class=\"thead-dark\">\n"
                    + "<tr>\n"
                    + "<th scope=\"col\" style=\"font-size: 13px; text-align: center;\">Id</th>\n"
                    + "<th scope=\"col\" style=\"font-size: 13px; text-align: center;\">Tipo Persona</th>\n"
                    + "<th scope=\"col\" style=\"font-size: 13px; text-align: center;\">Nombre</th>\n"
                    + "<th scope=\"col\" style=\"font-size: 13px; text-align: center;\">CI</th>\n"
                    + "<th scope=\"col\" style=\"font-size: 13px; text-align: center;\">Dirección</th>\n"
                    + "<th scope=\"col\" style=\"font-size: 13px; text-align: center;\">Teléfono</th>\n"
                    + "<th scope=\"col\" style=\"font-size: 13px; text-align: center;\">Email</th>\n"
                    + "</tr>\n"
                    + "</thead>\n"
                    + "<tbody>\n";

            ProveedorDAO dao = new ProveedorDAOimpl();
            List<Persona> lista1 = dao.getAll();
            for (Persona per : lista1) {
                htmlContent += "<tr>\n"
                        + "<td style=\"font-size: 12px;\">" + per.getIdpersona() + "</td>\n"
                        + "<td style=\"font-size: 12px;\">" + per.getTipo_persona() + "</td>\n"
                        + "<td style=\"font-size: 12px;\">" + per.getNombre() + "</td>\n"
                        + "<td style=\"font-size: 12px;\">" + per.getCi_documento() + "</td>\n"
                        + "<td style=\"font-size: 12px;\">" + per.getDireccion() + "</td>\n"
                        + "<td style=\"font-size: 12px;\">" + per.getTelefono() + "</td>\n"
                        + "<td style=\"font-size: 12px;\">" + per.getEmail() + "</td>\n"
                        + "</tr>\n";
            }

            java.util.Date fechaActual = new java.util.Date();
            java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String fechaHora = formato.format(fechaActual);

            htmlContent += "</tbody>\n"
                    + "</table>\n"
                    + "<p style=\"text-align: left; font-size: 10px;\">Reporte generado el: " + fechaHora + "</p>\n"
                    + // Agregar la fecha y hora al final
                    "</div>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "</body>\n"
                    + "</html>";

            // Convertir HTML a PDF y agregarlo al documento
            HtmlConverter.convertToPdf(htmlContent, out);

            documento.close();
        } catch (DocumentException ex) {
        }
    }

    private PdfPCell getStyledCell(Object content, Font font, PdfPCell cell) {
        cell.setPhrase(new Phrase(String.valueOf(content), font));
        cell.setMinimumHeight(10); // Ajusta la altura mínima de la celda según tus necesidades
        return cell;
    }

}

