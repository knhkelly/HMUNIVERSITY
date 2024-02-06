package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.PagingService;
import svc.StudentListService;
import vo.ActionForward;
import vo.PagingBean;
import vo.StudentBean;

public class PagingAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		forward = new ActionForward();

		ArrayList<StudentBean> studentBean =  new ArrayList<StudentBean>();

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		PagingService pagingService = new PagingService();
		int listCount = pagingService.getListCount();
		studentBean = pagingService.getSelectList(page, limit);

		
		int maxPage = (int) ((double) listCount / limit + 0.95);
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		
		
		if (endPage > maxPage) endPage = maxPage;

		PagingBean pagingBean = new PagingBean();
		pagingBean.setEndPage(endPage);
		pagingBean.setListCount(listCount);
		pagingBean.setMaxPage(maxPage);
		pagingBean.setPage(page);
		pagingBean.setStartPage(startPage);

		request.setAttribute("pagingBean", pagingBean);
		request.setAttribute("studentBean", studentBean);
		
		
		forward.setPath("./Student/StudentList.jsp");

		return forward;
	}

}
