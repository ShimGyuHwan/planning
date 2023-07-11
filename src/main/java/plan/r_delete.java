package plan;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/r_delete.do")
public class r_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       RequestDispatcher rd = null;
       r_db rdb = new r_db(); 
       PrintWriter pw = null;
    public r_delete() {
        super();

    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		//예약번호 delete 
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		this.pw = res.getWriter();
		String num = req.getParameter("num");
		System.out.print(num);
		try {
			String msg =rdb.delete(num);
			if(msg=="ok") {
				pw.print("<script>alert('예약이 취소 되었습니다.'); location.href='http://localhost:8080/plan/login.html';</script>");
			}
		} catch (Exception e) {
			System.out.print("db에러");
		}
		
	}

}
