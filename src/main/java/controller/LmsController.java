package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.LectureDeleteAction;
import action.LectureListAction;
import action.LectureModifyAction;
import action.LectureModifyConAction;
import action.LectureViewAction;
import action.LectureRegAction;
import action.LectureSearchAction;
import vo.ActionForward;

@WebServlet("*.lms")
public class LmsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		System.out.println("서블릿 경로: "+command);
		ActionForward forward = null;
		Action action = null;
		
	
	if (command.equals("/lecture_reg.lms")) {
		action = new LectureRegAction();
		try { forward = action.execute(request, response); }
		catch (Exception e) { e.printStackTrace(); }
	}
	
	
	else if (command.equals("/lecture_list.lms")) {
		action = new LectureListAction();
		try { forward = action.execute(request, response); }
		catch (Exception e) { e.printStackTrace(); }
	}
	
	
	else if (command.equals("/lecture_view.lms")) {
		action = new LectureViewAction();
		try { forward = action.execute(request, response); }
		catch (Exception e) { e.printStackTrace(); }
	}
	
	
	else if (command.equals("/lecture_modify.lms")) {
		action = new LectureModifyAction();
		try { forward = action.execute(request, response); }
		catch (Exception e) { e.printStackTrace(); }
	}
	
	
	else if (command.equals("/lecture_modify_confirm.lms")) {
		action = new LectureModifyConAction();
		try { forward = action.execute(request, response); }
		catch (Exception e) { e.printStackTrace(); }
	}
	
	
	else if (command.equals("/searchWordAction.lms")) {
	    action = new LectureSearchAction();
	    try { forward = action.execute(request, response); }
	    catch (Exception e) { e.printStackTrace(); }
	}
	
	
	else if (command.equals("/lecture_delete.lms")) {
		action = new LectureDeleteAction();
		try { forward = action.execute(request, response); }
		catch (Exception e) { e.printStackTrace(); }
	}
	
	
		if (forward != null) {
			if (forward.isRedirect()) { response.sendRedirect(forward.getPath()); }
			else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

		
	
	
}
