package com.hospital.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
			
			String sql = "select * from user_login where user_name=? and password=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				// valid user
				// get user type
				String userType = rs.getString(4);
				System.out.println(userType);
				if(userType.equals("DOCTOR")) {
					// redirect to the doctor page
					response.sendRedirect("doctor_page.jsp");
				}else if(userType.equals("ADMIN")){
					// redirect to the admin page
					response.sendRedirect("admin.jsp");
				}
			}else {
				// invalid user
				response.sendRedirect("login_failed.jsp");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
