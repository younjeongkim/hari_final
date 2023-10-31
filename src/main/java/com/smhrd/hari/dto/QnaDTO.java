package com.smhrd.hari.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@NoArgsConstructor
@AllArgsConstructor
public class QnaDTO {
    private int qNo;
    private String userId;
    private String subject;
    private String content;
    private String qnaFile;
    private LocalDateTime createdAt;

    public int getqNo() {
        return qNo;
    }

    public void setqNo(int qNo) {
        this.qNo = qNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getQnaFile() {
        return qnaFile;
    }

    public void setQnaFile(String qnaFile) {
        this.qnaFile = qnaFile;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
