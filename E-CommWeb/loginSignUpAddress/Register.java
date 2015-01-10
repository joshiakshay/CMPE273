package com.loginSignUpAddress;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
public class Register {
	SHA1Encryption sha1 = new SHA1Encryption();
	public boolean registered = false;
	boolean pass1=false;
	String sha1password;
	public boolean registerUser(String name, String uname, String email, String password, String repeatpassword){
		try{
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/loginschema","root","1234");
			String query1 = "Select Username, Email from logindetails where Username like '"+uname+"' OR Email like '"+email+"'";
			//String query2 = "insert into logindetails(Name,Username,Password,Email) values('"+name+"','"+uname+"','"+sha1password+"','"+email+"')";
			Statement stmt1 = conn.createStatement();
			ResultSet rs = stmt1.executeQuery(query1);
			if(rs.isAfterLast()== true){
				System.out.println("Username already taken or Email already registered");
				pass1=false;
			}
				else
					pass1=true;
			if(pass1 == true && password.equals(repeatpassword)){
				System.out.println(password);
				sha1password = sha1.encrypt(password);
				//System.out.println(sha1password);
				String query2 = "insert into logindetails(Name,Username,Password,Email) values('"+name+"','"+uname+"','"+sha1password+"','"+email+"')";
				stmt1.executeUpdate(query2);
				registered=true;
				return registered;
			}
			else if(pass1==true && !password.equals(repeatpassword)){
				System.out.println("Password fields don't match");
				registered=false;
			}
			else
				registered=false;
				
		}
		catch(Exception e){
			e.printStackTrace();
		}
	return registered;
	}
}
