package com.yiwan.vaccinedispenser.system.enums;

public enum PrescribeAgentiaDetailEnum {


    LVP_FLAG_F(0,"非大输液"),
    LVP_FLAG_T(1,"大输液"),

    ;

    private Integer code;//编码
    private String desc;//描述


    private PrescribeAgentiaDetailEnum(Integer code, String desc){
        this.code = code;
        this.desc = desc;
    }

    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
