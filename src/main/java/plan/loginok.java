package plan;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginok.do")
public class loginok extends HttpServlet {
	PrintWriter pw = null;
	insert_login ig = new insert_login();
	private static final long serialVersionUID = 1L;
       
    public loginok() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		this.pw = res.getWriter();
		
		String jid = req.getParameter("jid").intern();
		String jpw = req.getParameter("jpw").intern();
		
		String result = this.ig.insert_loginok(jid,jpw);
		String result2[] = result.split(",");
	
		if(result2[0].equals("true")) {
			HttpSession session = req.getSession();
			session.setAttribute("jnm", result2[1]);
			session.setAttribute("jtel", result2[2]);
			//res.sendRedirect("http://192.168.10.144:8080/plan/pension2.jsp?jnm=" + result2[1] + "?jtel=" + result2[2])
			pw.write("<script>alert('"+result2[1]+"님 로그인 되셨습니다.');location.href = 'http://localhost:8080/plan/pension2.jsp?jtel="+result2[2]+"';</script>");
		}
		else {
			pw.write("<script>alert('아이디 및 패스워드를 확인해주세요.'); location.href = 'http://localhost:8080/plan/login.html';</script>");
			//pw.write("<script>alert('아이디 및 패스워드를 확인해주세요.'); location.href = 'http://192.168.10.144:8080/plan/login.html';</script>");
		}
	
	
	
	}
	
	
	
}
