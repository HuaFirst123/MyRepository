package com.idea.test.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.idea.test.vo.TestDepartment;

public interface ITestDepartmentService {
	
	public int saveDepartment( String name, String id);
	
	public TestDepartment getInfoById(String id);
	
	public List<TestDepartment> getInfobyName(String name);

}
