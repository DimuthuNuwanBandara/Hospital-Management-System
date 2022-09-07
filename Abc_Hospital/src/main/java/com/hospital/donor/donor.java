package com.hospital.donor;

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
 * Servlet implementation class donor
 */
@WebServlet("/donor")
public class donor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get values from request
		String donorName = request.getParameter("donorName");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String add = request.getParameter("add");
		String bgroup = request.getParameter("bgroup");
		String donationDate = request.getParameter("donationDate");

		
		// save database
		String sql = "INSERT INTO patients (donorName, gender, age, email, phone, add, bgroup, donationDate ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			Class.forName("com.mysql.jdbc.Driver"); 
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
            PreparedStatement preparedStatement =  c.prepareStatement(sql);
            preparedStatement.setString(1, donorName);
			preparedStatement.setString(2, gender);
			preparedStatement.setString(3, age);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, phone);
			preparedStatement.setString(6, add);
			preparedStatement.setString(7, bgroup);
			preparedStatement.setString(8, donationDate);
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