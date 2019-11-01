package com.chenyx.ssm.domain;

public class Traveller {
    private String id;
    private String name;
    private String sex;
    private String phoneNum;
    private Integer credentialsType; //证件类型0身份证护照2军官证
    private String credentiaIsTypeStr;
    private String credentiaIsNum;
    private Integer travellerType; //旅容类型(人群) 0成人1儿童
    private String travellerTypeStr;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Integer getCredentialsType() {
        return credentialsType;
    }

    public void setCredentialsType(Integer credentialsType) {
        this.credentialsType = credentialsType;
    }

    public String getCredentiaIsTypeStr() {
        if(credentialsType!=null){
            if(credentialsType == 0)
                credentiaIsTypeStr="身份证";
            else if(credentialsType == 1)
                credentiaIsTypeStr="护照";
            else if(credentialsType == 2)
                credentiaIsTypeStr="军官证";
        }
        return credentiaIsTypeStr;
    }

    public void setCredentiaIsTypeStr(String credentiaIsTypeStr) {
        this.credentiaIsTypeStr = credentiaIsTypeStr;
    }

    public String getCredentiaIsNum() {
        return credentiaIsNum;
    }

    public void setCredentiaIsNum(String credentiaIsNum) {
        this.credentiaIsNum = credentiaIsNum;
    }

    public Integer getTravellerType() {
        return travellerType;
    }

    public void setTravellerType(Integer travellerType) {
        this.travellerType = travellerType;
    }

    public String getTravellerTypeStr() {
        ////旅客类型(人群) 0成人1儿童
        if (travellerType !=null) {
            if (travellerType==0) {
                travellerTypeStr="成人";
            }else if(travellerType==1) {
                travellerTypeStr="儿童";
            }
        }

        return travellerTypeStr;
    }

    public void setTravellerTypeStr(String travellerTypeStr) {
        this.travellerTypeStr = travellerTypeStr;
    }
}
