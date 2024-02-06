package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LectureListService;
import vo.ActionForward;
import vo.LectureBean;

public class UserLectureSearchAction implements Action {

	// 유저가 과목 검색시 사용하는 액션
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		
		int option = Integer.parseInt(request.getParameter("option"));
        String searchWord = request.getParameter("searchWord");
        
        forward = new ActionForward();
        LectureListService lectureListService = new LectureListService();
        ArrayList<LectureBean> lectureSearchList = lectureListService.getSearchList(option,searchWord);
        
        request.setAttribute("lectureSearchList", lectureSearchList);
        forward.setPath("/user/userGetLecture.jsp");
        
		return forward;
	}
}

