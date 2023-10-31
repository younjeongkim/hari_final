package com.smhrd.hari.service;

import com.smhrd.hari.dto.QnaReplyDTO;

import java.util.List;

public interface QnaReplyService {
    int qnaReplyInsert(QnaReplyDTO qnaReplyDTO);
    List<QnaReplyDTO> qnaReplySelect(int qNo);
    int qnaReplyUpdate(QnaReplyDTO qnaReplyDTO);
    int qnaReplyDelete(int rNo);
}
