package com.mmstart;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/hello")
public class HelloWorldController {
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView helloWorld() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/farm/index");
		mav.addObject("message", "Hello World!");
		return mav;
	}
	@RequestMapping(value="/list")
	public String list(ModelMap mm,String param) {
		mm.addAttribute("message", "牛逼 啊啊List"+param);
		return "/farm/list";
	}
	@RequestMapping(value="/add")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/farm/add");
		mav.addObject("message", "Hello World!");
		return mav;
	}
	@RequestMapping(params="act=list1")
	public String list1(ModelMap mm) {
		mm.addAttribute("message", "牛逼1 啊啊List1");
		return "/farm/list1";
	}
	@RequestMapping(params="act=list2")
	public String list2(ModelMap mm,User user) {
		mm.addAttribute("message", "牛逼1 啊啊List2 user.id:"+user.getId()+" user.name:"+user.getName());
		return "/farm/list2";
	}
}

class User{
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
