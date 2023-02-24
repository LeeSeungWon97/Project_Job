package com.Project_Job.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project_Job.dao.EmploymentDao;
import com.Project_Job.dao.MemberDao;
import com.Project_Job.dto.CmemberDto;
import com.Project_Job.dto.EmploymentDto;
import com.Project_Job.dto.MemberDto;
import com.Project_Job.dto.ScrapDto;

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

	// 개인 회원 아이디 찾기
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

	// 회원 정보 수정
	public String updateInfo(String mType, String id, String pw, String name, String addr) {
		System.out.println("MemberService updateInfo() 호출");
		String result = "";
		if (mType.equals("P")) {
			System.out.println("개인회원 정보 수정");
			int updateResult = mdao.updateMinfo(id, pw, name, addr);
			if (updateResult == 1) {
				result = "OK";
			} else {
				result = "NO";
			}
		} else {
			System.out.println("기업회원 정보 수정");
			int updateResult = mdao.updateCMinfo(id, pw, name);
			if (updateResult == 1) {
				result = "OK";
			} else {
				result = "NO";
			}
		}
		return result;
	}

	public String checkPw(String loginType, String loginId, String currentPw) {
		System.out.println("MemberService checkPw() 호출");
		String result = "NO";
		if (loginType.equals("P")) {
			String loginPw = mdao.selectMemberPw(loginId);
			if (loginPw.equals(currentPw)) {
				result = "OK";
			}
		} else {
			String loginPw = mdao.selectCMemberPw(loginId);
			if (loginPw.equals(currentPw)) {
				result = "OK";
			}
		}
		return result;
	}

	public boolean deleteUserInfo(String loginType, String loginId) {
		System.out.println("MemberService deleteUserInfo() 호출");
		boolean result = false;
		int updateResult = 0;
		if (loginType.equals("P")) {
			updateResult = mdao.updateMState(loginId);
		} else {
			updateResult = mdao.updateCMState(loginId);
		}
		if (updateResult == 1) {
			result = true;
		}
		return result;
	}

	// 내 스크랩 가져오기
	public ArrayList<EmploymentDto> callMyScrap(String id) {
		System.out.println("MemberService callMyScrap 호출");
		ArrayList<ScrapDto> myScrap = mdao.selectScrap(id);
		ArrayList<EmploymentDto> epInfo = new ArrayList<EmploymentDto>();
		for (int i = 0; i < myScrap.size(); i++) {
			String epnum = myScrap.get(i).getSpepnum();
			EmploymentDto employ = epdao.viewEpInfo(epnum);
			epInfo.add(employ);
		}
		return epInfo;
	}

	// 내 지원현황
	public ArrayList<EmploymentDto> callMyApply(String id) {
		System.out.println("MeberService callMyApply() 호출");
		ArrayList<String> applyNum = mdao.selectMyApply(id);
		ArrayList<EmploymentDto> epInfo = new ArrayList<EmploymentDto>();
		for (int i = 0; i < applyNum.size(); i++) {
			EmploymentDto employ = epdao.viewEpInfo(applyNum.get(i));
			epInfo.add(employ);
		}
		return epInfo;
	}

	public String selectCmciname(String loginId) {
		String cmciname = mdao.selectCmciname(loginId);
		return cmciname;
	}

}
