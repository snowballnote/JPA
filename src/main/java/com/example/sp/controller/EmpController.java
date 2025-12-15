package com.example.sp.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sp.entity.Emp;
import com.example.sp.service.EmpService;

@Controller
public class EmpController {
	@Autowired EmpService empService;
	
	@GetMapping("/empList")
	public String empList(Model model
						, @RequestParam(defaultValue = "0") int currentPage
						, @RequestParam(defaultValue = "10") int rowPerPage) {
		
		List<Emp> list = empService.getEmpListByPage(currentPage, rowPerPage);
		model.addAttribute("list", list);
		
		return "empList";
	}
}
