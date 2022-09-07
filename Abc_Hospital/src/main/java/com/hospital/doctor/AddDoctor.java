package com.hospital.doctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddDoctor
 */
@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// get values from request
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String deptname = request.getParameter("deptname");
		String desig = request.getParameter("desig");
		
		// save database
		String sql = "INSERT INTO add_doctor (name, email, password, address, phone, deptname, desig) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
            PreparedStatement preparedStatement =  c.prepareStatement(sql);
            preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, password);
			preparedStatement.setString(4, address);
			preparedStatement.setString(5, phone);
			preparedStatement.setString(6, deptname);
			preparedStatement.setString(7, desig);
			boolean result = preparedStatement.execute();
			if(result) {
				
			}else {
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
