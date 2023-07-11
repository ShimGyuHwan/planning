package plan;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/joinok.do")
public class joinok extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw = null;
    public joinok() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		
		String jid = req.getParameter("jid").intern();
		String jpw = req.getParameter("jpw").intern();
		String jnm = req.getParameter("jnm").intern();
		String jtel = req.getParameter("jtel").intern();
		String jem = req.getParameter("jem").intern();
		String jsms = "N";
		String jevent = "N";
		String jck1 = req.getParameter("jck1").intern();
		if(jck1 == "Y"){
		jsms = req.getParameter("jsms").intern();
		}
		String jck2 = req.getParameter("jck2").intern();
		if(jck2 == "Y"){
		jevent = req.getParameter("jevent").intern();
		}
		
		this.pw = res.getWriter();
		if(jid=="" || jpw == "" || jnm == "" || jtel == "" || jem == "") {
			this.pw.print("<script>alert('올바른 접속 형태가 아닙니다.'); history.go(-1); </script>");
		}
		else {
			insert_join j = new insert_join();
			try {
			String result = j.joindata(jid,jpw,jnm,jtel,jem,jsms,jevent);
			if(result=="ok") {
				//pw.write("<script>location.href = 'http://192.168.10.144:8080/plan/login.html';</script>");
				pw.write("<script>location.href = 'http://localhost:8080/plan/login.html';</script>");
			}
			else {
				this.pw.print("Database Field 오류");
			}
			}catch (Exception e) {
			}
		}
	}
}
