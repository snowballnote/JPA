package com.example.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sp.dto.DeptForm;
import com.example.sp.entity.Dept;
import com.example.sp.repository.DeptRepository;

@Service
@Transactional
public class DeptService {
	@Autowired DeptRepository deptRepository;
	
	public Dept getDeptOne(int deptno) {
		return deptRepository.findById(deptno).get();
	}
	
	public void removeDept(int deptno) {
		deptRepository.deleteById(deptno);
	}
	
	public void modifyDept(DeptForm deptForm) {
		Dept dept = new Dept(); // deptForm -> dept
		dept.setDeptno(deptForm.getDeptno());
		dept.setName(deptForm.getName());
		dept.setLoc(deptForm.getLoc());
		deptRepository.save(dept); // 데이터를 추가 or 수정(key값: deptno이 있으면)
	}
	
	public void addDept(DeptForm deptForm) {
		Dept dept = new Dept(); // deptForm -> dept
		dept.setName(deptForm.getName());
		dept.setLoc(deptForm.getLoc());
		deptRepository.save(dept); // 데이터를 추가(key값: deptno이 없을때) or 수정
	}
	// modifyDept + addDept을 합쳐서 editDept이런식으로 써도댐
	
	public List<Dept> getDeptListAll(){
		return deptRepository.findAll();
	}

}
