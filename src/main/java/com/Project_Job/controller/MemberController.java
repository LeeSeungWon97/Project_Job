package com.Project_Job.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.MemberDto;
import com.Project_Job.service.MailService;
import com.Project_Job.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService msvc;
	@Autowired
	private MailService emsvc;

	
	/*** 페이지 이동 ***/
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/join")
	public String joinPage() {
		System.out.println("회원가입 페이지 이동 요청");
		return "member/Join";
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/login")
	public String loginPage() {
		System.out.println("로그인 페이지 이동 요청");
		return "member/Login";
	}

	
	/*** 회원가입 관련 컨트롤러 ***/
	
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
	

	// 이메일 본인인증
	@RequestMapping(value = "/mailCheck")
	public @ResponseBody String mailCheck(String email) {
		System.out.println("이메일 본인인증 요청");
		String inputEmail = email;
		System.out.println("요청한 이메일: " + inputEmail);
		return emsvc.sendCode(inputEmail);
	}


	// 회원가입 ID 중복체크
	@RequestMapping(value = "/joinIdCheck")
	public @ResponseBody String joinIdCheck(String mid) {
		System.out.println("ID 중복확인 요청");
		System.out.println("입력한 아이디: " + mid);
		String result = "OK";
		String checkId = msvc.checkId(mid);
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
	
	//로그인 요청
	@RequestMapping(value = "/loginMember")
	public ModelAndView loginMember(String loginType, String mid, String mpw) {
		System.out.println("로그인 요청");
		System.out.println("로그인 타입: " + loginType);
		System.out.println("로그인 아이디: " + mid);
		System.out.println("로그인 비밀번호: " + mpw);
		if(loginType.equals("개인")) {
			System.out.println("개인회원 로그인 요청");
			MemberDto loginInfo = msvc.loginMember(loginType, mid, mpw);
			System.out.println(loginInfo.getMid());
		}else {
			System.out.println("기업회원 로그인 요청");
		}
		return null;
	}

}
