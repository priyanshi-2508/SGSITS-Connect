/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgsits.connect.servlet;

import com.sgsits.connect.dao.PostDAO;
import com.sgsits.connect.entities.Post;
import com.sgsits.connect.entities.User;
import com.sgsits.connect.helper.ConnectionProvider;
import com.sgsits.connect.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author jatin
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
       
            //fetching data from form
            int cid=Integer.parseInt(request.getParameter("cid"));
            
            String ptitle=request.getParameter("ptitle");
            
            String pcontent=request.getParameter("pcontent");
            
            String pcode=request.getParameter("pcode");
            
            Part part=request.getPart("pimage");
        /*    
            Getting current user id 
            HttpSession seesion=request.getSession();
            User user=(User) session.getAttribute("currentUser");
            user.getId()
        */    
        
            User user = new User();
            out.println(part.getSubmittedFileName());
            out.println("Your post title is "+ ptitle);
            
            Post p=new Post(ptitle,pcontent,pcode,part.getSubmittedFileName(),null,cid,user.getId());
            
            //call function from postDAO savePost function
            PostDAO dao=new PostDAO(ConnectionProvider.getConnection());
            
            if(dao.savePost(p)){
                
                String pathBlog=request.getRealPath("/")+"blog_pic"+File.separator+part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(),pathBlog);
                out.println("Post added");
            }else{
                out.println("error from addpost");
            }
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
