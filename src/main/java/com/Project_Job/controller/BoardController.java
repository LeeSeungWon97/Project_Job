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
		int insertResult = bsvc.BoardWrite(board);
		if (insertResult > 0) {
			mav.addObject("msg", "글작성완료!");
			mav.addObject("url", "BoardListPage");
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
		System.out.println("loginType"+loginType);
		if(loginType != null) {
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
		return insertResult+"";
	}
	
	@RequestMapping(value = "/replyList")
	public @ResponseBody String replyList(String rebno) {
		System.out.println("댓글 목록 조회 요청");
		System.out.println("댓글을 조회할 글번호 : " + rebno);
		String loginType = (String) session.getAttribute("loginType");
		String loginId = null;
		System.out.println("loginType"+loginType);
		if(loginType != null) {
		loginId = mctrl.callLoginId(loginType);
		}
		String replyList = bsvc.replyList(rebno,loginId);
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
	public ModelAndView ReviewState() {
		ModelAndView mav = new ModelAndView();
		ArrayList<CinfoDto> cinfoList = epsvc.getCiList("");
		ArrayList<Map<String, String>> reviewcount = bsvc.getReviewCount();
		System.out.println(reviewcount);
		mav.addObject("reviewcount", reviewcount);
		mav.addObject("cinfoList", cinfoList);
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
	public ModelAndView ViewReview(String rvtype) {
		ModelAndView mav = new ModelAndView();
		System.out.println("rvtype : "+rvtype);
		ArrayList<ArrReviewsDto> reviewList = bsvc.selectReview(rvtype);
		System.out.println(reviewList);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("board/ViewReviewWithType");
		return mav;
	}	
	
	
}
