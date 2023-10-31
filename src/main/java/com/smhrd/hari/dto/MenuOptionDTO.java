package com.smhrd.hari.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class MenuOptionDTO {
    private int opNo;

    private String opName;

    private int opPrice;

    private String mNo;


    public int getOpNo() {
        return opNo;
    }

    public void setOpNo(int opNo) {
        this.opNo = opNo;
    }

    public String getOpName() {
        return opName;
    }

    public void setOpName(String opName) {
        this.opName = opName;
    }

    public int getOpPrice() {
        return opPrice;
    }

    public void setOpPrice(int opPrice) {
        this.opPrice = opPrice;
    }

    public String getmNo() {
        return mNo;
    }

    public void setmNo(String mNo) {
        this.mNo = mNo;
    }


}