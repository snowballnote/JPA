package com.example.sp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sp.dto.DeptForm;
import com.example.sp.entity.Dept;
import com.example.sp.service.DeptService;

@Controller
public class DeptController {
	
	@Autowired DeptService deptService;
	
	@GetMapping("/modifyDept")
	public String modifyDept(Model model, @RequestParam int deptno) {
		Dept dept = deptService.getDeptOne(deptno);
		model.addAttribute("dept", dept);
		return "modifyDept";
	}
	@PostMapping("modifyDept")
	public String modifyDept(DeptForm deptForm) {
		deptService.modifyDept(deptForm);
		return "redirect:/";
	}
	
	@GetMapping("/removeDept")
	public String removeDept(@RequestParam int deptno) {
		deptService.removeDept(deptno);
		return "redirect:/";
	}
	
	@GetMapping("/addDept")
	public String addDept() {
		return "addDept";
	}
	@PostMapping("addDept")
	public String addDept(DeptForm deptForm) {
		deptService.addDept(deptForm);
		return "redirect:/";
	}
	
	@GetMapping("/")
	public String deptListAll(Model model) {
		List<Dept> list = deptService.getDeptListAll();
		System.out.println(list);
		model.addAttribute("list", list);
		return "deptListAll";
	}
}
