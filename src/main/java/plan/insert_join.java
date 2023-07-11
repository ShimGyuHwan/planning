package plan;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class insert_join {
	dbconfig dbc = new dbconfig();
	String msg = "";
	public String joindata(String jid, String jpw, String jnm, String jtel, String jem, String jsms, String jevent) {
		try {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(jpw.getBytes("utf-8"));
		byte[] code = md.digest();
		StringBuilder pw = new StringBuilder();
		for(byte b : code) {
			String repass = String.format("%02x", b);
			pw.append(repass);
		}
		
		
		Connection con = this.dbc.info();
		
		String insert = "insert into joinok values ('0',?,?,?,?,?,?,?,default)";
		PreparedStatement ps = con.prepareStatement(insert);
		
		ps.setString(1, jid);
		ps.setString(2, pw.toString());
		ps.setString(3, jnm);	//패스워드 암호화 된 내용을 문자화 시킴
		ps.setString(4, jtel);
		ps.setString(5, jem);
		ps.setString(6, jsms);
		ps.setString(7, jevent);
		
		int call = ps.executeUpdate();
		con.close();
		ps.close();
		if(call > 0) {
			msg = "ok";
		}
		else {
			msg = "no";
		}
		}
		catch (Exception e) {}
		
		return msg;
	}
}
