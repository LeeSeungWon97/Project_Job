package com.Project_Job.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.ArrEssayDto;
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
	public ModelAndView EmploymentPage(int pageNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("EmploymentPage요청");
		System.out.println("pageNum: " + pageNum);
		ArrayList<EmploymentDto> epListAll = epsvc.getEpList("employ");
		ArrayList<EmploymentDto> epList = new ArrayList<EmploymentDto>();
		int pageIdx = pageNum;
		int pageIdxMax = epListAll.size()/15 + 1;
		System.out.println("pageIdxMax: " + pageIdxMax);
		int startIdx = 15 * (pageIdx - 1);
		int endIdx = startIdx + 14;
		if(endIdx >= epListAll.size()) {
			endIdx = epListAll.size();
		}
		for (int i = startIdx; i < endIdx; i++) {
			epList.add(epListAll.get(i));
		}
		mav.addObject("epList", epList);
		mav.addObject("pageNum", pageIdx);
		mav.addObject("pageIdxMax",pageIdxMax);
		mav.setViewName("employment/EmploymentPage");
		return mav;

	}
	// 공채 페이지 요청
	@RequestMapping(value = "/RecruitmentPage")
	public ModelAndView RecruitmentPage(int pageNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("RecruitmentPage요청");
		ArrayList<EmploymentDto> epListAll = epsvc.getEpList("recruitment");
		ArrayList<EmploymentDto> epList = new ArrayList<EmploymentDto>();
		int pageIdx = pageNum;
		int pageIdxMax = epListAll.size()/15 + 1;
		int startIdx = 15 * (pageIdx - 1);
		int endIdx = startIdx + 14;
		if(endIdx >= epListAll.size()) {
			endIdx = epListAll.size();
		}
		for (int i = startIdx; i < endIdx; i++) {
			epList.add(epListAll.get(i));
		}
		mav.addObject("epList", epList);
		mav.addObject("pageNum", pageIdx);
		mav.addObject("pageIdxMax",pageIdxMax);
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
		// System.out.println("입력받은 이력서 작성 정보 : " + ResumeInfo);

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
	public ModelAndView applyResume(String epnum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("applyResume 호출");
		MemberDto loginMInfo = (MemberDto) session.getAttribute("loginInfo");
		String remid = loginMInfo.getMid();
		System.out.println(epnum);
		int insertResult = epsvc.applyResume(epnum, remid);
		System.out.println(insertResult);
		if (insertResult == 1) {
			System.out.println("지원완료");
			mav.addObject("msg", "지원 완료");
			mav.addObject("url", "close");
			mav.setViewName("AlertScreen");
		} else if (insertResult == 9) {
			System.out.println("중복된 지원");
			mav.addObject("msg", "중복된 지원");
			mav.addObject("url", "close");
			mav.setViewName("AlertScreen");
		} else {
			System.out.println("에러");
			mav.addObject("msg", "에러");
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
			mav.addObject("msg", "로그인이 필요한 서비스입니다.");
			mav.addObject("url", "login");
			mav.addObject("pop", "pop");
			mav.setViewName("AlertScreen");
		} else if (session.getAttribute("loginType").equals("C")) {
			mav.addObject("msg", "개인회원 전용 서비스입니다.");
			mav.addObject("url", "");
			mav.addObject("pop", "pop");
			mav.setViewName("AlertScreen");
		} else {
			String loginId = mctrl.callLoginId("P");
			ArrResumeDto myresume = epsvc.SelectResume(loginId);
			if (myresume == null) {
				mav.addObject("msg", "저장된 이력서가 없습니다. 작성하시겠습니까?");
				mav.addObject("url", "WriteResumePage");
				mav.setViewName("ConfirmScreen");
			} else {
				ArrEssayDto myEssay = epsvc.findEssay(epnum, loginId);
				System.out.println(myEssay);
				String epname = epsvc.SelectEpname(epnum);
				if (myEssay != null) {
					mav.addObject("myEssay", myEssay);
					mav.addObject("epciname", myEssay.getEsciname());
					mav.addObject("epname", epname);
					mav.addObject("epnum", epnum);
					mav.addObject("content", "o");
					mav.setViewName("employment/WriteEssayPage");
				} else {
					mav.addObject("epciname", epciname);
					mav.addObject("epname", epname);
					mav.addObject("epnum", epnum);
					mav.addObject("content", "x");
					mav.setViewName("employment/WriteEssayPage");
				}
			}
		}
		return mav;
	}

	// 자소서 작성 요청
	@RequestMapping(value = "/WriteEssay")
	public @ResponseBody int WriteEssay(EssayDto EssayInfo, String DataArea1, String DataArea2, String DataArea3,
			String content) {
		System.out.println("Epcontroller WriteEssay요청");
		System.out.println(EssayInfo);
		System.out.println("DataArea1: " + DataArea1);
		System.out.println("DataArea2: " + DataArea2);
		System.out.println("DataArea3: " + DataArea3);
		EssayInfo.setEscontents(DataArea1 + "!@#" + DataArea2 + "!@#" + DataArea3);
		System.out.println(EssayInfo.getEscontents());
		System.out.println("content: " + content);
		int result = epsvc.insertEssay(EssayInfo, content);
		System.out.println("저장 결과: " + result);
		if (result == 1) {
			System.out.println("자소서 작성 완료");
		} else {
			result = 0;
		}

		return result;
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
			mav.addObject("searchValue",searchValue);
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
		System.out.println(epInfo);
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
		ArrayList<EmploymentDto> epList = epsvc.cinfoEpList(cinum);
		System.out.println(epList);
		mav.addObject("cinfo", cinfo);
		mav.addObject("epList", epList);
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
	public ModelAndView myResume(String sideX, String epnum, String state, String epciname) {
		ModelAndView mav = new ModelAndView();
		String loginType = (String) session.getAttribute("loginType");
		System.out.println("loginType: " + loginType);
		System.out.println("sideX 테스트 " + sideX);
		System.out.println(epnum);
		if (loginType == null) {
			mav.addObject("msg", "로그인(개인) 이후 이용가능합니다");
			mav.addObject("url", "login");
			mav.addObject("pop", "pop");
			mav.setViewName("AlertScreen");
		} else {
			//
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
					mav.addObject("state", state);
					mav.addObject("epciname", epciname);
					mav.setViewName("employment/MyResumePage");
				}
			} else {
				mav.addObject("msg", "개인회원 전용 페이지 입니다.");
				mav.addObject("url", "");
				mav.setViewName("AlertScreen");
			}
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
		} else if (loginType.equals("C")) {
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
		String loginType = (String) session.getAttribute("loginType");
		if (loginType.equals("C")) {
			String loginId = mctrl.callLoginId(loginType);
			String cmciname = mctrl.selectCmciname(loginId);
			epsvc.updateReciname(cmciname, viewId);
		}
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

	@RequestMapping(value = "/RecinameList")
	public ModelAndView RecinameList() {
		ModelAndView mav = new ModelAndView();
		System.out.println("RecinameList호출");
		String loginType = (String) session.getAttribute("loginType");
		String loginId = mctrl.callLoginId(loginType);
		ArrResumeDto resume = epsvc.SelectResume(loginId);
		System.out.println(resume);
		mav.addObject("Resume", resume);
		mav.setViewName("employment/RecinameList");
		return mav;
	}

	@RequestMapping(value = "/viewReciname")
	public ModelAndView viewReciname(String viewReciname) {
		ModelAndView mav = new ModelAndView();
		System.out.println("viewReciname호출");
		String cinum = epsvc.selectCinum(viewReciname);
		mav.setViewName("redirect:/viewCiInfo?cinum=" + cinum);
		return mav;
	}
	
	@RequestMapping(value = "/searchValueJson")
	public @ResponseBody String searchValueJson(String searchValue, String selectType) {
		System.out.println(searchValue);
		System.out.println(selectType);
		String epList = "";
		if (searchValue.length() >= 2) {
			epList = epsvc.getEpListGson(searchValue, selectType);
			return epList;
		} else {
			return null;
		}
	}

//	@RequestMapping(value = "/searchValueJson")
//	public @ResponseBody String searchValueJson(String searchValue, String selectType) {
//		System.out.println(searchValue);
//		System.out.println(selectType);
//		String epList = "";
//		String ciList = "";
//		if (searchValue.length() >= 2) {
//			if (selectType.equals("공고")) {
//				epList = epsvc.getEpListGson(searchValue);
//				System.out.println("공고 : " + epList);
//				return epList;
//			} else if (selectType.equals("기업")) {
//				ciList = epsvc.getCiListGson(searchValue);
//				System.out.println("기업 : " + ciList);
//				return ciList;
//			} else {
//				return "";
//			}
//		} else {
//			return null;
//		}
//	}

}
