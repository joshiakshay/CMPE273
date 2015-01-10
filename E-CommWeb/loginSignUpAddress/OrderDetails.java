package com.loginSignUpAddress;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class OrderDetails {
	public boolean confirmed = false;

	public boolean shipmentDetails(int id,String fname,String lname,String email,String reenteremail,String city,String province,String address,String country){
		try{
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date date = new Date();
				DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/loginschema","root","1234");
				Statement stmt = conn.createStatement();
				System.out.println(email);
				System.out.println(reenteremail);
				if(email.equals(reenteremail)){
					String query = "insert into orderdetails(ProductID,FirstName,LastName,Email,City,Province,Address,Country,OrderDate,Status) values("+id+",'"+fname+"','"+lname+"','"+email+"','"+city+"','"+province+"','"+address+"','"+country+"','"+dateFormat.format(date)+"','Pending')";
					stmt.executeUpdate(query);
					confirmed=true;
					System.out.println("Shipment Confirmed");
					return confirmed;
				}
				else
				{
					System.out.println("Email IDs don't match");
					confirmed=false;
				}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return confirmed;
	}
}
