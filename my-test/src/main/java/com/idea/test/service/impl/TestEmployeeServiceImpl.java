package com.idea.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.idea.test.mapper.TestDepartmentMapper;
import com.idea.test.mapper.TestEmployeeMapper;
import com.idea.test.service.ITestEmployeeService;
import com.idea.test.vo.TestDepartment;
import com.idea.test.vo.TestEmployee;
@Service
public class TestEmployeeServiceImpl implements ITestEmployeeService {

	@Autowired
	private TestEmployeeMapper testEmployeeMapper;
	@Override
	public int saveEmployee(TestEmployee testEmployee) {
		// TODO Auto-generated method stub
		int result = -1;
		int a = -1;
		if(testEmployee!=null) {
			 a = testEmployeeMapper.insertEmployee(testEmployee);
		}
		if(a>0)
			result = 1;
		return result;
	}
	@Override
	public int updateEmployee(TestEmployee testEmployee) {
		// TODO Auto-generated method stub
		int result = -1;
		int a = -1;
		if(testEmployee!=null) {
			 a = testEmployeeMapper.updateEmployee(testEmployee);
		}
		if(a>0)
			result = 1;
		return result;
	}



}
