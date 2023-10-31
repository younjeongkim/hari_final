package com.smhrd.hari.dto;


import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
public class ShopMenuDTO {
    private String mNo;
    private String bId;
    private String mName;
    private byte[] mImg;
    private int mPrice;
    private String mContent;
    private int mType;
    private char mStatus;


    // 상품등록날짜 컬럼 추가
    private Date mDate;
    public Date getmDate() {
        return mDate;
    }

    public void setmDate(Date mDate) {
        this.mDate = mDate;
    }
//////////////////////////

    public String getmNo() {
        return mNo;
    }

    public void setmNo(String mNo) {
        this.mNo = mNo;
    }

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

    public byte[] getmImg() {
        return mImg;
    }

    public void setmImg(byte[] mImg) {
        this.mImg = mImg;
    }

    public int getmPrice() {
        return mPrice;
    }

    public void setmPrice(int mPrice) {
        this.mPrice = mPrice;
    }

    public String getmContent() {
        return mContent;
    }

    public void setmContent(String mContent) {
        this.mContent = mContent;
    }

    public int getmType() {
        return mType;
    }

    public void setmType(int mType) {
        this.mType = mType;
    }

    public char getmStatus() {
        return mStatus;
    }

    public void setmStatus(char mStatus) {
        this.mStatus = mStatus;
    }

    public String getmImg_base64() {
        return mImg_base64;
    }

    public void setmImg_base64(String mImg_base64) {
        this.mImg_base64 = mImg_base64;
    }

    private String mImg_base64;
}
