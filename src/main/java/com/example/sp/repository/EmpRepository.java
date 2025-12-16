package com.example.sp.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.sp.entity.Emp;
import com.example.sp.entity.EmpMapping;

// JpaRepository : API 제공, 제공X -> 커스터마이징 매커니즘(공식형태) -> HSQL -> SQL(nativeQuery = true)
// -> 다양성 -> 공공API(규칙필요) -> Mybatis프레임웍을 많이 사용
@Repository
public interface EmpRepository extends JpaRepository<Emp, Integer> {
	// MyBatis 방식
	@Query(
		nativeQuery = true,
		value = """
				select empno, id, deptno 
				from emp 
				where deptno = :deptno
		"""
	)
	List<EmpMapping> findEmpnoAndIdByDeptno(int deptno);
	
	// findBy + 컬럼명 + Containing(==Like 연산)
	Page<Emp> findByIdContaining(Pageable pageable, String searchWord);                            
}