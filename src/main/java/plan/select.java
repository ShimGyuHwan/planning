package plan;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/select.do")
public class select extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RequestDispatcher ds = null;
    conname nm = new conname();
    
    dongcheck dk = new dongcheck();
    public select() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		
		String a = req.getParameter("mou").intern(); //산
		String b = req.getParameter("moo").intern(); //지역
		String date1 = req.getParameter("date1").intern(); //입실
		String date2 = req.getParameter("date2").intern(); //퇴실
		String jnm = req.getParameter("jnm").intern(); //입실
		String jtel = req.getParameter("jtel").intern(); //퇴실
		
		String result = this.nm.rname(jnm);
		
		int sz = 0;
		String c = "";
		String d = "";
		if(a == "0"){
			c = "가야산";
			if(b == "0"){
				d = "백운동";
			}
			else if(b == "1"){
				d = "삼정";
			}
			else if(b == "2"){
				d = "치인";
			}
		}
		else if(a == "1"){
			c = "계룡산";
			d = "동학사";
		}
		else if(a == "2"){
			c = "내장산";
			if(b == "4"){
				d = "가인";
			}
			else if(b == "5"){
				d = "가장";
			}
		}
		else if(a == "3"){
			c = "덕유산";
			if(b == "6"){
				d = "덕유대1";
			}
			else if(b == "7"){
				d = "덕유대2";
			}
			else if(b == "8"){
				d = "덕유대3";
			}
		}
		else if(a == "4"){
			c = "무등산";
			d = "도원";
		}
		else if(a == "5"){
			c = "설악산";
			d = "설악동";
		}
		else if(a == "6"){
			c = "소백산";
			if(b == "11"){
				d = "남천";
			}
			else if(b == "12"){
				d = "삼가";
			}
		}
		else if(a == "7"){
			c = "월악산";
			if(b == "13"){
				d = "단돈재";
			}
			else if(b == "14"){
				d = "단돈재2";
			}
			else if(b == "15"){
				d = "덕주";
			}
			else if(b == "16"){
				d = "송계";
			}
		}
		try {
			ArrayList<String> msg = dk.dcheck(date1, date2, c, d);
			req.setAttribute("msg", msg);
			sz = msg.size();
			
		}
		catch (Exception e) {
		}
		req.setAttribute("sz", sz);
		req.setAttribute("a", a);
		req.setAttribute("b", b);
		req.setAttribute("n1", date1);
		req.setAttribute("n2", date2);
		req.setAttribute("name", jnm);
		req.setAttribute("tel", jtel);
		this.ds = req.getRequestDispatcher("./select.jsp");
		this.ds.forward(req, res);
	}

}
