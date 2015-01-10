package com.loginSignUpAddress;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class LoginValidate {
	public boolean authorized = false;
	public boolean validate(String email, String password){
		try{
				DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/loginschema","root","1234");
				String query = "Select Email, Password from logindetails";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				SHA1Encryption sha1 = new SHA1Encryption();
				String sha1password = sha1.encrypt(password);
				while(rs.next()){
					if(email.equals(rs.getString("Email")) && sha1password.equals(rs.getString("Password"))){
						authorized=true;
						System.out.println("Login Successful");
						return authorized;
					}
					else
					{
						authorized=false;
						System.out.println("Login not Successful");
					}
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		
		return authorized;
	}	
}

