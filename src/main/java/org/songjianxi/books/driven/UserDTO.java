package org.songjianxi.books.driven;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserDTO implements Serializable {
    private static final long serialVersionUID = -3021758844368202780L;

    private String userId;
    private String username;
    private String password;
    private String comfirmPassWord;

    private String verifyCode;

    private String msg;
    private String email;
    private String phoneNum;
    private Integer status;
    private Integer isActivate;
    private String activationCode;
    private Timestamp createTime;

    private Timestamp createTimeFrom;
    private Timestamp createTimeTo;

    private Integer page;
    private Integer rows;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getComfirmPassWord() {
        return comfirmPassWord;
    }

    public void setComfirmPassWord(String comfirmPassWord) {
        this.comfirmPassWord = comfirmPassWord;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsActivate() {
        return isActivate;
    }

    public void setIsActivate(Integer isActivate) {
        this.isActivate = isActivate;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public Timestamp getCreateTimeFrom() {
        return createTimeFrom;
    }

    public void setCreateTimeFrom(Timestamp createTimeFrom) {
        this.createTimeFrom = createTimeFrom;
    }

    public Timestamp getCreateTimeTo() {
        return createTimeTo;
    }

    public void setCreateTimeTo(Timestamp createTimeTo) {
        this.createTimeTo = createTimeTo;
    }

}
