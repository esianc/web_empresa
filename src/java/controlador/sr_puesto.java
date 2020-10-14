/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Puestos;

/**
 *
 * @author Erick
 */
public class sr_puesto extends HttpServlet {
    Puestos puesto;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_puesto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sr_puesto at " + request.getContextPath() + "</h1>");
            
            puesto = new Puestos(request.getParameter("txt_puesto"),Integer.valueOf(request.getParameter("txt_idp")));
            
                //boton agregar    
                if ("agregar".equals(request.getParameter("btn_agregar"))){
                if (puesto.agregar()>0){
                response.sendRedirect("index.jsp");
                } else {
                    out.println("<h1>No se ingreso</h1>");
                    out.println("<a href='menu.jsp'>Regresar</a>");
                }
                }
            
            //boton modificar    
                if ("modificar".equals(request.getParameter("btn_modificar"))){
                if (puesto.modificar()>0){
                response.sendRedirect("index.jsp");
                } else {
                    out.println("<h1>No se actualizó</h1>");
                    out.println("<a href='index.jsp'>Regresar</a>");
                }
                }
                
            //boton eliminar    
                if ("eliminar".equals(request.getParameter("btn_eliminar"))){
                if (puesto.eliminar()>0){
                response.sendRedirect("index.jsp");
                } else {
                    out.println("<h1>No se eliminó</h1>");
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
