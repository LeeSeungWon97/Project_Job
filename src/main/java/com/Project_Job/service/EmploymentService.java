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
		Elements movLi = charDiv.select("tr");
		
		int insertResult = 0;
		System.out.println(movLi.size());
		/*
		 * 잡코리아 내부 서버에서 과도한 접속으로 인해 차단당함
		 * 3회씩 반복문을 돌리면 오류 발생 X
		 * 오류 발생시 => 크롤링 진행이 안되고 x값이 컬럼에 insert된다.
		 * 			  잡코리아 홈페이지 접속후 인증코드 입력후 재시도 반복
		 */
		for(int i = 30; i < 40; i++) {
			//5. 잡코리아 채용정보에서 공고 선택시 url 주소
			String detailUrl = "https://www.jobkorea.co.kr/"+movLi.eq(i).select("td.tplTit > div > strong > a").eq(0).attr("href");
			Document detailDoc = Jsoup.connect(detailUrl).get();
			
			Elements baseMovie = detailDoc.select("#container > section > div.readSumWrap.clear > article");
			String mvtitle = baseMovie.select("div.sumTit > h3").text();
			System.out.println("================================");
			Elements mvtitle4 = baseMovie.select("div.sumTit > h3");
			Elements mvtitle5 =mvtitle4.select("div").remove();
			
			//공고명
			String mvtitle6 = mvtitle4.text();
			//회사명
			String test = movLi.eq(i).select("td.tplCo > a").text();
			//경력
			String test1 = baseMovie.select("div.tbRow.clear > div:nth-child(1) > dl > dd:nth-child(2)").text();
			//학력
			String test2 = baseMovie.select("div.tbRow.clear > div:nth-child(1) > dl > dd:nth-child(4)").text();
			//고용형태
			String test3 = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(2)").text();
			//급여
			String test4 = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(4)").text();
			//시간
			String test6 = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(8)").text();
			//지역
			String test7 = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(6)").text();
			//우대
			//#dlPref > dd > span
			String test8 = baseMovie.select("#dlPref > dd > span").text();
			
			//시작일
			String start = detailDoc.select("#tab02 > div > article.artReadPeriod > div > dl.date > dd:nth-child(2) > span").text();
			//마감일
			String end = detailDoc.select("#tab02 > div > article.artReadPeriod > div > dl.date > dd:nth-child(4) > span").text();
			
			Elements loLi = baseMovie.select("div.tbRow.clear > div:nth-child(2) > dl > dd:nth-child(6) > a");
			
			
			
			
			System.out.println("loLi size: " + loLi.size());
			
			//공고 dto
			 EmploymentDto epinfo = new EmploymentDto();
			
			//잡코리아 상세 페이지 내부 selector에 차이가 있어 순서가 바뀌는 경우가 발생 
			System.out.println(detailUrl);
			System.out.println("회사명 : " +i+"번 "+ test);
			System.out.println("공고명 : " +i+"번 "+ mvtitle6);
			System.out.println("경력 : " +i+"번 "+ test1);
			System.out.println("학력 : " +i+"번 "+ test2);
			System.out.println("고용형태 : " +i+"번 "+ test3);
			System.out.println("급여 : " +i+"번 "+ test4);
			System.out.println("시간 : " +i+"번 "+ test6);
			System.out.println("지역 : " +i+"번 "+ test7);
			System.out.println("우대 : " +i+"번 "+ test8);
			System.out.println("시작일 : " +i+"번 "+ start);
			System.out.println("마감일 : " +i+"번 "+ end);
			
			
			
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
			
			
			String mvCheck = epdao.checkEp(mvtitle6, test);
			if(mvCheck != null) {
				continue;
			}
			
			epinfo.setEpnum(epcode);
			epinfo.setEpname(mvtitle6);
			epinfo.setEpciname(test);
			epinfo.setEpcareer(test1);
			epinfo.setEpedu(test2);
			epinfo.setEptype(test3);
			epinfo.setEpmoney(test4);
			epinfo.setEptime(test6);
			epinfo.setEparea(test7);
			epinfo.setEptreat(test8);
			epinfo.setEppost(start);
			epinfo.setEpdeadline(end);
			epinfo.setEpstate("Y");
			
			System.out.println();
			insertResult += epdao.insertEmployments(epinfo);
			
		}
		
		System.out.println("등록된 공고 수 : " + insertResult);
		return insertResult;
	}
}
