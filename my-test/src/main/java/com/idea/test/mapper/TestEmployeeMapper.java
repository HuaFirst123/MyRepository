package com.idea.test.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.idea.platform.common.mapper.BaseMapper;
import com.idea.test.vo.TestEmployee;


public interface TestEmployeeMapper extends BaseMapper<TestEmployee> {
	
//	TestEmployee findByName(@Param("name") String name);
//	
//	TestEmployee findById(@Param("id") String id);
//	
//	List<TestEmployee> findAllEmployee();

	// 添加
	int insertEmployee(TestEmployee testEmployee);
	
	int updateEmployee(TestEmployee testEmployee);
}