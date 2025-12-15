package com.example.sp.entity;

import java.time.OffsetDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "dept")
public class Dept {
	// 기본키 컬럼과 연결 // 기본키는 하나밖에 없어서 name을 따로 안해도됨
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //DB의 전략을 쓰겠다.
	private int deptno;
	
	// name 컬럼과 연결 // 기본키 아닌 것들
	@Column(name = "name")
	private String name;
	
	@Column(name = "loc")
	private String loc;
	
	// insert, update시 이 항목을 사용하지 않겠다.
	@Column(name = "created_at", insertable = false, updatable = false)
	private OffsetDateTime createdAt;
}
