package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import action.Action;
import action.ScoreViewAction;
import action.ScoreDeleteAction;
import action.ScoreListAction;
import action.ScoreRewriteAction;
import action.ScoreWriteAction;
import action.StudentListAction;
import action.StudentSearchAction;
import svc.StudentListService;
import vo.ActionForward;
import vo.StudentBean;


@WebServlet("*.score")
public class ScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String student_no = null;
		if(session.getAttribute("student_no") != null) {
			student_no = String.valueOf(session.getAttribute("student_no"));
		} else {student_no = "0";}
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		System.out.println("서블릿 경로: " + command);

		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/studentViewAction.score")) {
				action = new ScoreListAction();
				try { forward = action.execute(request, response); }
				catch(Exception e) { e.printStackTrace(); }
				
			
			
		} else if (command.equals("/score/scoreWriteAction.score")) {
			action = new ScoreWriteAction();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
			
			
		} else if (command.equals("/score/scoreWrite.score")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./scoreView.jsp?id=" + student_no);
			
			
		} else if (command.equals("/score/scoreDeleteAction.score")) {
			action = new ScoreDeleteAction();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
			
			
		} else if (command.equals("/score/scoreDelete.score")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("../score/scoreView.jsp?id=" + student_no);
			
			
		} else if (command.equals("/scoreRewriteAction.score")) {
			action = new ScoreRewriteAction();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
			
			
		} else if (command.equals("/scoreRewrite.score")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./score/scoreView.jsp?id=" + student_no);
			
			
		} else if (command.equals("/studentSearchAction.score")) {
			action = new StudentSearchAction();
			try {
				forward = action.execute(request, response);
				forward.setPath("/studentSearch.score");
			} catch (Exception e) { e.printStackTrace(); }
			
			
		} else if (command.equals("/studentSearch.score")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./layout.jsp?code=292");
			
			
		} else if (command.equals("/score/lecturescore.score")) {
			action = new ScoreViewAction();
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
