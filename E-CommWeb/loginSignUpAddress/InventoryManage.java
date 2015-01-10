package com.loginSignUpAddress;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class InventoryManage {
	boolean reduced = false;
	boolean increased = true;
	public boolean reduceInventory(int id,int quantity)
	{
		try{
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/loginschema","root","1234");
			Statement stmt1 = conn.createStatement();
			System.out.println(id);
			String query1 = "Select Quantity from product where PID ="+id;
			ResultSet rs = stmt1.executeQuery(query1);
			rs.next();
			System.out.println(rs.getInt(1));
			if(rs.getInt(1)>= quantity){
				String query2 = "UPDATE product SET Quantity = Quantity - "+quantity+" WHERE PID ="+id;
				stmt1.executeUpdate(query2);
				reduced=true;
				return reduced;
			}
			else
			{
				reduced=false;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return reduced;	
	}
	public boolean increaseInventory(int pid)
	{
		try{
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/loginschema","root","1234");
			Statement stmt1 = conn.createStatement();
			String query = "UPDATE product SET Quantity = Quantity + 1 WHERE PID ="+pid;
			stmt1.executeUpdate(query);
			increased=true;
			return increased;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return increased;	
	}
}
