package plan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class namecheck {
	dbconfig db = new dbconfig();
	Connection con = null;
	String result = "";
	public String n_check(String data) {
		try {
		this.con = this.db.info();
			String sql1 = "select * from joinok where jid=?";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setString(1,data);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				result = rs1.getString("jnm");
			}
		}
		catch (Exception e) {
			
		}
		return result;
	}
}
