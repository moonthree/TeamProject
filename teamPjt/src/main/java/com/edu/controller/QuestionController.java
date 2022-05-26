package com.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/question")
@Controller
public class QuestionController {
	
	@RequestMapping(value="/question.do")
	public String question() {
		return "question/question";
	}
	
	@RequestMapping(value="/question_view1.do")
	public String question_view1() {
		return "question/question_view1";
	}
	
	@RequestMapping(value="/question_view2.do")
	public String question_view2() {
		return "question/question_view2";
	}
	
	@RequestMapping(value="/question_view3.do")
	public String question_view3() {
		return "question/question_view3";
	}
	
	@RequestMapping(value="/question_view4.do")
	public String question_view4() {
		return "question/question_view4";
	}
	
	@RequestMapping(value="/question_view5.do")
	public String question_view5() {
		return "question/question_view5";
	}
	
	@RequestMapping(value="/question_view6.do")
	public String question_view6() {
		return "question/question_view6";
	}
	
	@RequestMapping(value="/question_view7.do")
	public String question_view7() {
		return "question/question_view7";
	}
	
	@RequestMapping(value="/question_view8.do")
	public String question_view8() {
		return "question/question_view8";
	}
	
	@RequestMapping(value="/question_view9.do")
	public String question_view9() {
		return "question/question_view9";
	}
	
	@RequestMapping(value="/question_view10.do")
	public String question_view10() {
		return "question/question_view10";
	}
	
	@RequestMapping(value="/question_view11.do")
	public String question_view11() {
		return "question/question_view11";
	}
	
	@RequestMapping(value="/question_view12.do")
	public String question_view12() {
		return "question/question_view12";
	}
}
