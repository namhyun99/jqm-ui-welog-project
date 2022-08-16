package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		
		if(uri.indexOf("write.do") != -1) {
			String userid = request.getParameter("userid");
			String category = request.getParameter("category");
			String title = request.getParameter("title");
			String editordate = request.getParameter("editordate");
			
			System.out.println(userid);
			System.out.println(category);
			System.out.println(title);
			System.out.println(editordate);
			
		} else if(uri.indexOf("comment.do") != -1) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			String userid = request.getParameter("userid");
			String comment = request.getParameter("comment");
			
			System.out.println(idx);
			System.out.println(userid);
			System.out.println(comment);
		};
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
