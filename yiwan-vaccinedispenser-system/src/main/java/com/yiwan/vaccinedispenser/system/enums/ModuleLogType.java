package com.yiwan.vaccinedispenser.system.enums;

import java.util.Objects;

public enum ModuleLogType {

    DEFAULT(0,"默认 不使用"),
    PrescribeAgentia(1,"医院接受处方接口"),
    DriverException(2,"驱动异常"),


    ;

    private Integer type;
    private String desc;

    private ModuleLogType(Integer type, String desc){
        this.type = type;
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }

    public String getDesc() {
        return desc;
    }


    public static ModuleLogType getEnum(Integer type){
        for (ModuleLogType value : ModuleLogType.values()) {
            if (Objects.equals(type, value.getType())) return value;
        }
        return null;
    }
}
