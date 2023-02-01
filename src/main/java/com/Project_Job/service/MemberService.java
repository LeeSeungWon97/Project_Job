package com.Project_Job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project_Job.dao.MemberDao;
import com.Project_Job.dto.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao mdao;
	
	// 아이디 존재 확인
	public String checkId(String mid) {
		System.out.println("MemberService checkId() 호출");
		String checkIdResult = mdao.selectCheckId(mid); 
		return checkIdResult;
	}

	// 회원가입 진행
	public int joinMember(MemberDto joinInfo) {
		System.out.println("MemberService joinMember() 호출");
		int insertResult = mdao.insertJoinMember(joinInfo);
		return insertResult;
	}	

}
