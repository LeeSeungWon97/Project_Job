package com.Project_Job.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.EmploymentDto;
import com.Project_Job.dto.EssayDto;
import com.Project_Job.dto.MemberDto;
import com.Project_Job.dto.ResumeDto;
import com.Project_Job.dto.ScrapDto;
import com.Project_Job.service.EmploymentService;

@Controller
public class EmploymentController {
	@Autowired
	private EmploymentService epsvc;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberController mctrl;

	// 회사 검색 요청
	@RequestMapping(value = "/getWPList")
	public @ResponseBody String getWPList(String ciname) {
		System.out.println("회사 검색 요청");
		System.out.println("입력한 회사이름 : " + ciname);
		String ciList = epsvc.getWPList(ciname);
		System.out.println(ciList);
		return ciList;
	}

	// 회사 이름 요청
	@RequestMapping(value = "/sendCname", produces = "application/text;charset=UTF-8")
	public @ResponseBody String sendCname(String cmcinum) {
		System.out.println("기업명 조회 요청");
		String result = epsvc.getCompanyName(cmcinum);
		System.out.println("result: " + result);
		return result;
	}

	// 채용공고 페이지 요청
	@RequestMapping(value = "/EmploymentPage")
	public ModelAndView EmploymentPage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("EmploymentPage요청");
		ArrayList<EmploymentDto> epList = epsvc.getEpList("employ");
		System.out.println(epList);
		mav.addObject("epList", epList);
		mav.setViewName("employment/EmploymentPage");
		return mav;
	}

	// 공채 페이지 요청
	@RequestMapping(value = "/RecruitmentPage")
	public ModelAndView RecruitmentPage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("RecruitmentPage요청");
		ArrayList<EmploymentDto> epList = epsvc.getEpList("recruitment");
		mav.addObject("epList", epList);
		mav.setViewName("employment/RecruitmentPage");
		return mav;
	}

	// 이력서 작성 페이지 요청
	@RequestMapping(value = "/WriteResumePage")
	public ModelAndView WriteResumePage() {
		ModelAndView mav = new ModelAndView();
		String remid = mctrl.callLoginId("P");
		ResumeDto ResumeInfo = epsvc.SelectResume(remid);
		if (ResumeInfo != null) {
			mav.addObject("Resume", ResumeInfo);
			mav.setViewName("employment/MyResumePage");
		} else {
			mav.setViewName("employment/WriteResumePage");
		}
		return mav;
	}

	// 이력서 작성 요청
	@RequestMapping(value = "/WriteResume")
	public ModelAndView WriteResume(ResumeDto ResumeInfo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("Epcontroller WriteResume요청");
		System.out.println("입력받은 이력서 작성 정보 : " + ResumeInfo);

		int insertResult = epsvc.WriteResume(ResumeInfo);
		if (insertResult < 0) {
			mav.addObject("msg", "작성 실패 ");
			mav.addObject("url", "WriteResume");
			mav.setViewName("AlertScreen");
		} else {
			mav.setViewName("Main");
		}
		return mav;
	}

	// 자소서 작성 페이지 요청
	@RequestMapping(value = "/WriteEssayPage", produces = "application/text;charset=UTF-8")
	public ModelAndView WriteEssayPage(String epnum, String epciname) {
		ModelAndView mav = new ModelAndView();
		System.out.println("Epcontroller WriteEssayPage요청");
		if (session.getAttribute("loginInfo") == null) {
			mav.setViewName("member/Login");
		} else {
			System.out.println("epnum" + epnum);
			System.out.println("epciname" + epciname);
			String epname = epsvc.SelectEpname(epnum);
			System.out.println("epname" + epname);
			mav.addObject("epciname", epciname);
			mav.addObject("epname", epname);
			mav.addObject("epnum", epnum);
			mav.setViewName("employment/WriteEssayPage");
		}
		return mav;
	}

	// 자소서 작성 요청
	@RequestMapping(value = "/WriteEssay")
	public ModelAndView WriteEssay(EssayDto EssayInfo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("Epcontroller WriteEssay요청");
		System.out.println(EssayInfo);
		int insertResult = epsvc.insertEssay(EssayInfo);
		if (insertResult > 0) {
			mav.setViewName("Main");
		} else {
			mav.setViewName("employment/WriteEssayPage");
		}

		return null;
	}

	
	//스크랩 요청
		@RequestMapping(value = "/scrapEpname")
		public @ResponseBody String scrapCiname(String checkedName) {
			System.out.println("Epcontroller scrapCiname요청");
			System.out.println(checkedName);
			MemberDto loginMInfo =  (MemberDto) session.getAttribute("loginInfo");
			//String loginType = (String) session.getAttribute("loginType");
			//String loginId = mcontroller.loginLid(loginType);
			String smid = loginMInfo.getMid();
			ScrapDto scrapInfo = new ScrapDto();
			scrapInfo.setSpmid(smid);
			scrapInfo.setSpepnum(checkedName);
			epsvc.insertScrap(scrapInfo);
			
			return null;
		}

		@RequestMapping(value = "/removeScrap")
		public @ResponseBody String removeScrap(String checkedName) {
			System.out.println("Epcontroller removeScrap요청");
			System.out.println(checkedName);
			MemberDto loginMInfo =  (MemberDto) session.getAttribute("loginInfo");
			String smid = loginMInfo.getMid();
			ScrapDto scrapInfo = new ScrapDto();
			scrapInfo.setSpmid(smid);
			scrapInfo.setSpepnum(checkedName);
			epsvc.deleteScrap(smid,checkedName);
			
			return null;
		}
		
		@RequestMapping(value = "/selectScrapInfo")
		public @ResponseBody String selectScrapInfo() {
			MemberDto loginMInfo =  (MemberDto) session.getAttribute("loginInfo");
			String smid = loginMInfo.getMid();
			String scrapInfo = epsvc.selectScrapInfo(smid);
			
			return scrapInfo;
		}	
		
		
		
}
