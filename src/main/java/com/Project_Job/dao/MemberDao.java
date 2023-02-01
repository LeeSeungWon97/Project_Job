package com.Project_Job.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.Project_Job.dto.MemberDto;

public interface MemberDao {

	@Select("SELECT MID FROM MEMBERS WHERE MID = #{mid}")
	String selectCheckId(String mid);

	@Insert("INSERT INTO MEMBERS(MID,MPW,MNAME,MADDR,MBIRTH,MEMAIL,MSTATE) VALUES(#{mid},#{mpw},#{mname},#{maddr},#{mbirth},#{memail},'0')")
	int insertJoinMember(MemberDto joinInfo);

}
