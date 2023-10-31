package com.smhrd.hari.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
public class RegisterShopDTO {
    private String bId;
    private String bPwd;
    private String bEmail;
    private String bOwner;
    private String bPhone;
    private String bName;
    private String bNo;
    private String bAddr;
    private String bCategory;
    private LocalDateTime createdAt;

    private BigDecimal bLatitude;
    private BigDecimal bLongitude;

    public BigDecimal getbLatitude() {
        return bLatitude;
    }

    public void setbLatitude(BigDecimal bLatitude) {
        this.bLatitude = bLatitude;
    }

    public BigDecimal getbLongitude() {
        return bLongitude;
    }

    public void setbLongitude(BigDecimal bLongitude) {
        this.bLongitude = bLongitude;
    }

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId;
    }

    public String getbPwd() {
        return bPwd;
    }

    public void setbPwd(String bPwd) {
        this.bPwd = bPwd;
    }

    public String getbEmail() {
        return bEmail;
    }

    public void setbEmail(String bEmail) {
        this.bEmail = bEmail;
    }

    public String getbOwner() {
        return bOwner;
    }

    public void setbOwner(String bOwner) {
        this.bOwner = bOwner;
    }

    public String getbPhone() {
        return bPhone;
    }

    public void setbPhone(String bPhone) {
        this.bPhone = bPhone;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    public String getbNo() {
        return bNo;
    }

    public void setbNo(String bNo) {
        this.bNo = bNo;
    }

    public String getbAddr() {
        return bAddr;
    }

    public void setbAddr(String bAddr) {
        this.bAddr = bAddr;
    }

    public String getbCategory() {
        return bCategory;
    }

    public void setbCategory(String bCategory) {
        this.bCategory = bCategory;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
