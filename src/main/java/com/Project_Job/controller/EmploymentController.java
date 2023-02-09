package com.Project_Job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Project_Job.service.EmploymentService;


@Controller
public class EmploymentController {
	@Autowired
	private EmploymentService epsvc;
	
	
	// 회사 검색 요청
	@RequestMapping(value = "/getWPList")
	public @ResponseBody String getWPList(String ciname) {
		System.out.println("회사 검색 요청");
		System.out.println("입력한 회사이름 : "+ ciname);
		String ciList = epsvc.getWPList(ciname);
		System.out.println(ciList);
		return ciList;
	}

}
