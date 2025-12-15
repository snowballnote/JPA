package com.example.sp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.sp.entity.Emp;

@Repository
public interface EmpRepository extends JpaRepository<Emp, Integer> {
	
}
