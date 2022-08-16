package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;
import user.UserDTO;

@WebServlet("/login/*")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		UserDAO dao = new UserDAO();
		
		if(uri.indexOf("login.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			UserDTO dto = new UserDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String name = dao.loginCheck(dto);
			String message = "";
			String page ="";
			
			if(name == null) {
				message = "아이디 또는 비밀번호가 일치하지 않습니다.";
				message = URLEncoder.encode(message,"utf-8");
				page = "/blog-app/login.jsp?message=" + message;
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("userid", userid);
				session.setAttribute("message", message);
				page = "/blog-app/index.jsp";
				}
			response.sendRedirect(request.getContextPath()+page);
			
		} else if (uri.indexOf("logout.do") != -1) {
			HttpSession session = request.getSession();
			session.invalidate(); //세션 초기화
			String message = URLEncoder.encode("로그아웃되었습니다", "utf-8");
			response.sendRedirect(request.getContextPath() + "/blog-app/index.jsp?message=" + message);
			
		} else if(uri.indexOf("remind_id.do") != -1) {
			String email = request.getParameter("email");
			UserDTO dto = new UserDTO();
			
			dto.setEmail(email);
			String result = dao.remindIdCheck(dto);
			request.setAttribute("result", result);
			String page = "/blog-app/remind_id_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		
		} else if(uri.indexOf("remind_pwd.do") != -1) {
			String userid = request.getParameter("userid");
			String email = request.getParameter("email");
			UserDTO dto = new UserDTO();
			dto.setUserid(userid);
			dto.setEmail(email);
			String result = dao.remindPwdCheck(dto);
			request.setAttribute("result", result);
			String page = "/blog-app/remind_pwd_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
