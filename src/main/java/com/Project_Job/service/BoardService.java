package com.Project_Job.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project_Job.dao.BoardDao;
import com.Project_Job.dto.ArrResumeDto;
import com.Project_Job.dto.ArrReviewsDto;
import com.Project_Job.dto.BoardDto;
import com.Project_Job.dto.ReplyDto;
import com.Project_Job.dto.ResumeDto;
import com.Project_Job.dto.ReviewsDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao bdao;
	
	public int BoardWrite(BoardDto board) {
		
		String maxBcode = bdao.selectMaxBnum();
		System.out.println("BNO 최대값 : " + maxBcode);
		String Bcode = "B";
		if (maxBcode == null) {
			Bcode = Bcode + String.format("%05d", 1);
			System.out.println("처음 번호 : " + Bcode);
		} else {
			int BcodeNum = Integer.parseInt(maxBcode.replace("B", "")) + 1;
			Bcode = Bcode + String.format("%05d", BcodeNum);
		}
		System.out.println("BNO : " + Bcode);
		board.setBno(Bcode);
		int insertResult = bdao.BoardWrite(board);
		
		return insertResult;
	}

	public ArrayList<BoardDto> selectBoardList() {
		
		ArrayList<BoardDto> boardList = bdao.selectBoardList();
		for(int i = 0; i < boardList.size();i++) {
			String bno = boardList.get(i).getBno();
			int breplycount = bdao.selectBreplyCount(bno);
			boardList.get(i).setBreplycount(breplycount);
		}
		return boardList;
	}

	public BoardDto selectBoardInfo(String bno) {
		BoardDto boardInfo = bdao.selectBoardInfo(bno);
		bdao.updateCount(bno);
		return boardInfo;
	}

	public int boardLikeCount(String bno) {
		System.out.println("BoardService boardLike()");
		int likeCount = bdao.selectLikeCount(bno);
		return likeCount;
	}

	public ArrayList<ReplyDto> boardReplyList(String bno, String loginId) {
		System.out.println("BoardService boardReplyList()");
		ArrayList<ReplyDto> replyList = bdao.selectReplyList(bno);
		//0번인덱스 댓글번호, 댓글작성자, 댓글내용, 댓글 작성일 + 추천수 + 추천확인
		
		for(int i = 0; i < replyList.size(); i++) {
			//댓글의 추천수 조회
			String renum = replyList.get(i).getRenum();
			int relikecount = bdao.selectReplyLikeCount(renum);
			replyList.get(i).setRelikecount(relikecount);
			
			//현재 페이지를 보는 사용자의 댓글 추천 여부 조회
			if(loginId != null) {
				System.out.println("loginId != null");
				String relikeCheck = bdao.selectReplyLikeCheck(renum, loginId);
				replyList.get(i).setRelikeCheck(relikeCheck);
			}
		}		
		return replyList;
	}

	public String boardLike(String lbno, String lmid) {
		System.out.println("BoardService boardLike()");
		Gson gson = new Gson();
		JsonObject boardLike_json = new JsonObject();
		
		//1. 추천유무 확인
		String likeMid = bdao.selectLikeCheck(lbno, lmid);
		
		if(likeMid == null) {
			System.out.println("추천 입력");
			bdao.insertBoardLike(lbno, lmid);
			boardLike_json.addProperty("likeResult", "1");
		} else {
			System.out.println("추천 취소");
			bdao.deleteBoardLike(lbno, lmid);
			boardLike_json.addProperty("likeResult", "-1");
		}
		
		//2. 추천 처리 이후 추천수 조회
		int likeCount = bdao.selectLikeCount(lbno);
		boardLike_json.addProperty("likeCount", likeCount);
		
		System.out.println( gson.toJson(boardLike_json) );
		return gson.toJson(boardLike_json);
	}

	public int replyWrite(ReplyDto reply) {
		System.out.println("BoardService replyWrite()");
		String maxRenum = bdao.selectMaxRenum();
		System.out.println("RENUM 최대값 : " + maxRenum);
		String renum = "RE";
		if (maxRenum == null) {
			renum = renum + String.format("%05d", 1);
			System.out.println("처음 번호 : " + renum);
		} else {
			int recodeNum = Integer.parseInt(maxRenum.replace("RE", "")) + 1;
			renum = renum + String.format("%05d", recodeNum);
		}
		System.out.println("recode : " + renum);
		
		reply.setRenum(renum);
		
		
		//2.댓글 등록
		int insertResult = 0;
		try {
			insertResult = bdao.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertResult;
	}

	public String replyList(String rebno, String loginId) {
		System.out.println("BoardService replyList()");
		ArrayList<ReplyDto> reList = bdao.selectReplyList(rebno);
		System.out.println(reList);
		ArrayList<ReplyDto> reListC = bdao.selectReplyListC(rebno);
		System.out.println(reListC);
		reList.addAll(reListC);
		System.out.println(reList);
		for(int i = 0; i < reList.size(); i++) {
			System.out.println(reList.get(i).getRenum());
			String renum = reList.get(i).getRenum();
			int relikecount = bdao.selectReplyLikeCount(renum);
			reList.get(i).setRelikecount(relikecount);
			if(loginId != null) {
				//SELECT RLMID FROM REPLYLIKE WHERE RLNUM = #{renum} AND RLMID = #{loginId};
				String relikeCheck = bdao.selectReplyLikeCheck(renum, loginId);
				reList.get(i).setRelikeCheck(relikeCheck);
			}			
		}
		System.out.println(reList);
		Gson gson = new Gson();
		String reList_json = gson.toJson(reList);
		System.out.println(reList_json);
		
		return reList_json;
	}	
	

	public int replyDelete(String renum) {
		System.out.println("BoardService replyDelete()");
		bdao.deleteReplyLike2(renum);
		int deleteResult = bdao.deleteReply(renum);
		return deleteResult;
	}

	public String replyLike(String rlnum, String rlmid) {
		System.out.println("BoardService replyLike()");
		Gson gson = new Gson();
		JsonObject replyLike_json = new JsonObject();
		//1. 추천유무 확인
		String likeCheck = bdao.selectReplyLikeCheck(rlnum, rlmid);
		
		if(likeCheck == null) {
			System.out.println("댓글 추천 입력");
			bdao.insertReplyLike(rlnum, rlmid);
			replyLike_json.addProperty("likeResult", "1");
		} else {
			System.out.println("추천 취소");
			bdao.deleteReplyLike(rlnum, rlmid);
			replyLike_json.addProperty("likeResult", "-1");
		}
		
		//2. 추천 처리 이후 추천수 조회
		int likeCount = bdao.selectReplyLikeCount(rlnum);
		replyLike_json.addProperty("likeCount", likeCount);
		
		System.out.println( gson.toJson(replyLike_json) );
		return gson.toJson(replyLike_json);
	}

	public int insertReivew(ReviewsDto review) {
		int insertResult = bdao.insertReivew(review);
		return insertResult;
	}
	
	public ArrayList<ArrReviewsDto> selectReview(String rvtype, String ciname) {
		ArrayList<ArrReviewsDto> reviewList = bdao.selectReview(rvtype, ciname);
		System.out.println("bsvc selectReview 요청");
		System.out.println(reviewList);
		ArrayList<ReviewsDto> Review = bdao.SelectReviewInfo(rvtype, ciname);
		for (int i = 0; i < reviewList.size(); i++) {
			if (Review.get(i).getRvcontents() != null) {
				String[] reedu = Review.get(i).getRvcontents().split("!@#");
				reviewList.get(i).setRvcontents(reedu);
			}
		}
		return reviewList;
		
	}

	public ArrayList<Map<String, String>> getReviewCount() {
		ArrayList<Map<String, String>> reviewCount = bdao.getReviewCount();
		return reviewCount;
	}


}
