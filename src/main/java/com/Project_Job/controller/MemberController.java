package com.Project_Job.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.CmemberDto;
import com.Project_Job.dto.MemberDto;
import com.Project_Job.service.MailService;
import com.Project_Job.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService msvc;
	@Autowired
	private MailService emsvc;
	@Autowired
	private HttpSession session;
	

	/*** 페이지 이동 ***/

	// 회원가입 페이지 이동
	@RequestMapping(value = "/join")
	public String joinPage() {
		System.out.println("회원가입 선택창 이동 요청");
		return "member/Join";
	}

	// 개인 회원가입 페이지 이동
	@RequestMapping(value = "/joinMemberPage")
	public String joinMemberPage() {
		System.out.println("개인 회원가입 페이지 이동 요청");
		return "member/JoinMember";
	}

	// 기업 회원가입 페이지 이동
	@RequestMapping(value = "/joinCompanyPage")
	public String joinCompanyPage() {
		System.out.println("기업 회원가입 페이지 이동 요청");
		return "member/JoinCompany";
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login")
	public String loginPage() {
		System.out.println("로그인 페이지 이동 요청");
		return "member/Login";
	}

	// 아이디 찾기 페이지 이동
	@RequestMapping(value = "/FindMemberPage")
	public String FindMember() {
		System.out.println("아이디찾기");
		return "member/FindMember";
	}

	/*** 회원가입 컨트롤러 ***/

	// 회원가입 요청
	@RequestMapping(value = "/joinMember")
	public String joinMember(MemberDto joinInfo) {
		System.out.println("회원가입 요청");
		System.out.println(joinInfo);
		int insertResult = msvc.joinMember(joinInfo);
		if (insertResult == 1) {
			return "Main";
		} else {
			return "member/Join";
		}
	}

	// 기업 회원가입 요청
	@RequestMapping(value = "/joinCiMember")
	public String cjoinMember(@Param("joinInfo")CmemberDto joinInfo, @Param("ciaddr")String ciaddr) {
		System.out.println("기업 회원가입 요청");
		System.out.println(joinInfo);
		System.out.println("ciaddr : "+ciaddr);
		int insertResult = msvc.joinCiMember(joinInfo,ciaddr);
		
		if (insertResult == 1) {
		return "Main";
		} else {
			return "member/Join";
		}
	}

	// 이메일 본인인증
	@RequestMapping(value = "/mailCheck")
	public @ResponseBody String mailCheck(String email) {
		System.out.println("이메일 본인인증 요청");
		String inputEmail = email;
		System.out.println("요청한 이메일: " + inputEmail);
		return emsvc.sendId(inputEmail,"x");
	}

	// 개인 회원가입 ID 중복체크
	@RequestMapping(value = "/joinMIdCheck")
	public @ResponseBody String joinMIdCheck(String mid) {
		System.out.println("ID 중복확인 요청");
		System.out.println("입력한 아이디: " + mid);
		String result = "OK";
		String checkId = msvc.checkMId(mid);
		System.out.println(checkId);
		if (checkId != null) {
			result = "NO";
		}
		return result;
	}

	// 기업 회원가입 ID 중복체크
	@RequestMapping(value = "/joinCIdCheck")
	public @ResponseBody String joinCIdCheck(String cmid) {
		System.out.println("ID 중복확인 요청");
		System.out.println("입력한 아이디: " + cmid);
		String result = "OK";
		String checkId = msvc.checkCId(cmid);
		System.out.println(checkId);
		if (checkId != null) {
			result = "NO";
		}
		return result;
	}
	

	// 기업 회원가입시 회사 검색 요청 - 팝업창
	@RequestMapping(value = "/find_WP")
	public ModelAndView find_WP() throws IOException {
		System.out.println("회사 검색 페이지 팝업 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findWPpop");
		return mav;
	}

	/*** 로그인 관련 컨트롤러 ***/

	// 로그인 요청
	@RequestMapping(value = "/loginMember")
	public ModelAndView loginMember(String loginType, String id, String pw) {
		System.out.println("로그인 요청");
		System.out.println("로그인 타입: " + loginType);
		System.out.println("로그인 아이디: " + id);
		System.out.println("로그인 비밀번호: " + pw);
		
		ModelAndView mav = new ModelAndView();
		if (loginType.equals("개인")) {
			System.out.println("개인회원 로그인 요청");
			MemberDto loginMInfo = msvc.loginMember(id, pw);
			if(loginMInfo == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
			} else{
				session.setAttribute("loginInfo", loginMInfo);
				mav.setViewName("Main");
			}
		} else {
			System.out.println("기업회원 로그인 요청");
			CmemberDto loginCInfo = msvc.loginCompany(id, pw);
			if(loginCInfo == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
			} else{
				session.setAttribute("loginInfo", loginCInfo);
				mav.setViewName("Main");
			}
		}
		return mav;
	}
	
	@RequestMapping(value = "/FindMember")
	public ModelAndView FindMember(String loginType, String mname, String memail, String ciname) {
		System.out.println("아이디 찾기 요청");
		System.out.println("아이디 찾기 타입: " + loginType);
		System.out.println("입력 이름: " + mname);
		System.out.println("입력 이메일: " + memail);
		System.out.println("입력 기업명: " + ciname);
		ModelAndView mav = new ModelAndView();
		if (loginType.equals("개인")) {
			System.out.println("개인회원 아이디 찾기 요청");
			String FindMid = msvc.FindMember(mname, memail);
			if(FindMid == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
			} else{
				emsvc.sendId(memail,FindMid);
				mav.setViewName("Main");
			}
		} else {
			System.out.println("기업회 아이디 찾기 요청");
			String FindMid = msvc.FindCMember(mname, memail, ciname);
			if(FindMid == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
			} else{
				emsvc.sendId(memail,FindMid);
				mav.setViewName("Main");
			}
			/*
			 * System.out.println("기업회원 아이디 찾기 요청"); CmemberDto loginCInfo =
			 * msvc.loginCompany(id, pw); if(loginCInfo == null) { mav.addObject("msg",
			 * "존재하지 않는 회원입니다."); mav.addObject("url", "login");
			 * mav.setViewName("AlertScreen"); } else{ session.setAttribute("loginInfo",
			 * loginCInfo); mav.setViewName("Main"); }
			 */
		}
		return mav;
	}

}
