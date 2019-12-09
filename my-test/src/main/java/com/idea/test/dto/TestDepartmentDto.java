package com.idea.test.dto;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

import com.idea.platform.common.validation.Second;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class TestDepartmentDto  {
	@ApiModelProperty(value = "部门ID,新增时传入相关值,修改时传入实际值", required = true)
	@NotBlank(message = "部门ID不能为空", groups = { Second.class })
	@Length(max = 35, message = "部门ID过长", groups = { Second.class })
	private String id;

	@ApiModelProperty(value = "部门名称", required = true)
	@NotBlank(message = "部门名称不能为空", groups = { Second.class })
	@Length(max = 30, message = "部门名称过长", groups = { Second.class })
	private String name;

}
