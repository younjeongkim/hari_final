package com.smhrd.hari.service;

import com.smhrd.hari.dto.PagingDTO;
import com.smhrd.hari.dto.QnaDTO;

import java.util.List;

public interface QnaService {
    int qnaWrite(QnaDTO qnaDTO);

    int totalRecord(PagingDTO pagingDTO);

    List<QnaDTO> qnaList(PagingDTO pagingDTO);

    QnaDTO qnaSelect(int qNo);

    int qnaDelete(int qNo);

    int qnaEdit(QnaDTO qnaDTO);
}
