package com.idea.test.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.idea.test.vo.TestDepartment;
import com.idea.test.vo.TestEmployee;

public interface ITestEmployeeService {
	
	public int saveEmployee(TestEmployee testEmployee );
	
	public int updateEmployee(TestEmployee testEmployee );

}
