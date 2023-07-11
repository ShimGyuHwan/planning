package plan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/joinid_check.do")
public class joinid_check extends HttpServlet {
   dbconfig dbc = new dbconfig();
   PrintWriter pw = null;
   private static final long serialVersionUID = 1L;
       
    public joinid_check() {
        super();
    }

   protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      res.setCharacterEncoding("utf-8");
      res.setContentType("application/x-json;charset=UTF-8");
      req.setCharacterEncoding("utf-8");
      
      String jid = req.getParameter("jid");
      try {
      Connection con = this.dbc.info();
      this.pw = res.getWriter();
      
      String sql = "select * from joinok where jid=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, jid);
      
      ResultSet rs = ps.executeQuery();
      String msg = "false";
      String idcon = ""; 
      
      while(rs.next()) {
         idcon = rs.getString("jid");
         msg = "true";
      }
      pw.print(msg);
      con.close();
      ps.close();
      }
      catch (Exception e) {
         
      }
   }

}