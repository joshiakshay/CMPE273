package com.loginSignUpAddress;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class CancellingOrder {
	boolean canceled= false;
	public boolean orderCancel(int oid)
	{
		try{
				Date date1 = new Date();
				Date date2 = new Date();
				DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/loginschema","root","1234");
				Statement stmt1 = conn.createStatement();
				String query1 = "Select OrderDate from orderdetails where OrderID ="+oid;
				ResultSet rs = stmt1.executeQuery(query1);
				rs.next();
				date1 = rs.getDate(1);
				final long DAY_IN_MILLIS = 1000 * 60 * 60 * 24;
				int diffInDays = (int) ((date2.getTime() - date1.getTime())/ DAY_IN_MILLIS );
				if(diffInDays < 4)
				{
					String query2 = "DELETE FROM orderdetails WHERE OrderID ="+oid;
					stmt1.executeUpdate(query2);
					canceled = true;
					return canceled;
				}
				else
				{
					String query3 = "Update orderdetails SET Status = 'Processed' where OrderID ="+oid;
					stmt1.executeUpdate(query3);
					canceled = false;
				}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return canceled;
	}
}
