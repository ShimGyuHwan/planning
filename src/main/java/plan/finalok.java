package plan;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/finalok.do")
public class finalok extends HttpServlet {
	private static final long serialVersionUID = 1L;
     RequestDispatcher rd = null;  
    public finalok() {
        super();

    }
  //최종 결제 페이지로 넘기기
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		String rname = req.getParameter("sname");
		String rtel =req.getParameter("stel");
		String rperson =req.getParameter("sle");
		String rnum =req.getParameter("sno");
		String rmt =req.getParameter("sarea1");
		String rplace =req.getParameter("sarea2");
		String rdong =req.getParameter("slocal1");
		String rfd =req.getParameter("sdate1");
		String rld =req.getParameter("sdate2");
		String rpay =req.getParameter("pay");
		String rprice =req.getParameter("stotal");
		ArrayList<String> al = new ArrayList<>();
		al.add(rname);al.add(rtel);al.add(rperson);al.add(rnum);al.add(rmt);al.add(rplace);al.add(rdong);al.add(rfd);al.add(rld);al.add(rpay);al.add(rprice);
		req.setAttribute("lists", al);
		this.rd = req.getRequestDispatcher("./reserv_final.jsp");
		this.rd.forward(req, res);
		
	}

}
