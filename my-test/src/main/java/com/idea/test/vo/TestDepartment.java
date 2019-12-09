package com.idea.test.vo;

import com.idea.platform.common.annotation.TableKey;
import com.idea.platform.common.model.BaseVO;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import lombok.Data;

@Data
public class TestDepartment extends BaseVO implements Serializable {
    @TableKey
    @ApiModelProperty(value="",name="id",dataType="String")
    private String id;

    @ApiModelProperty(value="",name="name",dataType="String")
    private String name;

    private static final long serialVersionUID = 1L;
}