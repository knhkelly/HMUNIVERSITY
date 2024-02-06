package action;

import java.io.PrintWriter;

import javax.servlet.http.*;

import vo.ActionForward;
import vo.ScoreBean;

import svc.ScoreWriteService;

public class ScoreWriteAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ScoreBean score = new ScoreBean();
		boolean scoreResult = false;
		
		int student_no = Integer.parseInt(String.valueOf(session.getAttribute("student_no")));
		String name = (String) session.getAttribute("student_name");
		String dep = String.valueOf(session.getAttribute("student_dep"));
		int lec_no = Integer.parseInt(request.getParameter("lec_no"));
		String lec_name = request.getParameter("lec_name");
		int att = Integer.parseInt(request.getParameter("att"));
		int mid = Integer.parseInt(request.getParameter("mid"));
		int fin = Integer.parseInt(request.getParameter("fin"));
		int proj = Integer.parseInt(request.getParameter("proj"));
		int subtotal = Integer.parseInt(request.getParameter("subtotal"));
		String grade = request.getParameter("grade");
		String comp = request.getParameter("comp");
		
		score.setStudent_no(student_no);
		score.setStudent_name(name);
		score.setStudent_dep(dep);
		score.setLecture_no(lec_no);
		score.setLecture_name(lec_name);
		score.setScore_att(att);
		score.setScore_mid(mid);
		score.setScore_final(fin);
		score.setScore_project(proj);
		score.setScore_subTotal(subtotal);
		score.setScore_grade(grade);
		score.setScore_completion(comp);

		ScoreWriteService scoreWriteService = new ScoreWriteService();
		scoreResult = scoreWriteService.scoreWrite(score);

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
			forward.setPath("./scoreWrite.score");
		}
		return forward;
	}	


}
