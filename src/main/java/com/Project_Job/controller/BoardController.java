package com.Project_Job.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.BoardDto;
import com.Project_Job.dto.ReplyDto;
import com.Project_Job.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bsvc;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberController mctrl;

	private String requestUrl = "http://localhost:8080/controller/";

	@RequestMapping(value = "/BoardListPage")
	public ModelAndView BoardListPage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("BoardListPage요청");
		ArrayList<BoardDto> boardList = bsvc.selectBoardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/BoardList");
		return mav;
	}

	@RequestMapping(value = "/BoardWritePage")
	public ModelAndView BoardWritePage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("BoardWritePage요청");
		mav.setViewName("board/BoardWritePage");
		return mav;
	}

	@RequestMapping(value = "/BoardWrite")
	public ModelAndView BoardWrite(BoardDto board) {
		ModelAndView mav = new ModelAndView();
		System.out.println("BoardWrite요청");
		System.out.println("전달받은 DTo : " + board);
		int insertResult = 0;
		// int insertResult = bsvc.BoardWrite(board);
		if (insertResult > 0) {
			mav.addObject("msg", "글작성완료!");
			mav.addObject("url", "BoardListPage");
			mav.setViewName("AlertScreen");
		} else {
			mav.addObject("msg", "입력 정보를 다시 확인해주세요!");
			mav.addObject("url", "BoardWritePage");
			mav.setViewName("AlertScreen");
		}
		return null;
	}

	@RequestMapping(value = "/ViewBoardInfo")
	public ModelAndView ViewBoardInfo(String bno) {
		ModelAndView mav = new ModelAndView();
		System.out.println("ViewBoardInfo요청");
		System.out.println("전달받은 bno : " + bno);
		BoardDto boardInfo = bsvc.selectBoardInfo(bno);
		System.out.println(boardInfo);
		mav.addObject("board", boardInfo);
		// 2. 추천수 조회
		int blikeCount = bsvc.boardLikeCount(bno);
		mav.addObject("blikeCount", blikeCount);
		String loginType = (String) session.getAttribute("loginType");
		String loginId = mctrl.callLoginId(loginType);
		
		// 3. 댓글 목록 조회
		ArrayList<ReplyDto> replyList = bsvc.boardReplyList(bno, loginId);
		mav.addObject("replyList", replyList);

		mav.setViewName("board/ViewBoardInfo");
		return mav;
	}
	
	@RequestMapping(value = "/boardLike")
	public @ResponseBody String boardLike(String lbno, String lmid) {
		System.out.println("게시글 추천 처리 요청");
		System.out.println("추천할 글번호 : " + lbno);
		System.out.println("추천자 아이디 : " + lmid);
		String result = bsvc.boardLike(lbno, lmid);
		return result;
	}
	
	@RequestMapping(value = "/replyWrite")
	public @ResponseBody String replyWrite(ReplyDto reply) {
		System.out.println("댓글 등록 요청");
		System.out.println(reply);
		int insertResult = bsvc.replyWrite(reply);
		return insertResult+"";
	}
	
	@RequestMapping(value = "/replyList")
	public @ResponseBody String replyList(String rebno) {
		System.out.println("댓글 목록 조회 요청");
		System.out.println("댓글을 조회할 글번호 : " + rebno);
		String loginType = (String) session.getAttribute("loginType");
		String loginId = mctrl.callLoginId(loginType);
		String replyList = bsvc.replyList(rebno,loginId);
		return replyList;
	}	
	
}
