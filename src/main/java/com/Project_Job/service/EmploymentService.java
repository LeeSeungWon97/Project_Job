package com.Project_Job.service;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project_Job.dao.EmploymentDao;
import com.Project_Job.dto.ArrEssayDto;
import com.Project_Job.dto.ArrResumeDto;
import com.Project_Job.dto.CinfoDto;
import com.Project_Job.dto.EmploymentDto;
import com.Project_Job.dto.EssayDto;
import com.Project_Job.dto.MemberDto;
import com.Project_Job.dto.ResumeDto;
import com.Project_Job.dto.ScrapDto;
import com.google.gson.Gson;

@Service
public class EmploymentService {

	@Autowired
	private EmploymentDao epdao;

	public int jobInsert1() throws Exception {
		// 1. 잡코리아 채용정보 페이지 URL
		String jobUrl = "https://www.jobkorea.co.kr/recruit/joblist?menucode=local&localorder=1";

		// 2. Jsoup URL 접속
		Document doc = Jsoup.connect(jobUrl).get();

		Elements charDiv = doc.select("#dev-gi-list > div > div.tplList.tplJobList > table > tbody");
		Elements JobLi = charDiv.select("tr");

		int insertResult = 0;
		System.out.println(JobLi.size());
		/*
		 * 잡코리아 내부 서버에서 과도한 접속으로 인해 차단당함 3회씩 반복문을 돌리면 오류 발생 X 오류 발생시 => 크롤링 진행이 안되고 x값이
		 * 컬럼에 insert된다. 잡코리아 홈페이지 접속후 인증코드 입력후 재시도 반복
		 */
		for (int i = 30; i < 40; i++) {
			// 5. 잡코리아 채용정보에서 공고 선택시 url 주소
			String detailUrl = "https://www.jobkorea.co.kr/"
					+ JobLi.eq(i).select("td.tplTit > div > strong > a").eq(0).attr("href");
			Document detailDoc = Jsoup.connect(detailUrl).get();

			Elements baseMovie = detailDoc.select("#container > section > div.readSumWrap.clear > article");
			System.out.println("================================");
			Elements Exciname = baseMovie.select("div.sumTit > h3");
			Elements removerole = Exciname.select("div").remove();

			// 공고명
			String epname = Exciname.text();
			// 회사명
			String epciname = JobLi.eq(i).select("td.tplCo > a").text();
			// 경력
			String epcareer = baseMovie.select("div.tbRow.clear > div:nth-child(1) > dl > dd:nth-child(2)").text();
			// 학력
			String epedu = baseMovie.select("div.tbRow.clear > div:nth-child(1) > dl > dd:nth-child(4)").text();
			// 고용형태
			String eptype = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(2)").text();
			// 급여
			String epmoney = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(4)").text();
			// 시간
			String eptime = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(8)").text();
			// 지역
			String eparea = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(6)").text();
			// 우대
			// #dlPref > dd > span
			String eptreat = baseMovie.select("#dlPref > dd > span").text();

			// 시작일
			String eppost = detailDoc
					.select("#tab02 > div > article.artReadPeriod > div > dl.date > dd:nth-child(2) > span").text();
			// 마감일
			String epdeadline = detailDoc
					.select("#tab02 > div > article.artReadPeriod > div > dl.date > dd:nth-child(4) > span").text();

			// 공고 dto
			EmploymentDto epinfo = new EmploymentDto();

			// 잡코리아 상세 페이지 내부 selector에 차이가 있어 순서가 바뀌는 경우가 발생
			System.out.println(detailUrl);
			System.out.println("회사명 : " + i + "번 " + epciname);
			System.out.println("공고명 : " + i + "번 " + epname);
			System.out.println("경력 : " + i + "번 " + epcareer);
			System.out.println("학력 : " + i + "번 " + epedu);
			System.out.println("고용형태 : " + i + "번 " + eptype);
			System.out.println("급여 : " + i + "번 " + epmoney);
			System.out.println("시간 : " + i + "번 " + eptime);
			System.out.println("지역 : " + i + "번 " + eparea);
			System.out.println("우대 : " + i + "번 " + eptreat);
			System.out.println("시작일 : " + i + "번 " + eppost);
			System.out.println("마감일 : " + i + "번 " + epdeadline);

			DateFormat DFormat = DateFormat.getDateInstance();
			Date rvdate = new Date();
			System.out.println("현재시간 :" + rvdate);
			String nowDay = DFormat.format(rvdate);
			String dbDay = nowDay.replace(". ", "-");

			String maxEpcode = epdao.selectMaxEpnum();
			System.out.println("공고코드 최대값 : " + maxEpcode);
			String epcode = "EP";
			if (maxEpcode == null) {
				epcode = epcode + String.format("%03d", 1);
				System.out.println("처음 공고 : " + epcode);
			} else {
				int cicodeNum = Integer.parseInt(maxEpcode.replace("EP", "")) + 1;
				epcode = epcode + String.format("%03d", cicodeNum);
			}
			System.out.println("공고코드 : " + epcode);

			String epCheck = epdao.checkEp(epname, epciname);
			if (epCheck != null) {
				continue;
			}

			if (epname.equals("")) {
				epname = "-";
			}
			if (epciname.equals("")) {
				epciname = "-";
			}
			if (epcareer.equals("")) {
				epcareer = "-";
			}
			if (epedu.equals("")) {
				epedu = "-";
			}
			if (eptype.equals("")) {
				eptype = "-";
			}
			if (epmoney.equals("")) {
				epmoney = "-";
			}
			if (eptime.equals("")) {
				eptime = "-";
			}
			if (eparea.equals("")) {
				eparea = "-";
			}
			if (eptreat.equals("")) {
				eptreat = "-";
			}
			if (eppost.equals("")) {
				eppost = dbDay.replace(".", "");
			}

			epinfo.setEpnum(epcode);
			epinfo.setEpname(epname);
			epinfo.setEpciname(epciname);
			epinfo.setEpcareer(epcareer);
			epinfo.setEpedu(epedu);
			epinfo.setEptype(eptype);
			epinfo.setEpmoney(epmoney);
			epinfo.setEptime(eptime);
			epinfo.setEparea(eparea);
			epinfo.setEptreat(eptreat);
			epinfo.setEppost(eppost);
			epinfo.setEpdeadline(epdeadline);
			epinfo.setEpstate("Y");

			System.out.println();
			insertResult += epdao.insertEmployments(epinfo);

		}

		System.out.println("등록된 공고 수 : " + insertResult);
		return insertResult;
	}

	public String getWPList(String ciname) {
		System.out.println("Service getWPList 요청");
		ArrayList<Map<String, String>> ciList = epdao.getWPList(ciname);
		System.out.println();
		return new Gson().toJson(ciList);
	}

	public int jobInsert2() throws Exception {
		// 1. 잡코리아 채용정보 페이지 URL
		String jobUrl = "https://www.jobkorea.co.kr/recruit/joblist?menucode=local&localorder=1";

		// 2. Jsoup URL 접속
		Document doc = Jsoup.connect(jobUrl).get();
		Elements charDiv = doc.select("#dev-gi-list > div > div.tplList.tplJobList > table > tbody");
		Elements movLi = charDiv.select("tr");

		int insertResult = 0;
		System.out.println(movLi.size());
		for (int i = 0; i < 5; i++) {
			// 5. 잡코리아 기업 상세정보 페이지 url 주소
			String detailUrl = "https://www.jobkorea.co.kr/" + movLi.eq(i).select("td.tplCo > a").eq(0).attr("href");
			// System.out.println(detailUrl);
			Document detailDoc = Jsoup.connect(detailUrl).get();
			Elements baseC = detailDoc.select("#container > section > div.readSumWrap.clear > article");
			System.out.println("================================");
			// 회사 상세정보
			String baseCName = movLi.eq(i).select("td.tplCo > a").text();
			System.out.println(detailUrl);
			Document cDoc = Jsoup.connect(detailUrl).get();
			Elements baseCom = cDoc.select("#company-body > div.company-body-infomation");
			System.out.println("tbody > tr사이즈 : " + baseCom.select("tbody > tr").size());
			System.out.println("tbody : " + baseCom.select("tbody").size());
			// 잡코리아 상세 페이지 내부 selector에 차이가 있어 순서가 바뀌는 경우가 발생
			// 산업
			String ciind = baseCom.select("tbody > tr:nth-child(1) > td:nth-child(2) > div > div").text();
			// 사원수
			String cipeople = baseCom.select("tbody > tr:nth-child(1) > td:nth-child(4) > div > div > div.value")
					.text();
			// 기업구분
			String citype = baseCom.select("tbody > tr:nth-child(2) > td:nth-child(2) > div > div").text();
			// 설립일
			String ciest = baseCom.select("tbody > tr:nth-child(2) > td:nth-child(4) > div > div > div.value").text();
			// 자본금
			String cimoney = baseCom.select("tbody > tr:nth-child(3) > td:nth-child(2) > div > div").text();
			// 매출액
			String cisales = baseCom.select("tbody > tr:nth-child(3) > td:nth-child(4) > div > div").text();
			// 대표자
			String cileader = baseCom.select("tbody > tr:nth-child(4) > td:nth-child(2) > div > div").text();
			// 대졸초임
			String ciwage = baseCom.select("tbody > tr:nth-child(4) > td:nth-child(4) > div > div > div > div").text();
			try {
				Integer number = Integer.valueOf(ciwage);
				System.out.println(number);
			} catch (NumberFormatException ex) {
				ciwage = baseCom.select("tbody > tr:nth-child(4) > td:nth-child(4) > div > div > div > div").text();
			}
			// 주요사업
			String cimajor = baseCom.select("tbody > tr:nth-child(5) > td:nth-child(2) > div > div").text();
			// 4대보험
			String ciinsurance = baseCom.select("tbody > tr:nth-child(5) > td:nth-child(4) > div > div").text();
			if (cimajor.contains("보험")) {
				ciinsurance = cimajor;
				cimajor = baseCom.select("tbody > tr:nth-child(4) > td:nth-child(4) > div > div").text();
			}
			// 홈페이지
			String cihomepage = baseCom.select("tbody > tr:nth-child(6) > td:nth-child(2) > div > div > a").text();
			// 주소
			String ciaddr = baseCom.select("tbody > tr:nth-child(6) > td:nth-child(4) > div > div.value").text();
			// 잡코리아 상세 페이지 내부 selector에 차이가 있어 순서가 바뀌는 경우가 발생
			CinfoDto cinfo = new CinfoDto();
			System.out.println("순서 : " + i);
			String maxCicode = epdao.selectMaxCinum();
			System.out.println("회사코드 최대값 : " + maxCicode);
			String cicode = "CI";
			if (maxCicode == null) {
				cicode = cicode + String.format("%03d", 1);
				System.out.println("처음 회사코드 : " + cicode);
			} else {
				int cicodeNum = Integer.parseInt(maxCicode.replace("CI", "")) + 1;
				cicode = cicode + String.format("%03d", cicodeNum);
			}
			System.out.println("회사코드 : " + cicode);

			String mvCheck = epdao.checkCom(baseCName);
			if (mvCheck != null) {
				continue;
			}

			if (baseCName.equals("")) {
				baseCName = "-";
			}
			if (ciind.equals("")) {
				ciind = "-";
			}
			if (cipeople.equals("")) {
				cipeople = "-";
			}
			if (citype.equals("")) {
				citype = "-";
			}
			if (ciest.equals("")) {
				ciest = "-";
			}
			if (cimoney.equals("")) {
				cimoney = "-";
			}
			if (cisales.equals("")) {
				cisales = "-";
			}
			if (cileader.equals("")) {
				cileader = "-";
			}
			if (ciwage.equals("")) {
				ciwage = "-";
			}
			if (cimajor.equals("")) {
				cimajor = "-";
			}
			if (ciinsurance.equals("")) {
				ciinsurance = "-";
			}
			if (cihomepage.equals("")) {
				cihomepage = "-";
			}
			if (ciaddr.equals("")) {
				ciaddr = "-";
			}
			System.out.println("기업명 : " + baseCName);
			System.out.println("산업 : " + ciind);
			System.out.println("사원수  : " + cipeople);
			System.out.println("기업구분  : " + citype);
			System.out.println("설립일  : " + ciest);
			System.out.println("자본금  : " + cimoney);
			System.out.println("매출액  : " + cisales);
			System.out.println("대표자  : " + cileader);
			System.out.println("대졸초임  : " + ciwage);
			System.out.println("주요사업  : " + cimajor);
			System.out.println("4대보험  : " + ciinsurance);
			System.out.println("홈페이지  : " + cihomepage);
			System.out.println("주소  : " + ciaddr);
			// 회사테이블
			cinfo.setCinum(cicode);
			cinfo.setCiname(baseCName);
			cinfo.setCiind(ciind);
			cinfo.setCipeople(cipeople);
			cinfo.setCitype(citype);
			cinfo.setCiest(ciest);
			cinfo.setCimoney(cimoney);
			cinfo.setCisales(cisales);
			cinfo.setCileader(cileader);
			cinfo.setCiwage(ciwage);
			cinfo.setCimajor(cimajor);
			cinfo.setCiinsurance(ciinsurance);
			cinfo.setCihomepage(cihomepage);
			cinfo.setCiaddr(ciaddr);

			insertResult += epdao.insertCinfo(cinfo);

			System.out.println();

		}

		System.out.println("등록된 회사 수 : " + insertResult);
		return 0;
	}

	public String getCompanyName(String cmcinum) {
		System.out.println("Employment getCompanyName() 호출");
		String ciname = epdao.selectCiName(cmcinum);
		return ciname;
	}

	public ArrayList<EmploymentDto> getEpList(String pageType) {
		System.out.println("epsvc getEpList 호출");
		System.out.println("pageType: " + pageType);
		if (pageType == "employ") {
			ArrayList<EmploymentDto> epList = epdao.getEpList();
			return epList;
		} else if (pageType == "recruitment") {
			ArrayList<EmploymentDto> epList = epdao.getRcList();
			return epList;
		} else {
			ArrayList<EmploymentDto> epList = epdao.getSearchList(pageType);
			return epList;
		}
	}

	// 이력서 작성
	public int WriteResume(ResumeDto resumeInfo) {
		System.out.println("epsvc WriteResume 요청");
		System.out.println("epsvc resumeInfo" + resumeInfo);
		String remid = resumeInfo.getRemid();
		System.out.println("remid : " + remid);
		String selectResult = epdao.selectResumeInfo(remid);
		System.out.println("selectResult :" + selectResult);
		int insertResult;
		if (selectResult == null) {
			System.out.println("기존 이력서 정보 x: " + resumeInfo);
			insertResult = epdao.WriteResume(resumeInfo);
		} else {
			System.out.println("기존 이력서 정보 o: " + resumeInfo);
			insertResult = epdao.UpdateResume(resumeInfo);
		}
		return insertResult;
	}

	// 자소서 작성
	public int insertEssay(EssayDto essayInfo, String content) {
		System.out.println("epsvc insertEssay요청");
		System.out.println(essayInfo);
		if (content.equals("x")) {
			String maxEicode = epdao.selectMaxEsnum();
			System.out.println("자소서코드 최대값 : " + maxEicode);
			String escode = "ES";
			if (maxEicode == null) {
				escode = escode + String.format("%03d", 1);
				System.out.println("처음 자소서코드 : " + escode);
			} else {
				int escodeNum = Integer.parseInt(maxEicode.replace("ES", "")) + 1;
				escode = escode + String.format("%03d", escodeNum);
			}
			System.out.println("자소서코드 : " + escode);
			essayInfo.setEsnum(escode);
			int insertResult = epdao.insertEssay(essayInfo);
			System.out.println("insertResult: " + insertResult);
			return insertResult;
		} else {
			int updateResult = epdao.updateEssay(essayInfo);
			System.out.println("updateResult: " + updateResult);
			return updateResult;
		}
	}

	// 이력서 가져오기
	public ArrResumeDto SelectResume(String remid) {
		System.out.println("epsvc SelectResume 요청");
		ArrResumeDto ArrResumeInfo = new ArrResumeDto();
		ResumeDto ResumeInfo = epdao.SelectResume(remid);
		if (ResumeInfo == null) {
			return null;
		} else {
			ArrResumeInfo.setRemid(remid);
			ArrResumeInfo.setRetell(ResumeInfo.getRetell());
			ArrResumeInfo.setRecount(ResumeInfo.getRecount());
			ArrResumeInfo.setRehope(ResumeInfo.getRehope());
			if (ResumeInfo.getReedu() != null) {
				String[] reedu = ResumeInfo.getReedu().split("!@#");
				ArrResumeInfo.setReedu(reedu);
			}
			if (ResumeInfo.getRecarrer() != null) {
				String[] recarrer = ResumeInfo.getRecarrer().split("!@#");
				ArrResumeInfo.setRecarrer(recarrer);
			}
			if (ResumeInfo.getReact() != null) {
				String[] react = ResumeInfo.getReact().split("!@#");
				ArrResumeInfo.setReact(react);
			}
			if (ResumeInfo.getRelicense() != null) {
				String[] relicense = ResumeInfo.getRelicense().split("!@#");
				ArrResumeInfo.setRelicense(relicense);
			}
			if (ResumeInfo.getReciname() != null) {
				String[] reciname = ResumeInfo.getReciname().split("!@#");
				ArrResumeInfo.setReciname(reciname);
			}
			return ArrResumeInfo;
		}
	}

	// 공고이름
	public String SelectEpname(String epnum) {
		String epname = epdao.SelectEpname(epnum);
		return epname;
	}

	// 스크랩등록
	public int insertScrap(ScrapDto scrapInfo) {
		System.out.println("epsvc insertScrap요청");
		String maxSpcode = epdao.selectMaxSpnum();
		System.out.println("스크랩 번호 최대값 : " + maxSpcode);
		String spcode = "SP";
		if (maxSpcode == null) {
			spcode = spcode + String.format("%03d", 1);
			System.out.println("처음 스크랩코드 : " + spcode);
		} else {
			int spcodeNum = Integer.parseInt(maxSpcode.replace("SP", "")) + 1;
			spcode = spcode + String.format("%03d", spcodeNum);
		}
		System.out.println("스크랩코드 : " + spcode);
		scrapInfo.setSpnum(spcode);
		int insertResult = epdao.insertScrap(scrapInfo);
		return insertResult;
	}

	// 스크랩삭제
	public int deleteScrap(String smid, String checkedName) {
		System.out.println("epsvc insertScrap요청");
		int deleteResult = epdao.deleteScrap(smid, checkedName);
		return deleteResult;
	}

	// 스크랩정보
	public String selectScrapInfo(String smid) {
		ArrayList<ScrapDto> spList = epdao.selectScrapInfo(smid);
		return new Gson().toJson(spList);
	}

	// 기업정보리스트
	public ArrayList<CinfoDto> getCiList(String searchValue) {
		if (searchValue.length() > 0) {
			ArrayList<CinfoDto> ciList = epdao.getCiList(searchValue);
			return ciList;
		} else {
			ArrayList<CinfoDto> ciList = epdao.CinfoList();
			return ciList;
		}
	}

	// 고용정보
	public EmploymentDto viewEpInfo(String epnum) {
		System.out.println("epsvc viewEpInfo요청");
		EmploymentDto epinfo = epdao.viewEpInfo(epnum);
		return epinfo;
	}

	// 이력서지원
	public int applyResume(String epnum, String remid) {
		int insertResult = 0;
		try {
			insertResult = epdao.applyResume(epnum, remid);
		} catch (Exception e) {
			insertResult = 9;
		}
		return insertResult;
	}

	// 기업상세정보
	public CinfoDto viewCinfo(String cinum) {
		CinfoDto cinfo = epdao.viewCinfo(cinum);
		return cinfo;
	}

	public int WriteEmployment(EmploymentDto epinfo) {
		DateFormat DFormat = DateFormat.getDateInstance();
		Date rvdate = new Date();
		String nowDay = DFormat.format(rvdate);
		String dbDay = nowDay.replace(". ", "-");
		System.out.println("현재시간 :" + dbDay);
		String eppost = dbDay.replace(".", "");

		String epname = epinfo.getEpname();
		String epciname = epinfo.getEpciname();
		String maxEpcode = epdao.selectMaxEpnum();
		System.out.println("공고코드 최대값 : " + maxEpcode);
		String epcode = "EP";
		if (maxEpcode == null) {
			epcode = epcode + String.format("%03d", 1);
			System.out.println("처음 공고 : " + epcode);
		} else {
			int cicodeNum = Integer.parseInt(maxEpcode.replace("EP", "")) + 1;
			epcode = epcode + String.format("%03d", cicodeNum);
		}
		System.out.println("공고코드 : " + epcode);

		String epCheck = epdao.checkEp(epname, epciname);
		if (epCheck != null) {
			return 0;
		}
		if (epinfo.getEpname().equals("")) {
			epinfo.setEpname("-");
		}
		if (epinfo.getEpciname().equals("")) {
			epinfo.setEpciname("-");
		}
		if (epinfo.getEpcareer().equals("")) {
			epinfo.setEpcareer("-");
		}
		if (epinfo.getEpedu().equals("")) {
			epinfo.setEpedu("-");
		}
		if (epinfo.getEptype().equals("")) {
			epinfo.setEptype("-");
		}
		if (epinfo.getEpmoney().equals("")) {
			epinfo.setEpmoney("회사내규에 따름");
		}
		if (epinfo.getEptime().equals("")) {
			epinfo.setEptime("시간협의");
		}
		if (epinfo.getEparea().equals("")) {
			epinfo.setEparea("-");
		}
		if (epinfo.getEptreat().equals("")) {
			epinfo.setEptreat("-");
		}

		epinfo.setEpnum(epcode);
		epinfo.setEppost(eppost);

		System.out.println("설정끝");
		System.out.println(epinfo);
		int insertResult = epdao.insertEmployments(epinfo);
		return insertResult;
	}

	public ArrayList<Map<String, String>> epSchedule() {
		System.out.println("EmploymentService callEpDate() 호출");
		ArrayList<Map<String, String>> epSchedule = new ArrayList<Map<String, String>>();
		ArrayList<EmploymentDto> epPost = epdao.selectEpPost();
		ArrayList<EmploymentDto> epDead = epdao.selectEpDead();
		for (int i = 0; i < epPost.size(); i++) {
			Map<String, String> postDate = new HashMap<>();
			postDate.put("title", epPost.get(i).getEpname());
			postDate.put("start", epPost.get(i).getEppost());
			postDate.put("color", "blue");
			epSchedule.add(postDate);
		}
		for (int i = 0; i < epDead.size(); i++) {
			Map<String, String> deadDate = new HashMap<>();
			deadDate.put("title", epDead.get(i).getEpname());
			deadDate.put("start", epDead.get(i).getEpdeadline());
			deadDate.put("color", "red");
			epSchedule.add(deadDate);
		}
		return epSchedule;
	}

	public ArrayList<Map<String, String>> viewApplyCmember(String loginId) {
		System.out.println("viewApplyCmember호출");
		System.out.println(loginId);
		ArrayList<Map<String, String>> ApplyList = epdao.viewApplyCmember(loginId);
		System.out.println(ApplyList);
		return ApplyList;
	}

	public ArrayList<Map<String, String>> viewApplyMember(String loginId) {
		ArrayList<Map<String, String>> ApplyList = epdao.viewApplyMember(loginId);
		return ApplyList;
	}


	public MemberDto selectViewInfo(String viewId) {
		MemberDto member = epdao.selectViewInfo(viewId);
		return member;
	}

	public ArrayList<ArrResumeDto> viewResumeInfo() {
		ArrayList<ArrResumeDto> resumeList = epdao.viewResumeInfo();
		System.out.println("epsvc viewResumeInfo 요청");
		System.out.println(resumeList);
		ArrayList<ResumeDto> ResumeInfo = epdao.SelectResumeInfo();
		for (int i = 0; i < resumeList.size(); i++) {
			resumeList.get(i).setRemid(ResumeInfo.get(i).getRemid());
			resumeList.get(i).setRetell(ResumeInfo.get(i).getRetell());
			resumeList.get(i).setRecount(ResumeInfo.get(i).getRecount());
			resumeList.get(i).setRehope(ResumeInfo.get(i).getRehope());

			if (ResumeInfo.get(i).getReedu() != null) {
				String[] reedu = ResumeInfo.get(i).getReedu().split("!@#");
				resumeList.get(i).setReedu(reedu);
			}
			if (ResumeInfo.get(i).getRecarrer() != null) {
				String[] recarrer = ResumeInfo.get(i).getRecarrer().split("!@#");
				resumeList.get(i).setRecarrer(recarrer);
			}
			if (ResumeInfo.get(i).getReact() != null) {
				String[] react = ResumeInfo.get(i).getReact().split("!@#");
				resumeList.get(i).setReact(react);
			}
			if (ResumeInfo.get(i).getRelicense() != null) {
				String[] relicense = ResumeInfo.get(i).getRelicense().split("!@#");
				resumeList.get(i).setRelicense(relicense);
			}
			if (ResumeInfo.get(i).getReciname() != null) {
				String[] reciname = ResumeInfo.get(i).getReciname().split("!@#");
				resumeList.get(i).setReciname(reciname);
			}

		}
		//
		return resumeList;
	}

	// 마감 임박 공고 리스트
	public ArrayList<EmploymentDto> closeDeadLine() {
		System.out.println("EmploymentService closeDeadLine() 호출");
		ArrayList<EmploymentDto> closeDeadLine = epdao.selectCloseDeadLine();
		return closeDeadLine;
	}

	// 열람 기업 목록
	public void updateReciname(String cmciname, String viewId) {
		String selectResult = epdao.checkCmciname(cmciname);
		System.out.println("updateReciname 호출");
		if (selectResult == null) {
			String checkciname = epdao.checkCmcinameViewId(viewId);
			cmciname = cmciname + "!@#";
			if (checkciname.equals("x")) {
				epdao.removeReciname(cmciname, viewId);
			} else {
				epdao.updateReciname(cmciname, viewId);
			}
		}
	}

	// 기업 번호 찾기
	public String selectCinum(String viewReciname) {
		String cinum = epdao.selectCinum(viewReciname);
		return cinum;
	}

	// 공고 검색기능
	public String getEpListGson(String searchValue, String selectType) {
		System.out.println("EmploymentService getEpListGson 호출");
		ArrayList<EmploymentDto> epList = new ArrayList<EmploymentDto>();
		if (selectType.equals("공고")) {
			epList = epdao.getSearchList(searchValue);
		} else {
			epList = epdao.getSearchCiname(searchValue);
		}
		System.out.println();
		for (int i = 0; i < epList.size(); i++) {
			System.err.println(epList.get(i));
		}
		return new Gson().toJson(epList);
	}

//	//공고 검색기능
//	public String getEpListGson(String searchValue) {
//		ArrayList<EmploymentDto> epList = epdao.getSearchList(searchValue);
//		System.out.println();
//		return new Gson().toJson(epList);
//	}

	// 기업 검색기능
	public String getCiListGson(String searchValue) {
		ArrayList<CinfoDto> ciList = epdao.getCiList(searchValue);
		System.out.println();
		return new Gson().toJson(ciList);
	}

	// 기업 상세페이지 공고 찾기
	public ArrayList<EmploymentDto> cinfoEpList(String cinum) {
		ArrayList<EmploymentDto> epList = epdao.cinfoEpList(cinum);
		System.out.println();
		return epList;
	}

	// 내 자소서 찾기
	public ArrEssayDto findEssay(String epnum, String loginId) {
		System.out.println("EmploymentService findEssay() 호출");
		ArrEssayDto essay = new ArrEssayDto();
		try {
			EssayDto myessay = epdao.selectEssay(epnum, loginId);
			System.out.println(myessay);
			if (myessay == null) {
				return null;
			} else {
				essay.setEsnum(myessay.getEsnum());
				essay.setEsciname(myessay.getEsciname());
				essay.setEsepnum(myessay.getEsepnum());
				essay.setEsmid(myessay.getEsmid());
				essay.setEscontents(myessay.getEscontents().split("!@#"));
				essay.setEsstate(myessay.getEsstate());
				return essay;
			}
		} catch (Exception e) {
			System.out.println("에러");
			return null;
		}
	}

	public String checkEssay(String epnum, String loginId) {
		String result = "N";
		EssayDto checkEssay = epdao.selectEssay(epnum, loginId);
		if (checkEssay != null) {
			result = "Y";
		}
		return result;
	}

	// 최신 등록 공고
	public ArrayList<EmploymentDto> newEmploy() {
		System.out.println("EmploymentService newEmploy() 호출");
		ArrayList<EmploymentDto> newEmploy = epdao.selectNewEmploy();
		return newEmploy;
	}

	// 인기 공고
	public ArrayList<EmploymentDto> popularEmploy() {
		System.out.println("EmploymentService popularEmploy() 호츌");
		ArrayList<EmploymentDto> popularEmploy = new ArrayList<EmploymentDto>();
		ArrayList<String> popularEpName = epdao.selectPopularEpName();
		for (int i = 0; i < popularEpName.size(); i++) {
			String epnum = popularEpName.get(i);
			EmploymentDto epInfo = epdao.selectEpInfo(epnum);
			popularEmploy.add(epInfo);
		}
		return popularEmploy;
	}

	
	public EmploymentDto selectEpInfo(String apepnum) {
		System.out.println("EmploymentService selectEpInfo 호출");
		EmploymentDto epdto = epdao.selectEpInfo(apepnum);
		return epdto;
	}

}
