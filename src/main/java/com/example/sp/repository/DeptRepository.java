package com.example.sp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.sp.entity.Dept;

@Repository
public interface DeptRepository extends JpaRepository<Dept, Integer>{
	
}