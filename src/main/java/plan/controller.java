package plan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controller.do")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  RequestDispatcher rd = null;
      r_db rdb = new r_db(); 
      PrintWriter pw = null;
    public controller() {
        super();
  
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//예약번호 select 
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		this.pw=res.getWriter();
		String num = req.getParameter("rnum");
	
		try {
			ArrayList<String> al=rdb.select(num);
			System.out.println(al);
			req.setAttribute("list", al);
			this.rd = req.getRequestDispatcher("./reserv_view.jsp");
			this.rd.forward(req, res);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.print("db에러");
			e.printStackTrace();
		}
		

	
	}

}
