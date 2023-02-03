package com.Project_Job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project_Job.dao.EmploymentDao;
import com.Project_Job.dao.MemberDao;
import com.Project_Job.dto.CmemberDto;
import com.Project_Job.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	private MemberDao mdao;

	// 개인회원 아이디 확인
	public String checkMId(String mid) {
		System.out.println("개인회원 아이디 조회");
		String checkIdResult = "";
		checkIdResult = mdao.selectMCheckId(mid);
		return checkIdResult;
	}

	@Autowired
	private EmploymentDao epdao;

	// 기업회원 아이디 확인
	public String checkCId(String cid) {
		System.out.println("개인회원 아이디 조회");
		String checkIdResult = "";
		checkIdResult = mdao.selectCCheckId(cid);
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
		if (loginType.equals("개인")) {
			MemberDto loginInfo = mdao.selectMemberLogin(mid, mpw);
			return loginInfo;
		} else {
			System.out.println("기업회원 유저 검색");
			return null;
		}
	}

	public int joinCiMember(CmemberDto joinInfo, String cmaddr) {
		System.out.println(joinInfo);
		System.out.println(cmaddr);
		int insertResult = mdao.insertCiJoinMember(joinInfo);
		String cinum = joinInfo.getCmcinum();
		int updateResult = epdao.updateCiAddr(cinum, cmaddr);
		return insertResult;
	}

}
