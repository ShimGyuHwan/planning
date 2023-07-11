package plan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class dongcheck {
	dbconfig db = new dbconfig();
	Connection con = null;
	public ArrayList<String> dcheck(String date1, String date2, String mou, String moo) throws Exception{
		ArrayList<String> al = new ArrayList<String>();
		System.out.println(mou);
		this.con = this.db.info();
		String sql1 = "select * from reservation where rmt=? and rplace=? and rfd between ? and ? and rld between ? and ?";
		PreparedStatement ps1 = con.prepareStatement(sql1);
		ps1.setString(1,mou);
		ps1.setString(2,moo);
		ps1.setString(3,date1);
		ps1.setString(4,date2);
		ps1.setString(5,date1);
		ps1.setString(6,date2);

		ResultSet rs1 = ps1.executeQuery();
		while(rs1.next()) {
			al.add(rs1.getString("rdong"));
		}
		
		con.close();
		ps1.close();
		System.out.println(al);
		
		return al;
	}
}
