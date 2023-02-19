package com.Project_Job.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.CinfoDto;
import com.Project_Job.dto.CmemberDto;
import com.Project_Job.dto.MemberDto;
import com.Project_Job.service.EmploymentService;
import com.Project_Job.service.MailService;
import com.Project_Job.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService msvc;
	@Autowired
	private MailService emsvc;
	@Autowired
	private EmploymentService epsvc;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;

	private String requestUrl = "http://localhost:8080/controller/";

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
	public ModelAndView loginPage() {
		System.out.println("로그인 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		String afterUrl = (String) request.getHeader("referer");
		if (!afterUrl.equals("http://localhost:8080/controller/loginMember")) {
			requestUrl = afterUrl;
		}
		mav.addObject("requestUrl", requestUrl);
		mav.setViewName("member/Login");
		return mav;
	}

	// 아이디 찾기 페이지 이동
	@RequestMapping(value = "/FindIdPage")
	public String FindIdPage() {
		System.out.println("아이디 찾기");
		return "member/FindId";
	}

	// 비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/FindPwPage")
	public String FindPw() {
		System.out.println("비밀번호 찾기");
		return "member/FindPw";
	}

	// 기업 회원가입시 회사 검색 요청 - 팝업창
	@RequestMapping(value = "/find_WP")
	public ModelAndView find_WP() throws IOException {
		System.out.println("회사 검색 페이지 팝업 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findWPpop");
		return mav;
	}

	// 내 정보 페이지 이동
	@RequestMapping(value = "/myInfo", produces = "application/text;charset=UTF-8")
	public ModelAndView myInfo() {
		System.out.println("내 정보보기 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		String loginType = (String) session.getAttribute("loginType");
		System.out.println("loginType: " + loginType);
		if (loginType.equals("P")) {
			mav.setViewName("member/MemberInfo");
		} else {
			CmemberDto cmdto = (CmemberDto) session.getAttribute("loginInfo");
			String cmciname = epsvc.getCompanyName(cmdto.getCmcinum());
			System.out.println(cmciname);
			mav.addObject("cmciname", cmciname);
			mav.setViewName("member/MemberInfo");
		}

		return mav;
	}

	// 비밀번호 변경 팝업창 요청
	@RequestMapping(value = "/changePw")
	public String changePw() {
		System.out.println("비밀번호 팝업창 요청");
		return "member/ChangePw";
	}

	// 비밀번호 변경 팝업창 요청
	@RequestMapping(value = "/deleteUser")
	public String deleteUser() {
		System.out.println("비밀번호 확인 팝업창 요청");
		return "member/DeleteUser";
	}

	/*** 회원가입 컨트롤러 ***/

	// 회원가입 요청
	@RequestMapping(value = "/joinMember")
	public String joinMember(MemberDto joinInfo) {
		System.out.println("회원가입 요청");
		System.out.println(joinInfo);
		int insertResult = msvc.joinMember(joinInfo);
		if (insertResult == 1) {
			return "redirect:/";
		} else {
			return "member/Join";
		}
	}

	// 기업 회원가입 요청
	@RequestMapping(value = "/joinCiMember")
	public String cjoinMember(@Param("joinInfo") CmemberDto joinInfo, @Param("ciaddr") String ciaddr) {
		System.out.println("기업 회원가입 요청");
		System.out.println(joinInfo);
		System.out.println("ciaddr : " + ciaddr);
		int insertResult = msvc.joinCiMember(joinInfo, ciaddr);

		if (insertResult == 1) {
			return "redirect:/";
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

	/*** 로그인 관련 컨트롤러 ***/

	// 로그인 요청
	@RequestMapping(value = "/loginMember")
	public ModelAndView loginMember(String loginType, String requestUrl, String id, String pw) {
		System.out.println("로그인 요청");
		System.out.println("로그인 타입: " + loginType);
		System.out.println("요청 Url: " + requestUrl);
		System.out.println("로그인 아이디: " + id);
		System.out.println("로그인 비밀번호: " + pw);

		ModelAndView mav = new ModelAndView();
		if (loginType.equals("개인")) {
			System.out.println("개인회원 로그인 요청");
			MemberDto loginMInfo = msvc.loginMember(id, pw);
			if (loginMInfo == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
			} else {
				session.setAttribute("loginType", "P");
				session.setAttribute("loginInfo", loginMInfo);
				mav.setViewName("redirect:" + requestUrl);
			}
		} else {
			System.out.println("기업회원 로그인 요청");
			CmemberDto loginCInfo = msvc.loginCompany(id, pw);
			if (loginCInfo == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
			} else {
				String cinum = loginCInfo.getCmcinum();
				CinfoDto cinfo = epsvc.viewCinfo(cinum);
				session.setAttribute("cinfo", cinfo);
				session.setAttribute("loginType", "C");
				session.setAttribute("loginInfo", loginCInfo);
				mav.setViewName("redirect:" + requestUrl);
			}
		}
		return mav;
	}

	// 아이디 찾기
	@RequestMapping(value = "/FindMemberId")
	public ModelAndView FindMemberId(String loginType, String mname, String memail, String ciname) {
		System.out.println("아이디 찾기 요청");
		System.out.println("아이디 찾기 타입: " + loginType);
		System.out.println("입력 이름: " + mname);
		System.out.println("입력 이메일: " + memail);
		System.out.println("입력 기업명: " + ciname);
		ModelAndView mav = new ModelAndView();
		if (loginType.equals("개인")) {
			System.out.println("개인회원 아이디 찾기 요청");
			String FindMid = msvc.FindMemberId(mname, memail);
			System.out.println("아이디: " + FindMid);
			if (FindMid == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "FindIdPage");
				mav.setViewName("AlertScreen");
			} else {
				mav.addObject("msg", "등록하신 이메일로 아이디정보가 발송되었습니다");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
				emsvc.sendId(memail, FindMid);
			}
		} else {
			System.out.println("기업회원 아이디 찾기 요청");
			String FindCid = msvc.FindCMemberId(mname, memail, ciname);
			System.out.println("아이디: " + FindCid);
			if (FindCid == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "FindIdPage");
				mav.setViewName("AlertScreen");
			} else {
				mav.addObject("msg", "등록하신 이메일로 아이디정보가 발송되었습니다");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
				emsvc.sendId(memail, FindCid);
			}
		}
		return mav;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/FindMemberPw")
	public ModelAndView FindMemberPw(String loginType, String id) {
		System.out.println("비밀번호 찾기 요청");
		ModelAndView mav = new ModelAndView();
		if (loginType.equals("개인")) {
			System.out.println("개인회원 비밀번호 찾기");
			String FindMpw = msvc.FindMemberPw(id);
			System.out.println("아이디: " + FindMpw);
			if (FindMpw == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "FindIdPage");
				mav.setViewName("AlertScreen");
			} else {
				emsvc.sendPw(loginType, id, FindMpw);
				mav.addObject("msg", "등록하신 이메일로 비밀번호 정보가 발송되었습니다");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
			}
		} else {
			System.out.println("기업회원 비밀번호 찾기");
			String FindCMpw = msvc.FindCMemberPw(id);
			System.out.println("아이디: " + FindCMpw);
			if (FindCMpw == null) {
				mav.addObject("msg", "존재하지 않는 회원입니다.");
				mav.addObject("url", "FindIdPage");
				mav.setViewName("AlertScreen");
			} else {
				emsvc.sendPw(loginType, id, FindCMpw);
				mav.addObject("msg", "등록하신 이메일로 비밀번호 정보가 발송되었습니다");
				mav.addObject("url", "login");
				mav.setViewName("AlertScreen");
			}
		}
		return mav;
	}

	// 로그아웃
	@RequestMapping(value = "/logout")
	public ModelAndView logout() {
		System.out.println("로그아웃 요청");
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;
	}

	// 회원정보 업데이트
	@RequestMapping(value = "/updateInfo")
	public @ResponseBody String updateInfo(String mType, String id, String pw, String name, String addr) {
		System.out.println("mType: " + mType);
		System.out.println("id: " + id);
		String result = msvc.updateInfo(mType, id, pw, name, addr);
		session.invalidate();
		return result;
	}

	// 로그인 회원 비밀번호 확인
	@RequestMapping(value = "/checkPassword")
	public @ResponseBody String checkPassword(String currentPw) {
		System.out.println("currentPw: " + currentPw);
		String loginType = (String) session.getAttribute("loginType");
		System.out.println("callLoginType 호출");
		String loginId = callLoginId(loginType);
		String result = msvc.checkPw(loginType, loginId, currentPw);
		return result;
	}

	// 회원 탈퇴
	@RequestMapping(value = "/deleteUserInfo")
	public @ResponseBody boolean deleteUserInfo() {
		System.out.println("deleteUserInfo 호출");
		boolean result = false;
		String loginType = (String) session.getAttribute("loginType");
		String loginId = callLoginId(loginType);
		result = msvc.deleteUserInfo(loginType, loginId);
		return result;
	}

	// 로그인 아이디 찾기
	public String callLoginId(String loginType) {
		String loginId = "";
		if (loginType.equals("P")) {
			MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
			loginId = mdto.getMid();
		} else {
			CmemberDto cmdto = (CmemberDto) session.getAttribute("loginInfo");
			loginId = cmdto.getCmid();
		}
		return loginId;
	}
}
