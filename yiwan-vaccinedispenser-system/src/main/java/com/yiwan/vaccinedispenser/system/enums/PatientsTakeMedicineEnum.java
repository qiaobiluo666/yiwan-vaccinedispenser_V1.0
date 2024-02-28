package com.yiwan.vaccinedispenser.system.enums;

/**
 * 处方状态类型
 */
public enum PatientsTakeMedicineEnum {

    ALL_STATUS_1(0,"待分配"),//以序号递增步骤
    ALL_STATUS_2(1,"人工UDD"),
    ALL_STATUS_3(2,"智能UDD"),
    ALL_STATUS_4(3,"人工+智能"),

    ALL_TAKERESULT_1(0, "未完成"),
    ALL_TAKERESULT_2(1, "待核验"),
    ALL_TAKERESULT_3(2, "已完成"),


    MANUAL_STATUS_1(0,"列表 待处理"),
    MANUAL_STATUS_2(1,"分拣中"),
    MANUAL_STATUS_3(2,"核验完成"),
    MANUAL_STATUS_START(MANUAL_STATUS_1),
    MANUAL_STATUS_END(MANUAL_STATUS_3),

    SMART_STATUS_0(-2,"已忽略"),
    SMART_STATUS_1(-1,"列表中"),
    SMART_STATUS_2(0,"待分拣"),
    SMART_STATUS_3(1,"取药中"),
    SMART_STATUS_4(2,"取药完成"),
    SMART_STATUS_5(3,"人工核验完成"),

    IMG_MODE_1(1,"人工UDD"),
    IMG_MODE_2(2,"智能UDD")
    ;

    private PatientsTakeMedicineEnum(int code, String soec) {
        this.code = code;
        this.soec = soec;
    }
    //类型
    private int code;
    //描述
    private String soec;

    private PatientsTakeMedicineEnum(PatientsTakeMedicineEnum obj) {
        this.code = obj.getCode();
        this.soec = obj.getSoec();
    }


    public int getCode() {
        return code;
    }

    public String getSoec() {
        return soec;
    }
}
