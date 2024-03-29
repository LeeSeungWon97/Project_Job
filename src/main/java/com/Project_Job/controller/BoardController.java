package com.Project_Job.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.ArrResumeDto;
import com.Project_Job.dto.ArrReviewsDto;
import com.Project_Job.dto.BoardDto;
import com.Project_Job.dto.CinfoDto;
import com.Project_Job.dto.EmploymentDto;
import com.Project_Job.dto.ReplyDto;
import com.Project_Job.dto.ReviewsDto;
import com.Project_Job.service.BoardService;
import com.Project_Job.service.EmploymentService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bsvc;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberController mctrl;
	@Autowired
	private EmploymentService epsvc;

	private String requestUrl = "http://localhost:8080/controller/";

	@RequestMapping(value = "/BoardListPage")
	public ModelAndView BoardListPage(int pageNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("BoardListPage요청");
		System.out.println("pageNum: " + pageNum);
		ArrayList<BoardDto> boardList = bsvc.selectBoardList();
		ArrayList<BoardDto> board = new ArrayList<BoardDto>();
		//
		int pageIdx = pageNum;
		int pageIdxMax = boardList.size() / 5;
		if (boardList.size() % 5 != 0) {
			pageIdxMax += 1;
		}
		System.out.println("pageIdxMax: " + pageIdxMax);
		int startIdx = 5 * (pageIdx - 1);
		int endIdx = startIdx + 4;
		if (endIdx >= boardList.size()) {
			endIdx = boardList.size();
		}
		for (int i = startIdx; i < endIdx; i++) {
			board.add(boardList.get(i));
		}
		int pageBtnIdx = (pageNum - 1) / 5;
		int startBtn = pageBtnIdx * 5 + 1;
		int endBtn = startBtn + 4;
		if (endBtn > pageIdxMax) {
			endBtn = pageIdxMax;
		}
		mav.addObject("startBtn", startBtn);
		mav.addObject("endBtn", endBtn);
		mav.addObject("boardList", board);
		mav.addObject("pageNum", pageIdx);
		mav.addObject("pageIdxMax", pageIdxMax);
		mav.addObject("navType", "boardList");
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
		int insertResult = bsvc.BoardWrite(board);
		if (insertResult > 0) {
			mav.addObject("msg", "글작성완료!");
			mav.addObject("url", "BoardListPage");
			mav.addObject("pageNum",1);
			mav.setViewName("AlertScreen");
		} else {
			mav.addObject("msg", "입력 정보를 다시 확인해주세요!");
			mav.addObject("url", "BoardWritePage");
			mav.setViewName("AlertScreen");
		}
		return mav;
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
		String loginId = null;
		System.out.println("loginType" + loginType);
		if (loginType != null) {
			loginId = mctrl.callLoginId(loginType);
		}

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
		return insertResult + "";
	}

	@RequestMapping(value = "/replyList")
	public @ResponseBody String replyList(String rebno) {
		System.out.println("댓글 목록 조회 요청");
		System.out.println("댓글을 조회할 글번호 : " + rebno);
		String loginType = (String) session.getAttribute("loginType");
		String loginId = null;
		System.out.println("loginType" + loginType);
		if (loginType != null) {
			loginId = mctrl.callLoginId(loginType);
		}
		String replyList = bsvc.replyList(rebno, loginId);
		return replyList;
	}

	@RequestMapping(value = "/replyLike")
	public @ResponseBody String replyLike(String rlnum, String rlmid) {
		System.out.println("댓글 추천 등록 요청");
		System.out.println("추천할 댓글번호 : " + rlnum);
		String likeResult = bsvc.replyLike(rlnum, rlmid);

		return likeResult;
	}

	@RequestMapping(value = "/replyDelete_ajax")
	public @ResponseBody String replyDelete_ajax(String renum) {
		System.out.println("댓글 삭제 요청");
		System.out.println("삭제할 댓글 번호 : " + renum);
		int deleteResult = bsvc.replyDelete(renum);
		return deleteResult + "";
	}

	@RequestMapping(value = "/ReviewState")
	public ModelAndView ReviewState(int pageNum) {
		ModelAndView mav = new ModelAndView();
		ArrayList<CinfoDto> cinfoListAll = epsvc.getCiList("");
		ArrayList<CinfoDto> cinfoList = new ArrayList<CinfoDto>();
		int pageIdx = pageNum;
		int pageIdxMax = cinfoListAll.size() / 15;
		if (cinfoListAll.size() % 15 != 0) {
			pageIdxMax += 1;
		}
		int startIdx = 15 * (pageIdx - 1);
		int endIdx = startIdx + 14;
		if (endIdx >= cinfoListAll.size()) {
			endIdx = cinfoListAll.size();
		}
		for (int i = startIdx; i < endIdx; i++) {
			cinfoList.add(cinfoListAll.get(i));
		}
		ArrayList<Map<String, String>> reviewcount = bsvc.getReviewCount(cinfoList);
		int pageBtnIdx = (pageNum - 1) / 5;
		int startBtn = pageBtnIdx * 5 + 1;
		int endBtn = startBtn + 4;
		if (endBtn > pageIdxMax) {
			endBtn = pageIdxMax;
		}
		mav.addObject("startBtn", startBtn);
		mav.addObject("endBtn", endBtn);
		mav.addObject("reviewcount", reviewcount);
		mav.addObject("pageNum", pageIdx);
		mav.addObject("pageIdxMax", pageIdxMax);
		mav.setViewName("employment/ReviewState");
		return mav;
	}

	@RequestMapping(value = "/ReviewWrite")
	public ModelAndView ReviewWrite(String cinum, String type) {
		ModelAndView mav = new ModelAndView();
		String loginType = (String) session.getAttribute("loginType");
		String loginId = mctrl.callLoginId(loginType);
		ArrResumeDto myresume = epsvc.SelectResume(loginId);
		System.out.println(cinum);
		System.out.println(type);
		CinfoDto cinfo = epsvc.viewCinfo(cinum);
		System.out.println(cinfo);
		mav.addObject("Resume", myresume);
		mav.addObject("cinfo", cinfo);
		mav.addObject("rvtype", type);
		mav.setViewName("employment/ReviewWrite");
		return mav;
	}

	@RequestMapping(value = "/ReviewType")
	public ModelAndView ReviewType(String cinum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cinum", cinum);
		mav.setViewName("ReviewType");
		return mav;
	}

	@RequestMapping(value = "/WriteReview")
	public @ResponseBody int WriteReview(ReviewsDto review) {
		ModelAndView mav = new ModelAndView();
		String loginType = (String) session.getAttribute("loginType");
		String loginId = mctrl.callLoginId(loginType);
		review.setRvmid(loginId);
		System.out.println(review);
		int insertResult = bsvc.insertReivew(review);

		return insertResult;
	}

	@RequestMapping(value = "/ViewReview")
	public ModelAndView ViewReview(String rvtype, String ciname) {
		ModelAndView mav = new ModelAndView();
		System.out.println("rvtype : " + rvtype);
		System.out.println("ciname : " + ciname);
		ArrayList<ArrReviewsDto> reviewList = bsvc.selectReview(rvtype, ciname);
		System.out.println(reviewList);
		mav.addObject("ciname", ciname);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("board/ViewReviewWithType");
		return mav;
	}

	@RequestMapping(value = "/PassEssayPage")
	public ModelAndView PassEssayPage(String rvtype,int pageNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("rvtype : " + rvtype);
		ArrayList<ArrReviewsDto> reviewListAll = bsvc.selectReview(rvtype, "");
		ArrayList<ArrReviewsDto> reviewList = new ArrayList<ArrReviewsDto>();
		int pageIdx = pageNum;
		int pageIdxMax = reviewListAll.size() / 10;
		if (reviewListAll.size() % 10 != 0) {
			pageIdxMax += 1;
		}
		int startIdx = 10 * (pageIdx - 1);
		int endIdx = startIdx + 9;
		if (endIdx >= reviewListAll.size()) {
			endIdx = reviewListAll.size();
		}
		for (int i = startIdx; i < endIdx; i++) {
			reviewList.add(reviewListAll.get(i));
		}
		int pageBtnIdx = (pageNum - 1) / 5;
		int startBtn = pageBtnIdx * 5 + 1;
		int endBtn = startBtn + 4;
		if (endBtn > pageIdxMax) {
			endBtn = pageIdxMax;
		}
		mav.addObject("startBtn", startBtn);
		mav.addObject("endBtn", endBtn);
		mav.addObject("pageNum", pageIdx);
		mav.addObject("pageIdxMax", pageIdxMax);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("employment/PassEssayPage");
		return mav;
	}

	@RequestMapping(value = "/searchBoardJson")
	public @ResponseBody String searchBoardJson(String searchValue, String selectType, String selectTag) {
		System.out.println("searchBoardJson호출");
		System.out.println("searchValue" + searchValue);
		System.out.println("selectType" + selectType);
		System.out.println("selectTag" + selectTag);
		String boardList = "";
		if (searchValue.equals("ALL")) {
			searchValue = "";
		}
		boardList = bsvc.searchBoardList(searchValue, selectType, selectTag);
		return boardList;
	}
	
	@RequestMapping(value = "/ViewEssayPage")
	public ModelAndView ViewEssayPage(String rvnum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("ViewEssayPage 호출");
		System.out.println("review: " + rvnum);
		ArrReviewsDto review = bsvc.selectEssay(rvnum);
		System.out.println("review : "+review);
		mav.addObject("review", review);
		mav.setViewName("employment/ViewEssayPage");
		return mav;
	}
	
}
