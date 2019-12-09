package com.idea.test.dto;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

import com.idea.platform.common.validation.Second;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class TestEmployeeDto  {
	@ApiModelProperty(value = "雇员ID,新增时传入相关值,修改时传入实际值", required = true)
	@NotBlank(message = "雇员ID不能为空", groups = { Second.class })
	@Length(max = 35, message = "雇员ID过长", groups = { Second.class })
	private String id;

	@ApiModelProperty(value = "雇员名称", required = true)
	@NotBlank(message = "雇员名称不能为空", groups = { Second.class })
	@Length(max = 30, message = "雇员名称过长", groups = { Second.class })
	private String name;
	
	@ApiModelProperty(value = "雇员年龄,新增时传入相关值,修改时传入实际值", required = false)
	@NotBlank(message = "雇员年龄不能为空", groups = { Second.class })
	@Length(max = 35, message = "雇员年龄过长", groups = { Second.class })
	private int age;

	@ApiModelProperty(value = "雇员工资", required = false)
	@NotBlank(message = "雇员工资不能为空", groups = { Second.class })
	@Length(max = 30, message = "雇员工资过长", groups = { Second.class })
	private int salary;

	@ApiModelProperty(value = "部门ID,新增时传入相关值,修改时传入实际值", required = true)
	@NotBlank(message = "部门ID不能为空", groups = { Second.class })
	@Length(max = 35, message = "部门ID过长", groups = { Second.class })
	private String dep;
	
	@ApiModelProperty(value = "雇员年龄,新增时传入相关值,修改时传入实际值", required = false)
	@NotBlank(message = "雇员年龄不能为空", groups = { Second.class })
	@Length(max = 35, message = "雇员年龄过长", groups = { Second.class })
	private int sex;

}
