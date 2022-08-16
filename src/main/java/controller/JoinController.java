package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
import user.UserDTO;

@WebServlet("/join/*")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String message = "";
		UserDAO dao = new UserDAO();
		
		if(uri.indexOf("join.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			String consent = request.getParameter("consent");
			String privacy = request.getParameter("privacy");
			
			UserDTO dto = new UserDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setConsent(consent);
			dto.setPrivacy(privacy);
			
			int result = dao.insertJoin(dto);
			if(result == -1) {
				PrintWriter script = response.getWriter();
				message = "이미 존재하는 아이디 입니다.";
				script.println("<script>");
				script.println("alert('"+message+"')");
				script.println("history.back()");
				script.println("</script>");

			} else {
				PrintWriter script = response.getWriter();
				message = dto.getUserid() + "님 환영합니다😁 가입한 아이디와 패스워드로 로그인해주세요!";
				script.println("<script>");
				script.println("alert('"+message+"')");
				script.println("location.href='../blog-app/login.jsp'");
				script.println("</script>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
