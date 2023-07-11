package plan;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class insert_login {
	dbconfig dbg = new dbconfig();
	
	public String insert_loginok(String jid, String jpw) {
		String msg = "false";
		String idcon = ""; 
		String jnm = "";
		String jtel = "";
		try {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(jpw.getBytes("utf-8"));
		byte[] code = md.digest();
		StringBuilder pw = new StringBuilder();
		for(byte b : code) {
		String repass = String.format("%02x", b);
		pw.append(repass);
		}
		Connection con = this.dbg.info();
		
		String sql = "select * from joinok where jid=? and jpw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, jid);
		ps.setString(2, pw.toString());
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			idcon = rs.getString("jid");
			
			if(idcon != "") {
				jnm = rs.getString("jnm");
				jtel = rs.getString("jtel");
				msg = "true";
			}
		}
		
		
		}
		catch (Exception e) {}
		
		return msg +","+ jnm + "," + jtel;
	}
}
