package com.example.sp.entity;

// Emp에서 필요한것만 받는 EmpMapping
public interface EmpMapping { // Emp 일부 필드만 사용(Emp.getter()만)
	int getEmpno();
	String getId();
	int getDeptno();
}