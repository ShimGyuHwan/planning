package plan;

import java.sql.Connection;
import java.sql.DriverManager;

//데이터 베이스 환경 설정 Module
public class dbconfig {
    
    public static Connection info() throws Exception{
    	String db_driver = "com.mysql.cj.jdbc.Driver";
    	String db_url = "jdbc:mysql://umj7-020.cafe24.com/soniii0415";
    	String db_user = "soniii0415";
    	String db_pass = "a1b2c3d4^!";
    	
    	Class.forName(db_driver);
    	Connection con = DriverManager.getConnection(db_url,db_user,db_pass);
    	System.out.println(con);
    	return con;
    }
}
