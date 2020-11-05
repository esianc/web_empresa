/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;
import modelo.Ventas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Erick
 */
public class sr_ventas extends HttpServlet {
    Ventas ventas;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_ventas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sr_ventas at " + request.getContextPath() + "</h1>");
            ventas = new Ventas(request.getParameter("drop_series"),request.getParameter("txt_fecha"),request.getParameter("txt_nitc"),request.getParameter("txt_nombresc"),Integer.valueOf(request.getParameter("txt_numero")),Integer.valueOf(request.getParameter("txt_idempl")),Integer.valueOf(request.getParameter("txt_idclie")),Integer.valueOf(request.getParameter("txt_numero")));
            
            //boton ultimo    
                if ("ultimo".equals(request.getParameter("btn_ultimo"))){
                if (ventas.ultimo()>0){
                response.sendRedirect("ventas.jsp");
                } else {
                    out.println("<h1>No se ingreso</h1>");
                    out.println("<a href='index.jsp'>Regresar</a>");
                }
                }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
