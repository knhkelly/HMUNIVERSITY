package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.LoginAction;
import action.StudentDeleteAction;
import action.StudentInsertAction;
import action.StudentListAction;
import action.StudentSearchAction;
import action.StudentUpdateAction;
import action.StudentViewAction;
import vo.ActionForward;

@WebServlet("*.me")
public class StudentController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath();
//		String command = RequestURI.substring(contextPath.length());
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
		
		System.out.println("서블릿 경로: "+command);
		
		ActionForward forward = null;
		Action action = null;
		if (command.equals("/StudentInsert.me")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./StudentInsert.jsp");
		}
		
		
		else if (command.equals("/loginAction.me")) {	
			action = new LoginAction();
			try { forward = action.execute(request, response); }
			catch(Exception e) { e.printStackTrace(); }
		}
		
		
		else if (command.equals("/studentInsertAction.me")) {
			action = new StudentInsertAction();
			try { forward = action.execute(request, response); }
			catch(Exception e) { e.printStackTrace(); }
		}
		
		
		else if (command.equals("/studentListAction.me")) {
			action = new StudentListAction();
			try { forward = action.execute(request, response); }
			catch(Exception e) { e.printStackTrace(); }
		}
		
		
		
		else if (command.equals("/studentViewAction.me")) {
			action = new StudentViewAction();
			try { forward = action.execute(request, response); }
			catch(Exception e) { e.printStackTrace(); }
		}
		
		
		else if (command.equals("/studentUpdateAction.me")) {
			action = new StudentUpdateAction();
			try { forward = action.execute(request, response); }
			catch(Exception e) { e.printStackTrace(); }
		}
		
		else if (command.equals("/studentDeleteAction.me")) {
			action = new StudentDeleteAction();
			try { forward = action.execute(request, response); }
			catch(Exception e) { e.printStackTrace(); }
		}
		
		
		else if (command.equals("/studentSearchAction.me")) {
			action = new StudentSearchAction();
			try {
				forward = action.execute(request, response);
				forward.setPath("/studentSearch.me");
			} catch (Exception e) { e.printStackTrace(); }
			
			
		} else if (command.equals("/studentSearch.me")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./layout.jsp?code=272");
		}
	
		
		
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println("888888: "+forward.getPath());
				response.sendRedirect(forward.getPath());
			}else {
				System.out.println("999999: "+forward.getPath());
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		
		
		
	}
}

