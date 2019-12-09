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
import com.idea.test.service.ITestDepartmentService;
import com.idea.test.util.StringUtils;
import com.idea.test.vo.TestDepartment;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
@ApiVersion(1)
@RestController
@RequestMapping("{version}/test")
@Api(tags = {"测试部门信息配置"})
/**
 * 
 * <p>Title: TestDepartmentController.java</p>   
 * @author 朱乔华 
 * @date 2019年12月4日
 */
public class TestDepartmentController {
	
	@Autowired
	private ITestDepartmentService testDepartmentService;
//	@Validated({CheckSequence.class})
	@ApiOperation(value = "新增一个部门信息写入0的接口  作者：朱乔华 日期： 2019年12月4日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value = "/test0", method = RequestMethod.POST)
	public CommonRsp<?> saveTestDepartment(@RequestBody  @ApiParam(value = "Created user object", required = true)  TestDepartmentDto params,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			StringBuffer erorMsg = new StringBuffer();
			bindingResult.getAllErrors().forEach(x -> erorMsg.append(" " + x.getDefaultMessage()));
			return CommonRsp.errorSys4001003(erorMsg.toString());
		}
		TestDepartment entity = BeanUtil.convertVO(params, TestDepartment.class);
		int count = testDepartmentService.saveDepartment(entity.getName(), entity.getId());
		CommonRsp<?> resultRsp = null;
		if (count < 0) {
			resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
	}
	
	@ApiOperation(value = "新增一个部门信息写入1的接口  作者：朱乔华 日期： 2019年12月4日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/test1", method = RequestMethod.POST)
	public CommonRsp<?> saveTestDepartment0(String  id,String name) {
		
		int count = testDepartmentService.saveDepartment(name, id);
		CommonRsp<?> resultRsp = null;
		if (count < 0) {
			resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
	}
	@ApiOperation(value = "新增一个部门信息写入1的接口  作者：朱乔华 日期： 2019年12月4日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/test1", method = RequestMethod.GET)
	public CommonRsp<?> saveTestDepartment1(String  id,String name) {
		
		int count = testDepartmentService.saveDepartment(name, id);
		CommonRsp<?> resultRsp = null;
		if (count < 0) {
			resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
	}
	@ApiOperation(value = "新增一个部门信息写入2的接口  作者：朱乔华 日期： 2019年12月4日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/test2", method = RequestMethod.GET)
	public CommonRsp<?> saveTestDepartment2() {
		String name="jack";
		String id = "1234sdrf"; 	
		int count = testDepartmentService.saveDepartment(name, id);
		CommonRsp<?> resultRsp = null;
		if (count < 0) {
			resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
	}
	
	@ApiOperation(value = "新增一个部门信息写入2的接口  作者：朱乔华 日期： 2019年12月4日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/test2", method = RequestMethod.POST)
	public CommonRsp<?> saveTestDepartment3() {
		String name="jack";
		String id = "1234sdrf"; 	
		int count = testDepartmentService.saveDepartment(name, id);
		CommonRsp<?> resultRsp = null;
		if (count < 0) {
			resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
	}
	
	@ApiOperation(value = "新增一个部门信息写入3的接口  作者：朱乔华 日期： 2019年12月4日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/test4", method = RequestMethod.POST)
	public CommonRsp<?> saveTestDepartment4() {
		String name="jack";
		String id = "1234sdrf"; 	
		int count = testDepartmentService.saveDepartment(name, id);
		CommonRsp<?> resultRsp = null;
		if (count < 0) {
			resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
	}
	@ApiOperation(value = "新增一个部门信息写入3的接口  作者：朱乔华 日期： 2019年12月4日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/test4", method = RequestMethod.GET)
	public CommonRsp<?> saveTestDepartment5() {
		String name="jack";
		String id = "1234sdrf"; 	
		int count = testDepartmentService.saveDepartment(name, id);
		CommonRsp<?> resultRsp = null;
		if (count < 0) {
			resultRsp = CommonRsp.errorSys409(UniqueWarnEnum.SYSCODE_WARN);
		} else{
			resultRsp = CommonRsp.successSys();
		}
		return resultRsp;
	}
	
	
	@ApiOperation(value = "通过部门名称查询出对应的部门信心  作者：朱乔华 日期： 2019年12月5日", notes = "{code:webApp,name:web端,refresh:50,rowno:20}")
	@RequestMapping(value="/test5", method = RequestMethod.POST)
	public CommonRsp<?> getDepartmentInfo(String name) {
		CommonRsp<?> resultRsp = null;
		String description=null;
		if(!StringUtils.isEmpty(name)) {
			List<TestDepartment> list = testDepartmentService.getInfobyName(name);
			if(list!=null) {
				resultRsp = CommonRsp.successSys(list);
			}else {
				 description = "对不起,您查询的信息并不存在!!!";
				resultRsp = CommonRsp.errorSys404("404", description);
			}		
		}
		else {
			description = "输入值为空,请重新输入";
			resultRsp = CommonRsp.errorSys4001003(description);
		}
		return resultRsp;
	}
	
	

}
