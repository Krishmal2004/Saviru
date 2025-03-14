package com.RealState.servlets;

import com.RealState.services.AdminAuthService;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final AdminAuthService authService = new AdminAuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Simply forward to the login page
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ServletContext servletContext = getServletContext(); // Get the ServletContext
        
      response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Updated to include ServletContext parameter
        if (authService.authenticateAdmin(username, password, servletContext)) {
            // Success - create session and redirect to admin dashboard
            HttpSession session = request.getSession();
            session.setAttribute("adminUsername", username);
            session.setAttribute("isAdmin", true);
            
          out.print("success");
            

            response.sendRedirect("adminDashboard.jsp");
        } else {
            // Failed login
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}