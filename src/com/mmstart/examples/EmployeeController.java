package com.mmstart.examples;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
@SuppressWarnings("unchecked")
public class EmployeeController {
	@Autowired
	EmployeeDAO employeeDAO;

	@RequestMapping(value = "/list")
	public String list(ModelMap mm) {
		employeeDAO.save(new Employee("haha",13,new Date(),12.34,null));
		List<Employee> list = (List<Employee>) employeeDAO.findAll(Employee.class);
		mm.addAttribute("list", list);
		return "/employee";
	}
}
