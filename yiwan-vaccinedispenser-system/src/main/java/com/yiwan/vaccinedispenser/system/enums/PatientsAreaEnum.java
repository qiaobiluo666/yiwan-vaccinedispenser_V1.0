package com.yiwan.vaccinedispenser.system.enums;

/**
 * 病区字典
 */
public enum PatientsAreaEnum {


    ;



    private Integer code;//编码
    private String desc;//描述


    private PatientsAreaEnum(Integer code, String desc){
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
