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


@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		UserDAO dao = new UserDAO();
		
		if(uri.indexOf("lookup.do") != -1) {
			String userid = request.getParameter("userid2");
			UserDTO dto = dao.userDetail(userid);
			request.setAttribute("dto", dto);
			String page = "/blog-app/setting_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			
		} else if(uri.indexOf("update.do") != -1 ) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			
			UserDTO dto = new UserDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.update(dto);
			
			String updateMsg = URLEncoder.encode("정보가 업데이트 되었습니다.", "utf-8");
			response.sendRedirect(context + "/blog-app/setting.jsp?updateMsg=" + updateMsg);
			
		} else if(uri.indexOf("delete.do") != -1) {
			String userid = request.getParameter("userid");
			dao.delete(userid);
			HttpSession session = request.getSession();
			session.invalidate(); //세션 초기화
			String message = URLEncoder.encode("탈퇴되었습니다. 감사합니다😭.", "utf-8");
			response.sendRedirect(context + "/blog-app/index.jsp?message=" + message);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
