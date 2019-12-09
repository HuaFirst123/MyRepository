package com.idea.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.idea.platform.common.mapper.BaseMapper;
import com.idea.test.vo.TestDepartment;
import com.idea.test.vo.TestEmployee;


public interface TestDepartmentMapper extends BaseMapper<TestDepartment> {
	@Select("SELECT * FROM TEST_DEPARTMENT WHERE NAME = #{name}")
	List<TestDepartment> findByName(@Param("name") String name);
	
	@Select("SELECT * FROM TEST_DEPARTMENT WHERE id = #{id}")
	TestDepartment findById(@Param("id") String id);
	
	@Select ("SELECT * FROM TEST_DEPARTMENT")
	List<TestDepartment> findAllUser();

	// 添加
	@Insert("INSERT INTO TEST_DEPARTMENT(ID,NAME) VALUES(#{id},#{name})")
	int insert(@Param("name") String name,@Param("id") String id);
}