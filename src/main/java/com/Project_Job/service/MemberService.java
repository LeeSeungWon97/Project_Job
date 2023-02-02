package com.Project_Job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project_Job.dao.MemberDao;
import com.Project_Job.dto.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao mdao;
	
	// 아이디 확인
	public String checkId(String mid) {
		System.out.println("MemberService checkId() 호출");
		String checkIdResult = mdao.selectCheckId(mid); 
		return checkIdResult;
	}

	// 회원가입 요청
	public int joinMember(MemberDto joinInfo) {
		System.out.println("MemberService joinMember() 호출");
		int insertResult = mdao.insertJoinMember(joinInfo);
		return insertResult;
	}

	// 로그인 요청
	public MemberDto loginMember(String loginType, String mid, String mpw) {
		System.out.println("MemberService loginMember() 호출");
		if(loginType.equals("개인")) {
			MemberDto loginInfo = mdao.selectMemberLogin(mid, mpw);
			return loginInfo;
		} else {
			System.out.println("기업회원 유저 검색");
			return null;
		}
	}	

}
