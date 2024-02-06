package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserImgSrcService;
import svc.UserInfoService;
import svc.UserLayoutLectureService;
import svc.UserMiniBoardService;
import vo.ActionForward;
import vo.BoardBean;
import vo.LectureBean;
import vo.StudentBean;
import vo.StudentImgBean;

public class UserLayoutAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		int student_Id = Integer.parseInt(session.getAttribute("student_login").toString());
		System.out.println(student_Id); // 찍힘
		
		// 강의 목록 데이터 가져오기
		UserLayoutLectureService userLayoutLectureService = new UserLayoutLectureService();
		ArrayList<LectureBean> layoutLecture = userLayoutLectureService.getLayoutLecture(student_Id);
		request.setAttribute("layoutLecture", layoutLecture);
		
		// 유저 데이터 가져오기
		UserInfoService uis = new UserInfoService();
		StudentBean student = uis.getStudentInfo(student_Id);
		request.setAttribute("student", student);
		
		// 공지사항 가져오기
		UserMiniBoardService userBoard = new UserMiniBoardService();
		ArrayList<BoardBean> board = userBoard.getBoardList();
		request.setAttribute("board", board);
		
		// 유저 사진 경로 가져오기
		UserImgSrcService img = new UserImgSrcService();
		StudentImgBean imgSrc = img.getPictureSrc(student_Id);
		request.setAttribute("imgSrc", imgSrc);

		// 경로
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/user/userLayout.jsp");
		
		return forward;
	}
}
