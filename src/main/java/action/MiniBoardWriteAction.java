package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardWriteProService;
import svc.MiniWriteService;
import vo.ActionForward;
import vo.MiniBoardBean;

public class MiniBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		MiniBoardBean miniBoardBean = null;
		
		MiniWriteService miniBoardWriteService = new MiniWriteService();
		
		miniBoardBean = new MiniBoardBean();
		miniBoardBean.setMINI_CONTENT(request.getParameter("content"));
		
		boolean isWriteSuccess = miniBoardWriteService.miniInsert(miniBoardBean);
		if (isWriteSuccess == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('일정등록실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./main.jsp");
		}
		
		return forward;
	}

}
