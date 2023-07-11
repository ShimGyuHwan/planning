package plan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/r_success.do")
public class r_success extends HttpServlet {
	private static final long serialVersionUID = 1L;
     r_db rdb = new r_db(); 
     PrintWriter pw = null;
    public r_success() {
        super();

    }
//db insert
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		this.pw=res.getWriter();
		String rname = req.getParameter("rname");
		String rtel =req.getParameter("rtel");
		String rperson =req.getParameter("rperson");
		String rnum =req.getParameter("rnum");
		String rmt =req.getParameter("rmt");
		String rplace =req.getParameter("rplace");
		String rdong =req.getParameter("rdong");
		String rfd =req.getParameter("rfd");
		String rld =req.getParameter("rld");
		String rpay =req.getParameter("rpay");
		String rprice =req.getParameter("rprice");
		ArrayList<String> al = new ArrayList<>();
		al.add(rname);al.add(rtel);al.add(rperson);al.add(rnum);al.add(rmt);al.add(rplace);al.add(rdong);al.add(rfd);al.add(rld);al.add(rpay);al.add(rprice);
		try {
			String msg = rdb.insert(al);
			if(msg=="ok") {
				pw.print("<script>alert('예약이 완료 되었습니다.'); location.href='http://localhost:8080/plan/login.jsp';</script>");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
