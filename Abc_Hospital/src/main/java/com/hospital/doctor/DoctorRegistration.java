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
 * Servlet implementation class PatientRegistration
 */
@WebServlet("/doctorRegistration")
public class DoctorRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get values from request
		String patientname = request.getParameter("patientname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String add = request.getParameter("add");
		String wards = request.getParameter("wards");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		
		// save database
		String sql = "INSERT INTO reg_patient (patientname, email, pwd, add, wards, phone, gender) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			Class.forName("com.mysql.jdbc.Driver"); 
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
            PreparedStatement preparedStatement =  c.prepareStatement(sql);
            preparedStatement.setString(1, patientname);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, pwd);
			preparedStatement.setString(4, add);
			preparedStatement.setString(5, wards);
			preparedStatement.setString(6, phone);
			preparedStatement.setString(7, gender);
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
