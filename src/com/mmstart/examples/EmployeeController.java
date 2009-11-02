package com.mmstart.examples;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/employee")
@SuppressWarnings("unchecked")
public class EmployeeController {
	@Autowired
	EmployeeDAO employeeDAO;

	@RequestMapping(value = "/list")
	public String list(Model model, @RequestParam(defaultValue="1") Integer page) {
		employeeDAO.save(new Employee("haha1", 13, new Date(), 12.34, null));
		model.addAttribute("plist", employeeDAO.findAll(Employee.class, page));
//		model.addAttribute("plist", employeeDAO.findByJDOQL("select from com.mmstart.examples.Employee where id<27&&id>25", page));
		return "/employee";
	}
}
