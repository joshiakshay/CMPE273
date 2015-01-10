package com.JongoConnection;
import org.jongo.Jongo;
import org.jongo.MongoCollection;

import com.mongodb.DB;
import com.mongodb.MongoClient;

public class ConnectingJongo {
	
	Product test;
	public Product jongoConnect(int pid) {
		try {
			MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("mycatalog2014");
			Jongo jongo = new Jongo(db);
			MongoCollection products = jongo.getCollection("products");
			return products.findOne("{ ProductID :"+pid+"}").as(
					Product.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args){
		
		ConnectingJongo c = new ConnectingJongo();
		Product p = c.jongoConnect(1);
		System.out.print(""+
		p.getName()+""+
		p.getDescription()+"");
	}
}
