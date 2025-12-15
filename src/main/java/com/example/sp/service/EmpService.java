package com.example.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sp.entity.Emp;
import com.example.sp.repository.EmpRepository;

@Service
@Transactional
public class EmpService {
	@Autowired EmpRepository empRepository;
	
	public List<Emp> getEmpListByPage(int cuurrentPage, int rowPerPage){
		Sort sort = Sort.by("empno").descending();
		
		// currentPage + rowPerPage + Sort --> 하나의 매개값 전달하는 API
		
		PageRequest pageRequest = PageRequest.of(cuurrentPage, rowPerPage, sort);
		Page<Emp> pageList = empRepository.findAll(pageRequest);
		
		// Page<Emp>를 JSP View 인지x-> List<Emp> 변경
		List<Emp> list = pageList.getContent();
		return list;
	}
}
