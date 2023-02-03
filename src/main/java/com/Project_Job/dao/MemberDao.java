package com.Project_Job.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.Project_Job.dto.MemberDto;

public interface MemberDao {

	/*** Select ***/
	
	// 아이디 확인 SQL
	@Select("SELECT MID FROM MEMBERS WHERE MID = #{mid}")
	String selectMCheckId(String mid);
	
	@Select("SELECT CID FROM CMEMBERS WHERE CMID = #{cid}")
	String selectCCheckId(String mid);

	// 로그인(개인) SQL
	@Select("SELECT * FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto selectMemberLogin(@Param("mid") String mid, @Param("mpw") String mpw);
	
	/*** Insert ***/	
	// 회원가입(개인) SQL
	@Insert("INSERT INTO MEMBERS(MID,MPW,MNAME,MADDR,MBIRTH,MEMAIL,MSTATE) VALUES(#{mid},#{mpw},#{mname},#{maddr},#{mbirth},#{memail},'0')")
	int insertJoinMember(MemberDto joinInfo);


}
