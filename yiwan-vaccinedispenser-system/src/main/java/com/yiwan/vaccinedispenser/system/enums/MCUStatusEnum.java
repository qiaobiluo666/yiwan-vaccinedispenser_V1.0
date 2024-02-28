package com.yiwan.vaccinedispenser.system.enums;

/**
 * @author shn
 * @version 1.0
 * @description: 单片机异常
 * @date 2022/5/17 9:45
 */
public enum MCUStatusEnum {

    NULLSPACE(0,"空仓"),

    NORMAL(1,"正常插入"),

    INSUFFICIENT(2,"药量不足"),

//    FAULT(4,"药匣故障"),


    MOTOR_STUCK(8,"电机故障"),

    DRIVER_FAULT(6,"驱动故障"),

    COMMUNICATION_FAIL(7,"通信故障"),

    ;

    private Integer code;//错误码
    private String desc;//错误描述


    MCUStatusEnum(Integer code, String desc){
        this.code = code;
        this.desc = desc;
    }

    public static MCUStatusEnum getByCode(Integer status) {
        for (MCUStatusEnum value : MCUStatusEnum.values()) {
            if (value.getCode().equals(status)){
                return value;
            }
        }
        return null;
    }

    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

    @Override
    public String toString() {
        return "MCUStatusEnum{" +
                "code=" + code +
                ", desc='" + desc + '\'' +
                '}';
    }
}
