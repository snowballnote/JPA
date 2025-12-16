package com.example.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sp.entity.Emp;
import com.example.sp.entity.EmpMapping;
import com.example.sp.repository.EmpRepository;

@Service
@Transactional
public class EmpService {
	@Autowired EmpRepository empRepository;
	
	public List<EmpMapping> getEmpListByDeptno(int deptno){
		return empRepository.findEmpnoAndIdByDeptno(deptno);
	}
	
	public Page<Emp> getEmpListByPage(int cuurrentPage, int rowPerPage, String searchWord){
		Sort sort = Sort.by("empno").descending();
		
		// currentPage + rowPerPage + Sort --> 하나의 매개값 전달하는 API
		PageRequest pageRequest = PageRequest.of(cuurrentPage, rowPerPage, sort);
		
		
		// String searchWord를 매개값으로 같이 처리가 가능한 API 존재 x
		// Page<Emp> pageList = empRepository.findAll(pageRequest);
		
		Page<Emp> pageList = empRepository.findByIdContaining(pageRequest, searchWord); 
		return pageList;
	}
}
