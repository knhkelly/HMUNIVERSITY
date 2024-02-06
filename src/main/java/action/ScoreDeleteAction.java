package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.ScoreDeleteService;
import vo.ActionForward;
import vo.ScoreBean;

public class ScoreDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ScoreBean score = new ScoreBean();
		boolean deleteResult = false;
		
		int student_no = Integer.parseInt(String.valueOf(session.getAttribute("student_no")));
		int lec_no = Integer.parseInt(request.getParameter("delno"));
		
		score.setStudent_no(student_no);
		score.setLecture_no(lec_no);

		ScoreDeleteService scoreDeleteService = new ScoreDeleteService();
		deleteResult = scoreDeleteService.scoreDelete(score);

		ActionForward forward = null;
		if (deleteResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('성적 삭제 실패');");
			out.println("history.back();");
			out.println("</script>");
		} 
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./scoreDelete.score");
		}
		return forward;
}
	
}