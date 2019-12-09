package com.idea.test.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.idea.platform.common.annotation.ApiVersion;
import com.idea.platform.common.enums.UniqueWarnEnum;
import com.idea.platform.common.model.CommonRsp;
import com.idea.platform.common.util.BeanUtil;
import com.idea.platform.common.validation.CheckSequence;

import com.idea.test.dto.TestDepartmentDto;
import com.idea.test.dto.TestEmployeeDto;
import com.idea.test.service.ITestDepartmentService;
import com.idea.test.service.ITestEmployeeService;
import com.idea.test.util.StringUtils;
import com.idea.test.vo.TestDepartment;
import com.idea.test.vo.TestEmployee;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
@ApiVersion(1)
@RestController
@RequestMapping("{version}/employee")
@Api(tags = {"测试雇员信息配置"})
/**
 * 
 * <p>Title: TestDepartmentController.java</p>   
 * @author 朱乔华 
 * @date 2019年12月4日
 */
public class TestEmployeeController {
	
	@Autowired
	private ITestEmployeeService testEmployeeService;

	@ApiOperation(value = "新增一个雇员信息写入的接口  作者：朱乔华 日期： 2019年12月5日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/employee1", method = RequestMethod.GET)
	public CommonRsp<?> saveTestEmployee(String id,String name,int age,int salary,String dep,int sex) {
		CommonRsp<?> resultRsp = null;
		if(StringUtils.isEmpty(id)) {
			resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
			return resultRsp;
		}
		TestEmployee e = new TestEmployee();
		e.setId(id);
		e.setName(name);
		e.setDep(dep);
		e.setAge(age);
		e.setSalary(salary);
		e.setSex(sex);
		try {
			int count = testEmployeeService.saveEmployee(e);
			if (count < 0) {
				resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
			} else{
				resultRsp = CommonRsp.successSys();
			}
			return resultRsp;
		}catch(Exception exception) {
			exception.printStackTrace();
			resultRsp = CommonRsp.errorSys400("400", "填写部门编号不存在或者数据有误");
			return resultRsp;
		}
		
	}
	
	@ApiOperation(value = "新增一个雇员信息写入的接口2  作者：朱乔华 日期： 2019年12月6日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/employee2", method = RequestMethod.POST)
	public CommonRsp<?> saveTestEmployee (@RequestBody  @ApiParam(value = "Created user object", required = true)  TestEmployeeDto params,
			BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			StringBuffer erorMsg = new StringBuffer();
			bindingResult.getAllErrors().forEach(x -> erorMsg.append(" " + x.getDefaultMessage()));
			return CommonRsp.errorSys4001003(erorMsg.toString());
		}
		CommonRsp<?> resultRsp = null;
		TestEmployee entity = BeanUtil.convertVO(params, TestEmployee.class);
		int count = testEmployeeService.saveEmployee(entity);
		if (count < 0) {
			resultRsp = CommonRsp.errorSys400("400", "填写部门编号不存在或者数据不符合规范");
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
		
	}
	
	@ApiOperation(value = "更新雇员信息的接口    作者：朱乔华 日期： 2019年12月6日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/employee3", method = RequestMethod.POST)
	public CommonRsp<?> updateTestEmployee (@RequestBody  @ApiParam(value = "Update user object", required = true)  TestEmployeeDto params,
			BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			StringBuffer erorMsg = new StringBuffer();
			bindingResult.getAllErrors().forEach(x -> erorMsg.append(" " + x.getDefaultMessage()));
			return CommonRsp.errorSys4001003(erorMsg.toString());
		}
		CommonRsp<?> resultRsp = null;
		TestEmployee entity = BeanUtil.convertVO(params, TestEmployee.class);
		int count = testEmployeeService.updateEmployee(entity);
		if (count < 0) {
			resultRsp = CommonRsp.errorSys400("400", "填写部门编号不存在或者输入信息有误");
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
		
	}
	

	
	

}
