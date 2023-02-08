package com.Project_Job.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Project_Job.dto.CmemberDto;
import com.Project_Job.dto.MemberDto;

public interface MemberDao {

	/*** Select ***/

	// 개인회원 아이디 확인
	@Select("SELECT MID FROM MEMBERS WHERE MID = #{mid}")
	String selectMCheckId(String mid);

	// 기업회원 아이디 확인
	@Select("SELECT CMID FROM CMEMBERS WHERE CMID = #{cmid}")
	String selectCCheckId(String cmid);

	// 로그인(개인)
	@Select("SELECT * FROM MEMBERS WHERE MID = #{id} AND MPW = #{pw}")
	MemberDto selectMemberLogin(@Param("id") String id, @Param("pw") String pw);

	// 로그인(기업)
	@Select("SELECT * FROM CMEMBERS WHERE CMID = #{id} AND CMPW = #{pw}")
	CmemberDto selectCompanyLogin(@Param("id") String id, @Param("pw") String pw);

	// 아이디찾기(개인)
	@Select("SELECT MID FROM MEMBERS WHERE MNAME = #{mname} AND MEMAIL = #{memail}")
	String FindMemberId(@Param("mname") String mname, @Param("memail") String memail);

	// 아이디찾기(기업)
	@Select("SELECT CMID " + "FROM CMEMBERS, CINFO " + "WHERE CMEMBERS.CMCINUM = CINFO.CINUM "
			+ "AND CINFO.CINAME LIKE '%${ciname}%' AND CMEMBERS.CMNAME = #{mname} "
			+ "AND CMEMBERS.CMEMAIL = #{memail} ")
	String FindCMemberId(@Param("mname") String mname, @Param("memail") String memail, @Param("ciname") String ciname);

	// 비밀번호 찾기(개인)
	@Select("SELECT MPW FROM MEMBERS WHERE MID = #{id}")
	String selectMemberPw(String id);

	// 비밀번호 찾기(기업)
	@Select("SELECT CMPW FROM CMEMBERS WHERE CMID = #{id}")
	String selectCMemberPw(String id);

	// 이메일 찾기(개인)
	@Select("SELECT MEMAIL FROM MEMBERS WHERE MID = #{id}")
	String selectMemberEmail(String id);

	// 이메일 찾기(기업)
	@Select("SELECT CMEMAIL FROM CMEMBERS WHERE CMID = #{id}")
	String selectCMemberEmail(String id);

	/*** Insert ***/

	// 회원가입(개인) SQL
	@Insert("INSERT INTO MEMBERS(MID,MPW,MNAME,MADDR,MBIRTH,MEMAIL,MSTATE) VALUES(#{mid},#{mpw},#{mname},#{maddr},#{mbirth},#{memail},'0')")
	int insertJoinMember(MemberDto joinInfo);

	// 회원가입(기업) SQL
	@Insert("INSERT INTO CMEMBERS(CMCINUM,CMID,CMPW,CMNAME,CMEMAIL,CMSTATE) VALUES(#{cmcinum},#{cmid},#{cmpw},#{cmname},#{cmemail},'0')")
	int insertCiJoinMember(CmemberDto joinInfo);

	/*** Update ***/

	// 회원(개인) 정보 업데이트
	@Update("UPDATE MEMBERS SET MPW=#{pw}, MNAME=#{name}, MADDR=#{addr}, MEMAIL=#{email} WHERE MID = #{id}")
	int updateMinfo(@Param("id") String id, @Param("pw") String pw, @Param("name") String name,
			@Param("addr") String addr, @Param("email") String email);

	@Update("UPDATE CMEMBERS SET CMPW = #{pw}, CMNAME = #{name},CMEMAIL = #{email} WHERE CMID = #{id}")
	int updateCMinfo(@Param("id") String id, @Param("pw") String pw, @Param("name") String name,
			@Param("email") String email);

}
