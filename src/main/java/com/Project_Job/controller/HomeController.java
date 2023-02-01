package com.Project_Job.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.service.EmploymentService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/")
	public String home() {
		System.out.println("메인페이지 이동 요청");
		return "Main";
	}
	@Autowired
	private EmploymentService epsvc;
	
	
	
	@RequestMapping(value = "/jobInsert2")
	public ModelAndView jobInsert2() throws IOException {
		System.out.println("/jobInsert2 요청");
		int insertResult = epsvc.jobInsert2();
		System.out.println(insertResult);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	
	
	
}
