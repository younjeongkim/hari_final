package com.smhrd.hari.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
public class BasketDTO {
    private int basNo;
    private String userId;
    private String mNo;
    private int mCnt;
    private LocalDateTime created_at;
    private String mName;
    private int mPrice;
    private String bId; // bID 필드 추가

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public int getmPrice() {
        return mPrice;
    }

    public void setmPrice(int mPrice) {
        this.mPrice = mPrice;
    }

    // 사진
    private byte[] mImg;
    private String mImg_base64;

    public byte[] getmImg() {
        return mImg;
    }

    public void setmImg(byte[] mImg) {
        this.mImg = mImg;
    }

    public String getmImg_base64() {
        return mImg_base64;
    }

    public void setmImg_base64(String mImg_base64) {
        this.mImg_base64 = mImg_base64;
    }

    // 온도
    private String temperature;
    @Override
    public String toString(){
        return "BasketDTO [basNo=" + basNo + ", userId=" + userId + ", mNo=" + mNo + ", mCnt=" + mCnt + ", created_at=" + created_at + "]";
    }

    public String getmNo() {
        return mNo;
    }

    public void setmNo(String mNo) {
        this.mNo = mNo;
    }

    public int getmCnt() {
        return mCnt;
    }

    public void setmCnt(int mCnt) {
        this.mCnt = mCnt;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public int getBasNo() {
        return basNo;
    }

    public void setBasNo(int basNo) {
        this.basNo = basNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMNo() {
        return mNo;
    }

    public void setMNo(String mNo) {
        this.mNo = mNo;
    }

    public int getMCnt() {
        return mCnt;
    }

    public void setMCnt(int mCnt) {
        this.mCnt = mCnt;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

}
