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
	@Autowired
	private EmploymentDao epdao;

	// 개인회원 아이디 확인
	public String checkMId(String mid) {
		System.out.println("개인회원 아이디 조회");
		String checkIdResult = "";
		checkIdResult = mdao.selectMCheckId(mid);
		return checkIdResult;
	}

	// 기업회원 아이디 확인
	public String checkCId(String cmid) {
		System.out.println("개인회원 아이디 조회");
		String checkIdResult = "";
		checkIdResult = mdao.selectCCheckId(cmid);
		return checkIdResult;
	}

	// 회원가입 요청
	public int joinMember(MemberDto joinInfo) {
		System.out.println("MemberService joinMember() 호출");
		int insertResult = mdao.insertJoinMember(joinInfo);
		return insertResult;
	}

	// 로그인 요청
	public MemberDto loginMember(String id, String pw) {
		System.out.println("MemberService loginMember() 호출");
		MemberDto loginMInfo = new MemberDto();

		try {
			loginMInfo = mdao.selectMemberLogin(id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return loginMInfo;
	}

	// 기업회원 가입
	public int joinCiMember(CmemberDto joinInfo, String ciaddr) {
		System.out.println(joinInfo);
		System.out.println(ciaddr);
		int insertResult = mdao.insertCiJoinMember(joinInfo);
		String cinum = joinInfo.getCmcinum();
		epdao.updateCiAddr(cinum, ciaddr);
		return insertResult;
	}

	// 기업회원 로그인
	public CmemberDto loginCompany(String id, String pw) {
		System.out.println("MemberService loginCompany() 호출");
		CmemberDto loginCInfo = new CmemberDto();
		try {
			loginCInfo = mdao.selectCompanyLogin(id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loginCInfo;
	}
	
	//개인 회원 아이디 찾기
	public String FindMemberId(String mname, String memail) {
		System.out.println("MemberService FindMemberId() 호출");
		String FindMid = mdao.FindMemberId(mname, memail);
		return FindMid;
	}

	// 기업 회원 아이디 찾기
	public String FindCMemberId(String mname, String memail, String ciname) {
		String FindCid = mdao.FindCMemberId(mname, memail, ciname);
		return FindCid;
	}

	// 개인 회원 비밀번호 찾기
	public String FindMemberPw(String id) {
		System.out.println("MemberService FindMemberPw() 호출");
		String FindMpw = mdao.selectMemberPw(id);
		return FindMpw;
	}

	// 기업 회원 비밀번호 찾기
	public String FindCMemberPw(String id) {
		System.out.println("MemberService FindCMemberPw() 호출");
		String FindCMpw = mdao.selectCMemberPw(id);
		return FindCMpw;
	}

}
