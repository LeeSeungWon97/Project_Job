package com.Project_Job.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.ArrResumeDto;
import com.Project_Job.dto.CinfoDto;
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

	private String requestUrl = "http://localhost:8080/controller/";

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
	public ModelAndView WriteResumePage(String epnum) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employment/WriteResumePage");
		return mav;
	}

	// 이력서 작성 요청
	@RequestMapping(value = "/WriteResume")
	public ModelAndView WriteResume(ResumeDto ResumeInfo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("Epcontroller WriteResume요청");
		String loginId = mctrl.callLoginId("P");
		ResumeInfo.setRemid(loginId);
		System.out.println("입력받은 이력서 작성 정보 : " + ResumeInfo);

		int insertResult = epsvc.WriteResume(ResumeInfo);
		if (insertResult < 0) {
			mav.addObject("msg", "작성 실패 ");
			mav.addObject("url", "WriteResume");
			mav.setViewName("AlertScreen");
		} else {
			mav.setViewName("redirect:/myResume");
		}

		return mav;
	}

	@RequestMapping(value = "/applyResume")
	public ModelAndView applyResume(ResumeDto ResumeInfo, String epnum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("applyResume 호출");
		MemberDto loginMInfo = (MemberDto) session.getAttribute("loginInfo");
		String remid = loginMInfo.getMid();
		System.out.println(ResumeInfo);
		System.out.println(epnum);
		int insertResult = epsvc.applyResume(epnum, remid);
		System.out.println(insertResult);
		if (insertResult <= 0) {
			mav.addObject("msg", "지원 실패 ");
			mav.addObject("url", "close");
			mav.setViewName("AlertScreen");
		}else if (insertResult == 9) {
			mav.addObject("msg", "이미 지원하신 공고 입니다. ");
			mav.addObject("url", "close");
			mav.setViewName("AlertScreen");
		}
		else {
			mav.addObject("msg", "지원 성공 ");
			mav.addObject("url", "close");
			mav.setViewName("AlertScreen");
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

	// 스크랩 요청
	@RequestMapping(value = "/scrapEpname")
	public @ResponseBody String scrapCiname(String checkedName) {
		System.out.println("Epcontroller scrapCiname요청");
		System.out.println(checkedName);
		MemberDto loginMInfo = (MemberDto) session.getAttribute("loginInfo");
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
		MemberDto loginMInfo = (MemberDto) session.getAttribute("loginInfo");
		String smid = loginMInfo.getMid();
		ScrapDto scrapInfo = new ScrapDto();
		scrapInfo.setSpmid(smid);
		scrapInfo.setSpepnum(checkedName);
		epsvc.deleteScrap(smid, checkedName);

		return null;
	}

	@RequestMapping(value = "/selectScrapInfo")
	public @ResponseBody String selectScrapInfo() {
		if (session.getAttribute("loginInfo") != null) {
			MemberDto loginMInfo = (MemberDto) session.getAttribute("loginInfo");
			String smid = loginMInfo.getMid();
			String scrapInfo = epsvc.selectScrapInfo(smid);
			return scrapInfo;
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/searchValue")
	public ModelAndView searchValue(String searchValue, String currentURL) {
		ModelAndView mav = new ModelAndView();
		System.out.println(searchValue);
		System.out.println(currentURL);
		if (searchValue.length() <= 0) {
			mav.addObject("msg", "검색어를 입력해주세요!");
			mav.addObject("url", currentURL);
			mav.setViewName("AlertScreen");
		} else {
			ArrayList<EmploymentDto> epList = epsvc.getEpList(searchValue);
			ArrayList<CinfoDto> ciList = epsvc.getCiList(searchValue);
			mav.addObject("epList", epList);
			mav.addObject("ciList", ciList);
			mav.setViewName("employment/SearchPage");
		}

		return mav;
	}

	@RequestMapping(value = "/ViewEpInfo")
	public ModelAndView viewEpInfo(String epnum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("viewEpInfo 호출");
		System.out.println(epnum);
		EmploymentDto epInfo = epsvc.viewEpInfo(epnum);
		mav.addObject("epInfo", epInfo);
		mav.setViewName("employment/ViewEpInfo2");

		return mav;
	}

	@RequestMapping(value = "/CinfoListPage")
	public ModelAndView CinfoListPage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("CinfoListPage 호출");
		ArrayList<CinfoDto> cinfoList = epsvc.getCiList("");
		mav.addObject("cinfoList", cinfoList);
		mav.setViewName("employment/CinfoListPage");

		return mav;
	}

	@RequestMapping(value = "/viewCiInfo")
	public ModelAndView viewCiInfo(String cinum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("viewCiInfo 호출");
		System.out.println("요청받은 기업코드 : " + cinum);
		CinfoDto cinfo = epsvc.viewCinfo(cinum);
		mav.addObject("cinfo", cinfo);
		mav.setViewName("employment/ViewCiInfo");
		return mav;
	}

	@RequestMapping(value = "/WriteEmploymentPage")
	public ModelAndView WriteEmploymentPage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("WriteEmploymentPage 요청");
		mav.setViewName("employment/Cmember/WriteEmploymentPage");
		return mav;
	}
	
	@RequestMapping(value = "/WriteEmployment")
	public ModelAndView WriteEmployment(EmploymentDto epinfo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("WriteEmployment 요청");
		System.out.println("요청받은 epinfo :" + epinfo);
		int insertResult = epsvc.WriteEmployment(epinfo);
		if (insertResult > 0) {
			mav.addObject("msg", "공고등록완료!");
			mav.addObject("url", requestUrl);
			mav.setViewName("AlertScreen");
		} else {
			mav.addObject("msg", "입력 정보를 다시 확인해주세요!");
			mav.addObject("url", "WriteEmploymentPage");
			mav.setViewName("AlertScreen");
		}
		return mav;
	}

	@RequestMapping(value = "/myResume")
	public ModelAndView myResume(String sideX, String epnum) {
		ModelAndView mav = new ModelAndView();
		String loginType = (String) session.getAttribute("loginType");
		System.out.println("loginType: " + loginType);
		System.out.println("sideX 테스트 "+ sideX);
		System.out.println(epnum);
		if (loginType.equals("P")) {
			String loginId = mctrl.callLoginId(loginType);
			System.out.println("loginId: " + loginId);
			ArrResumeDto myresume = epsvc.SelectResume(loginId);
			System.out.println(myresume);
			if (myresume == null) {
				mav.addObject("msg", "저장된 이력서가 없습니다. 작성하시겠습니까?");
				mav.addObject("url", "WriteResumePage");
				mav.setViewName("ConfirmScreen");
			} else {
				mav.addObject("Resume", myresume);
				mav.addObject("sideX", sideX);
				mav.addObject("epnum", epnum);
				mav.setViewName("employment/MyResumePage");
			}
		} else if (loginType.equals("C")) {
			mav.addObject("msg", "개인회원 전용 페이지 입니다.");
			mav.addObject("url", "");
			mav.setViewName("AlertScreen");
		} else {
			mav.addObject("msg", "로그인(개인) 이후 이용가능합니다");
			mav.addObject("url", "login");
			mav.setViewName("AlertScreen");
		}
		return mav;
	}

	// 공채달력 페이지 이동
	@RequestMapping(value = "/calendar")
	public String calendar() {
		System.out.println("공채달력 페이지 이동 요청");
		return "employment/calendar";
	}

	// 공채 날짜 요청
	@RequestMapping(value = "/epSchedule")
	public @ResponseBody ArrayList<Map<String, String>> epSchedule() {
		System.out.println("공채 스케줄 요청");
		ArrayList<Map<String, String>> epSchedule = epsvc.epSchedule();
		return epSchedule;
	}
	
	
	@RequestMapping(value = "/viewApply")
	public ModelAndView viewApply() {
		ModelAndView mav = new ModelAndView();
		System.out.println("viewApply 요청");
		String loginType = (String) session.getAttribute("loginType");
		if (loginType.equals("P")) {
			String loginId = mctrl.callLoginId(loginType);
			ArrayList<Map<String, String>> ApplyList = epsvc.viewApplyMember(loginId);
			System.out.println(ApplyList);
			mav.addObject("ApplyList", ApplyList);
		}else if (loginType.equals("C")) {
			String loginId = mctrl.callLoginId(loginType);
			ArrayList<Map<String, String>> ApplyList = epsvc.viewApplyCmember(loginId);
			mav.addObject("ApplyList", ApplyList);
			System.out.println(ApplyList);
		}
		mav.setViewName("employment/ViewApplyStatePage");
		return mav;
	}
	@RequestMapping(value = "/viewApplyInfo")
	public ModelAndView viewApplyInfo(String viewId) {
		ModelAndView mav = new ModelAndView();
		System.out.println("viewApplyInfo호출");
		ArrResumeDto myresume = epsvc.SelectResume(viewId);
		MemberDto member = epsvc.selectViewInfo(viewId);
		System.out.println(myresume);
		mav.addObject("Resume", myresume);
		mav.addObject("member", member);
		mav.setViewName("employment/Cmember/viewApplyInfo");
		return mav;
	}
	
	@RequestMapping(value = "/viewResumeInfo")
	public ModelAndView viewResumeInfo() {
		ModelAndView mav = new ModelAndView();
		System.out.println("viewResumeInfo호출");
		ArrayList<ArrResumeDto> resumeList = epsvc.viewResumeInfo();
		System.out.println(resumeList);
		mav.addObject("ResumeList", resumeList);
		mav.setViewName("employment/Cmember/viewResumeInfo");
		return mav;
	}
}
