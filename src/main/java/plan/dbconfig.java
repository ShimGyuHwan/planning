package plan;

import java.sql.Connection;
import java.sql.DriverManager;

//데이터 베이스 환경 설정 Module
public class dbconfig {
    
    public static Connection info() throws Exception{
    	
    	Class.forName(db_driver);
    	Connection con = DriverManager.getConnection(db_url,db_user,db_pass);
    	System.out.println(con);
    	return con;
    }
}
