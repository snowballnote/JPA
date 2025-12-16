package com.example.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
	
	@GetMapping("/empListByDeptno")
	public String empListByDeptno(Model model, int deptno) {
		model.addAttribute("list", empService.getEmpListByDeptno(deptno));
		return "empListByDeptno";
	}
	
	@GetMapping("/empList")
	public String empList(Model model
						, @RequestParam(defaultValue = "0") int currentPage
						, @RequestParam(defaultValue = "10") int rowPerPage
						, @RequestParam(defaultValue = "")String searchWord) {
		
		Page<Emp> pageList = empService.getEmpListByPage(currentPage, rowPerPage, searchWord);
		
		model.addAttribute("list", pageList.getContent()); // empList
		model.addAttribute("lastPage", pageList.getTotalPages());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "empList";
	}
}