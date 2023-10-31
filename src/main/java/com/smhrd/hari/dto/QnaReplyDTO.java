package com.smhrd.hari.dto;

import java.time.LocalDateTime;

public class QnaReplyDTO {
    private int rNo;
    private int qNo;
    private String rContent;
    private String userId;
    private LocalDateTime createdAt;

    public int getrNo() {
        return rNo;
    }

    public void setrNo(int rNo) {
        this.rNo = rNo;
    }

    public int getqNo() {
        return qNo;
    }

    public void setqNo(int qNo) {
        this.qNo = qNo;
    }

    public String getrContent() {
        return rContent;
    }

    public void setrContent(String rContent) {
        this.rContent = rContent;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
