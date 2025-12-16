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
@Table(name = "emp")
public class Emp {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //DB의 전략을 쓰겠다.
	private int empno;
	
	@Column(name = "id") private String id;
	
	@Column(name = "pw") private String pw;
	
	@Column(name = "created_at", insertable = false, updatable = false)
	private OffsetDateTime createdAt;
	
	@Column(name = "deptno") private int deptno; // 외래키
}
