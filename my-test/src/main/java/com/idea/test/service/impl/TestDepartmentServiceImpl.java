package com.idea.test.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.idea.test.mapper.TestDepartmentMapper;
import com.idea.test.service.ITestDepartmentService;
import com.idea.test.vo.TestDepartment;

@Service
public class TestDepartmentServiceImpl implements ITestDepartmentService {

	@Autowired
	private TestDepartmentMapper testDepartmentMapper;
	@Override
	
	public int  saveDepartment(String name, String id) {
		// TODO Auto-generated method stub
		int result = -1;
		TestDepartment testDepartment = testDepartmentMapper.findById(id);
		if(testDepartment==null) {
			testDepartmentMapper.insert(name, id);
			result = 1;
			return result;
		}
		return result;
	}

	@Override
	public TestDepartment getInfoById(String id) {
		// TODO Auto-generated method stub
		TestDepartment testDepartment = testDepartmentMapper.findById(id);
		if(testDepartment==null) {
			return null;
		}
		return testDepartment;
	}

	@Override
	public List<TestDepartment> getInfobyName(String name) {
		// TODO Auto-generated method stub
		List<TestDepartment> list = testDepartmentMapper.findByName(name);
		if(list.isEmpty()) {
			return null;
		}
		return list;
	}

}
