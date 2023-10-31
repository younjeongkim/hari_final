package com.smhrd.hari.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
public class BasketListDTO {

    private int basNo;
    private String userId;
    private String mNo;
    private int mCnt;

    // list에 추가될 컬럼들
    private int num;
    private String mName;
    private int mPrice;
    private byte[] mImg;
    private String mImg_base64;
    private LocalDateTime created_at;

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    private String temperature;

    public byte[] getmImg() {
        return mImg;
    }


    public String getmImg_base64() {
        return mImg_base64;
    }

    public void setmImg_base64(String mImg_base64) {
        this.mImg_base64 = mImg_base64;
    }



    @Override
    public String toString() {
        return "BasketListDTO{" +
                "basNo=" + basNo +
                ", userId='" + userId + '\'' +
                ", mNo='" + mNo + '\'' +
                ", mCnt=" + mCnt +
                ", num=" + num +
                ", mName='" + mName + '\'' +
                ", mPrice=" + mPrice +
                // 이미지 데이터는 매우 크기 때문에 로그에 출력하지 않습니다.
                // 만약 필요하다면 아래 주석을 해제하세요.
                //", mImg_base64='" + mImg_base64.substring(0, 100)  // 처음 100자만 출력
                ", temperature='" + temperature+ '\''+
                '}';
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

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
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

    public void setmImg(byte[] mImg) {
        this.mImg = mImg;
    }
}
