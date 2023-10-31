package com.smhrd.hari.service;

import com.smhrd.hari.dto.PagingDTO;
import com.smhrd.hari.dto.QnaDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaServiceImpl implements QnaService {
    @Autowired
    SqlSessionTemplate sql;

    @Override
    public int qnaWrite(QnaDTO qnaDTO) {
        return sql.insert("Qna.qnaWrite", qnaDTO);
    }

    @Override
    public int totalRecord(PagingDTO pagingDTO) {
        return sql.selectOne("Qna.totalRecord", pagingDTO);
    }

    @Override
    public List<QnaDTO> qnaList(PagingDTO pagingDTO) {
        return sql.selectList("Qna.qnaList", pagingDTO);
    }

    @Override
    public QnaDTO qnaSelect(int qNo) {
        return sql.selectOne("Qna.qnaSelect", qNo);
    }

    @Override
    public int qnaDelete(int qNo) {
        return sql.delete("Qna.qnaDelete", qNo);
    }

    @Override
    public int qnaEdit(QnaDTO qnaDTO) {
        return sql.update("Qna.qnaEdit", qnaDTO);
    }
}
