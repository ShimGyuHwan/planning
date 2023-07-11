package plan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class r_db {
	dbconfig db = new dbconfig();
	Connection con = null;
	public ArrayList<String> select(String num) {
		ArrayList<String> al = new ArrayList<String>();
		try {
		this.con = this.db.info();
		String sql = "select * from reservation where rnum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,num);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			al.add(rs.getString("rname"));
			al.add(rs.getString("rtel"));
			al.add(rs.getString("rperson"));
			al.add(rs.getString("rnum"));
			al.add(rs.getString("rmt"));
			al.add(rs.getString("rplace"));
			al.add(rs.getString("rdong"));
			al.add(rs.getString("rfd"));
			al.add(rs.getString("rld"));
			al.add(rs.getString("rpay"));
			al.add(rs.getString("rprice"));
		}
		System.out.println(al);
		con.close();
		ps.close();
		rs.close();
		
		}catch (Exception e) {
			al.add("no");
		}
		return al;
		
	}
	
	public String delete(String num) throws Exception {
		this.con = this.db.info();
		String sql = "delete from reservation where rnum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,num);
		int call =ps.executeUpdate();
		
		String msg ="";
		if(call >0) {
			msg="ok";
		}else msg="no";
		
		con.close();
		ps.close();
		return msg;
	
	}
	
	public String insert(ArrayList<String> al) throws Exception {
		this.con = this.db.info();
		String insert = "insert into reservation values('0',?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, al.get(0));
		ps.setString(2, al.get(1));
		ps.setString(3, al.get(2));
		ps.setString(4, al.get(3));
		ps.setString(5, al.get(4));
		ps.setString(6, al.get(5));
		ps.setString(7, al.get(6));
		ps.setString(8, al.get(7));
		ps.setString(9, al.get(8));
		ps.setString(10, al.get(9));
		ps.setString(11, al.get(10));
		
		int call =ps.executeUpdate();
		String msg ="";
		if(call >0) {
			msg="ok";
		}else msg="no";
		
		con.close();
		ps.close();
		return msg;
		
		
	}
}
