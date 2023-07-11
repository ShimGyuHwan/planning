package plan;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/part3.do")
public class part3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
		RequestDispatcher ds = null;
    public part3() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		
		String sarea1 = req.getParameter("sarea1");
		String sarea2 = req.getParameter("sarea2");
		String sdate1 = req.getParameter("sdate1");
		String sdate2 = req.getParameter("sdate2");
		String slocal1 = req.getParameter("slocal1");
		String stotal = req.getParameter("stotal");
		String sname = req.getParameter("sname");
		String stel = req.getParameter("stel");
		String sle = req.getParameter("sle");
		String num = req.getParameter("num");
		
		
		req.setAttribute("sarea1",sarea1);
		req.setAttribute("sarea2",sarea2);
		req.setAttribute("sdate1",sdate1);
		req.setAttribute("sdate2",sdate2);
		req.setAttribute("slocal1",slocal1);
		req.setAttribute("stotal",stotal);
		req.setAttribute("sname",sname);
		req.setAttribute("stel",stel);
		req.setAttribute("sle",sle);
		req.setAttribute("sno",num);
		
		this.ds = req.getRequestDispatcher("./part3.jsp");
		this.ds.forward(req, res);

	}

}
