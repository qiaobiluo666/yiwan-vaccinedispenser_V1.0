package com.yiwan.vaccinedispenser.system.enums;

public enum AgentiasEnum {

    /**是否忽略此药品*/
    IGNORE_F(0,"不忽略"),
    IGNORE_T(1,"忽略"),

    ;

    AgentiasEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }
    private Integer code;

    private String desc;


    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
