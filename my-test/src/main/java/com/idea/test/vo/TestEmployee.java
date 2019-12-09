package com.idea.test.vo;

import com.idea.platform.common.annotation.TableKey;
import com.idea.platform.common.model.BaseVO;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import lombok.Data;

@Data
public class TestEmployee extends BaseVO implements Serializable {
    @TableKey
    @ApiModelProperty(value="",name="id",dataType="String")
    private String id;

    @ApiModelProperty(value="",name="name",dataType="String")
    private String name;

    @ApiModelProperty(value="",name="age",dataType="Integer")
    private Integer age;

    @ApiModelProperty(value="",name="salary",dataType="Integer")
    private Integer salary;

    @ApiModelProperty(value="",name="dep",dataType="String")
    private String dep;
    
    @ApiModelProperty(value="",name="sex",dataType="Integer")
    private Integer sex;

    private static final long serialVersionUID = 1L;
}