package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ScoreRewriteService;
import svc.ScoreWriteService;
import vo.ActionForward;
import vo.ScoreBean;

public class ScoreRewriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ScoreBean score = new ScoreBean();
		boolean scoreResult = false;
		
		int student_no = Integer.parseInt(String.valueOf(session.getAttribute("student_no")));
		int lecture_no = Integer.parseInt(String.valueOf(session.getAttribute("lecture_no")));
		
		int att = Integer.parseInt(request.getParameter("att"));
		int mid = Integer.parseInt(request.getParameter("mid"));
		int fin = Integer.parseInt(request.getParameter("fin"));
		int proj = Integer.parseInt(request.getParameter("proj"));
		int subtotal = Integer.parseInt(request.getParameter("subtotal"));
		String grade = request.getParameter("grade");
		String comp = request.getParameter("comp");
		if(request.getParameter("comp") == null) {
			comp = "수강";
		}
		
		score.setStudent_no(student_no);
		score.setLecture_no(lecture_no);
		score.setScore_att(att);
		score.setScore_mid(mid);
		score.setScore_final(fin);
		score.setScore_project(proj);
		score.setScore_subTotal(subtotal);
		score.setScore_grade(grade);
		score.setScore_completion(comp);
		

		ScoreRewriteService scoreRewriteService = new ScoreRewriteService();
		scoreResult = scoreRewriteService.scoreRewrite(score);

		ActionForward forward = null;
		if (scoreResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('성적 입력 실패');");
			out.println("history.back();");
			out.println("</script>");
		} 
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./scoreRewrite.score");
		}
		return forward;
	}	
	
}
