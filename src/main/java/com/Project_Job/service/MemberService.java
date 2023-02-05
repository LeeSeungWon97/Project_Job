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

	public int joinCiMember(CmemberDto joinInfo, String ciaddr) {
		System.out.println(joinInfo);
		System.out.println(ciaddr);
		int insertResult = mdao.insertCiJoinMember(joinInfo);
		String cinum = joinInfo.getCmcinum();
		epdao.updateCiAddr(cinum, ciaddr);
		return insertResult;
	}

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
	public String FindMember(String mname, String memail) {
		System.out.println("MemberService FindMember() 호출");
		String FindMid = mdao.FindMember(mname, memail);
		return FindMid;
	}

	public String FindCMember(String mname, String memail, String ciname) {
		String FindMid = mdao.FindCMember(mname, memail, ciname);
		return FindMid;
	}

}
