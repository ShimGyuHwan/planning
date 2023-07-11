package plan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class conname {
   dbconfig dbg = new dbconfig();
   String result = null;
   public String rname(String data){
      try {
      Connection con = this.dbg.info();
      
      String sql = "select * from joinok where jid=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, data);
      ResultSet rs = ps.executeQuery();
      while(rs.next()) {
         result = rs.getString("jnm");
      }
      }
      catch (Exception e) {
         
      }
      
      return result;
   }
}