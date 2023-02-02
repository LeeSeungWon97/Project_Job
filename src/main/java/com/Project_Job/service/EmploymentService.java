package com.Project_Job.service;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project_Job.dao.EmploymentDao;
import com.Project_Job.dto.EmploymentDto;


@Service
public class EmploymentService {

	@Autowired
	private EmploymentDao epdao;
	
	public int jobInsert2() throws IOException {
		//1. 잡코리아 채용정보 페이지 URL
		String jobUrl = "https://www.jobkorea.co.kr/recruit/joblist?menucode=local&localorder=1";
		
		//2. Jsoup URL 접속
		Document doc = Jsoup.connect(jobUrl).get();
		
		Elements charDiv = doc.select("#dev-gi-list > div > div.tplList.tplJobList > table > tbody");
		Elements JobLi = charDiv.select("tr");
		
		int insertResult = 0;
		System.out.println(JobLi.size());
		/*
		 * 잡코리아 내부 서버에서 과도한 접속으로 인해 차단당함
		 * 3회씩 반복문을 돌리면 오류 발생 X
		 * 오류 발생시 => 크롤링 진행이 안되고 x값이 컬럼에 insert된다.
		 * 			  잡코리아 홈페이지 접속후 인증코드 입력후 재시도 반복
		 */
		for(int i = 30; i < 40; i++) {
			//5. 잡코리아 채용정보에서 공고 선택시 url 주소
			String detailUrl = "https://www.jobkorea.co.kr/"+JobLi.eq(i).select("td.tplTit > div > strong > a").eq(0).attr("href");
			Document detailDoc = Jsoup.connect(detailUrl).get();
			
			Elements baseMovie = detailDoc.select("#container > section > div.readSumWrap.clear > article");
			System.out.println("================================");
			Elements Exciname = baseMovie.select("div.sumTit > h3");
			Elements removerole =Exciname.select("div").remove();
			
			//공고명
			String epname = Exciname.text();
			//회사명
			String epciname = JobLi.eq(i).select("td.tplCo > a").text();
			//경력
			String epcareer = baseMovie.select("div.tbRow.clear > div:nth-child(1) > dl > dd:nth-child(2)").text();
			//학력
			String epedu = baseMovie.select("div.tbRow.clear > div:nth-child(1) > dl > dd:nth-child(4)").text();
			//고용형태
			String eptype = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(2)").text();
			//급여
			String epmoney = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(4)").text();
			//시간
			String eptime = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(8)").text();
			//지역
			String eparea = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(6)").text();
			//우대
			//#dlPref > dd > span
			String eptreat = baseMovie.select("#dlPref > dd > span").text();
			
			//시작일
			String eppost = detailDoc.select("#tab02 > div > article.artReadPeriod > div > dl.date > dd:nth-child(2) > span").text();
			//마감일
			String epdeadline = detailDoc.select("#tab02 > div > article.artReadPeriod > div > dl.date > dd:nth-child(4) > span").text();
			
			//공고 dto
			 EmploymentDto epinfo = new EmploymentDto();
			
			//잡코리아 상세 페이지 내부 selector에 차이가 있어 순서가 바뀌는 경우가 발생 
			System.out.println(detailUrl);
			System.out.println("회사명 : " +i+"번 "+ epciname);
			System.out.println("공고명 : " +i+"번 "+ epname);
			System.out.println("경력 : " +i+"번 "+ epcareer);
			System.out.println("학력 : " +i+"번 "+ epedu);
			System.out.println("고용형태 : " +i+"번 "+ eptype);
			System.out.println("급여 : " +i+"번 "+ epmoney);
			System.out.println("시간 : " +i+"번 "+ eptime);
			System.out.println("지역 : " +i+"번 "+ eparea);
			System.out.println("우대 : " +i+"번 "+ eptreat);
			System.out.println("시작일 : " +i+"번 "+ eppost);
			System.out.println("마감일 : " +i+"번 "+ epdeadline);
			
			
			
			String maxEpcode = epdao.selectMaxEpnum();
			System.out.println("공고코드 최대값 : " + maxEpcode);
			String epcode = "EP";
			if(maxEpcode == null) {
				epcode = epcode + String.format("%03d", 1);
				System.out.println("처음 공고 : "+epcode);
			}else {
				int cicodeNum = Integer.parseInt(maxEpcode.replace("EP", "")) +1;
				epcode =  epcode + String.format("%03d", cicodeNum);
			}
			System.out.println("공고코드 : "+epcode);
			
			
			String epCheck = epdao.checkEp(epname, epciname);
			if(epCheck != null) {
				continue;
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
}
