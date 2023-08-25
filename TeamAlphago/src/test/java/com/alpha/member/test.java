package com.alpha.member;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;


public class test {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/alphago?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true"; 
	private static final String USER = "alphago"; 
	private static final String PW = "1234";
	@Test
	public void testConnection() throws Exception{
		Class.forName(DRIVER); try(Connection conn = DriverManager.getConnection(URL, USER, PW)){ 
			System.out.println(conn);
		 } catch (Exception e) { 
			 e.printStackTrace();
		}
	}
}
