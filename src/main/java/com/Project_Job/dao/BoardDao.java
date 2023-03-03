package com.Project_Job.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Project_Job.dto.BoardDto;
import com.Project_Job.dto.ReplyDto;

public interface BoardDao {

	@Select("SELECT MAX(BNO) FROM BOARDS")
	String selectMaxBnum();

	@Insert("INSERT INTO BOARDS VALUES( #{bno},#{bmid},#{btitle},#{bcontents},SYSDATE,#{bhope},'0','0' )")
	int BoardWrite(BoardDto board);

	@Select("SELECT * FROM BOARDS ")
	ArrayList<BoardDto> selectBoardList();

	@Select("SELECT * FROM BOARDS WHERE BNO = #{bno}")
	BoardDto selectBoardInfo(String bno);

	@Select("SELECT COUNT(*) FROM BOARDLIKE " + "WHERE LBNO = #{bno}")
	int selectLikeCount(String bno);

	@Select("SELECT RE.* " + "FROM REPLYS RE, MEMBERS M " + "WHERE ( RE.REWRITER = M.MID ) AND REBNO = #{rebno}"
			+ "ORDER BY RENUM ")
	ArrayList<ReplyDto> selectReplyList(String bno);

	@Select("SELECT COUNT(*) FROM REPLYLIKES " + "WHERE RLNUM = #{renum}")
	int selectReplyLikeCount(String renum);

	@Select("SELECT RLMID FROM REPLYLIKES " + "WHERE RLNUM = #{renum} AND RLMID = #{loginId}")
	String selectReplyLikeCheck(@Param("renum") String renum, @Param("loginId") String loginId);

	@Select("SELECT LBMID FROM BOARDLIKE " + "WHERE LBNO = #{lbno} AND LBMID = #{lmid}")
	String selectLikeCheck(@Param("lbno") String lbno, @Param("lmid") String lmid);

	@Insert("INSERT INTO BOARDLIKE(LBNO, LBMID, LBSTATE) " + "VALUES(#{lbno}, #{lmid}, '0')")
	int insertBoardLike(@Param("lbno") String lbno, @Param("lmid") String lmid);

	@Delete("DELETE FROM BOARDLIKE " + "WHERE LBNO = #{lbno} AND LBMID = #{lmid}")
	void deleteBoardLike(@Param("lbno") String lbno, @Param("lmid") String lmid);

	@Select("SELECT MAX(RENUM) FROM REPLYS ")
	String selectMaxRenum();

	@Insert("INSERT INTO REPLYS(RENUM, REBNO, REWRITER, RECONTENT, REDATE, RESTATE ) "
			+ "VALUES( #{renum}, #{rebno}, #{rewriter}, #{recontent}, SYSDATE, '0' )")
	int insertReply(ReplyDto reply);

	@Insert("INSERT INTO REPLYLIKES(RLNUM, RLMID) VALUES( #{rlnum}, #{rlmid} )")
	void insertReplyLike(@Param("rlnum") String rlnum, @Param("rlmid") String rlmid);

	@Delete("DELETE FROM REPLYLIKES WHERE RLNUM = #{rlnum} AND RLMID = #{rlmid}")
	void deleteReplyLike(@Param("rlnum") String rlnum, @Param("rlmid") String rlmid);

	@Delete("DELETE FROM REPLYS WHERE RENUM = #{renum}")
	int deleteReply(String renum);

	@Delete("DELETE FROM REPLYLIKES WHERE RLNUM = #{renum}")
	void deleteReplyLike2(String renum);

	@Update("UPDATE BOARDS SET BCOUNT = BCOUNT +1 WHERE BNO = #{bno}")
	void updateCount(String bno);

	@Select("SELECT COUNT(*) FROM REPLYS WHERE REBNO = #{bno} ")
	int selectBreplyCount(String bno);

	@Select("SELECT RE.* FROM REPLYS RE, CMEMBERS CM "
			+ " WHERE ( RE.REWRITER = CM.CMID ) AND REBNO = #{rebno} ORDER BY RENUM ")
	ArrayList<ReplyDto> selectReplyListC(String rebno);
	
//	@Insert("INSERT INTO REVIEWS VALUES(#{rvciname},#{rvdate},#{rveptype},#{rvobj},#{rvobj},#{rvdif},#{rvmid},#{rvcontents},#{rvtype},#{rvstate})")
//	int insertReivew(ReviewsDto review);

}
