package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.UserBoardAction;
import action.UserInfoAction;
import action.UserInfoUpdateAction;
import action.UserLayoutAction;
import action.UserLectureAction;
import action.UserLectureDeleteAction;
import action.UserLectureInfoAction;
import action.UserLectureInsertAction;
import action.UserLectureSearchAction;
import action.UserScoreAction;
import action.UserUpdateAction;
import vo.ActionForward;

@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		System.out.println("서블릿 경로: " + command);

		ActionForward forward = null;
		Action action = null;

		if (command.equals("/user/userInfoAction.user")) {
			action = new UserInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// userUpdate 페이지로 이동
		else if (command.equals("/user/userUpdate.user")) {
			action = new UserUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 수강신청하는 페이지로 넘어가기
		else if (command.equals("/user/userGetLecture.user")) {
			action = new UserLectureAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 유저가 수강신청한 내 과목을 확인/수정하는 페이지로 넘어가는 액션
		else if (command.equals("/user/userLectureInfo.user")) {
			action = new UserLectureInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 유저 정보 수정 후 아작스 페이지로 넘어가는 액션
		else if (command.equals("/user/userInfoUpdate.user")) {
			action = new UserInfoUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 유저 수강 신청하는 액션
		else if (command.equals("/user/userLectureInsert.user")) {
			action = new UserLectureInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 유저 수강 취소하는 액션
		else if (command.equals("/user/userLectureDelete.user")) {
			action = new UserLectureDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 유저 점수 보는 액션
		else if (command.equals("/user/userScore.user")) {
			action = new UserScoreAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 로그아웃 액션
		else if (command.equals("/user/userLogout.user")) {
			HttpSession session = request.getSession(false);
			session.invalidate();
			response.sendRedirect("../main.jsp");
		}

		// 메인 레이아웃(아작스)로 넘어가는 액션
		else if (command.equals("/user/userLayout.user")) {
			action = new UserLayoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 검색 액션
		else if (command.equals("/user/searchWordAction.user")) {
			action = new UserLectureSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 공지사항으로 넘어가는 액션
		else if (command.equals("/user/userBoard.user")) {
			action = new UserBoardAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		// 보내기
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}
}
