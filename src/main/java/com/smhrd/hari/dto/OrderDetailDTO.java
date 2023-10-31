package com.smhrd.hari.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDTO {
    private long oNo;

    private String userId;

    private int totalAmount;

    private int discountAmount;

    private LocalDateTime created_at;

    private String oState;

    private int payAmount;

    private String mNo;

    public int getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(int payAmount) {
        this.payAmount = payAmount;
    }

    public Long getoNo() {
        return oNo;
    }

    public void setoNo(Long oNo) {
        this.oNo = oNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public String getoState() {
        return oState;
    }

    public void setoState(String oState) {
        this.oState = oState;
    }

    public void setoNo(long oNo) {
        this.oNo = oNo;
    }

    public String getmNo() {
        return mNo;
    }

    public void setmNo(String mNo) {
        this.mNo = mNo;
    }
}
