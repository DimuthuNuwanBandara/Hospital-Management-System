package com.hospital.department;

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
 * Servlet implementation class AddDepartment
 */
@WebServlet("/addDepartment")
public class AddDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// get values from request
		String deptName = request.getParameter("deptName");
		String deptDesc = request.getParameter("deptDesc");
		
		// save database
		String sql = "INSERT INTO add_depart (deptName, deptDesc) VALUES (?, ?)";

		try {
			Class.forName("com.mysql.jdbc.Driver"); 
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
            PreparedStatement preparedStatement =  c.prepareStatement(sql);
            preparedStatement.setString(1, deptName);
			preparedStatement.setString(2, deptDesc);
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
