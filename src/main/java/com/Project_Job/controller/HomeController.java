package com.Project_Job.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Project_Job.dto.CinfoDto;
import com.Project_Job.dto.EmploymentDto;
import com.Project_Job.service.EmploymentService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private EmploymentService epsvc;
	
	@RequestMapping(value = "/")
	public ModelAndView home() {
		System.out.println("메인페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<EmploymentDto> closeDeadLine = epsvc.closeDeadLine();
		ArrayList<EmploymentDto> newEmploy = epsvc.newEmploy();
		ArrayList<CinfoDto> popularCompany = epsvc.popularCinfo();
		System.out.println("인기 TOP5");
		System.out.println(popularCompany.toString());
		mav.addObject("closeDeadLine", closeDeadLine);
		mav.addObject("newEmploy", newEmploy);
		mav.addObject("popularCompany",popularCompany);
		mav.setViewName("Main");
		return mav;
	}

	@RequestMapping(value = "/jobInsert1")
	public ModelAndView jobInsert1() throws Exception {
		System.out.println("채용공고 크롤링 요청");
		int insertResult = epsvc.jobInsert1();
//		System.out.println(insertResult);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}	
	@RequestMapping(value = "/jobInsert2")
	public ModelAndView jobInsert2() throws Exception {
		System.out.println("/jobInsert2 요청");
		int insertResult = epsvc.jobInsert2();
		System.out.println(insertResult);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	
	// 채용공고 크롤링 메서드
	@GetMapping("/croll")
	public String crolling() {
		return "home";
	}
	
	
}
