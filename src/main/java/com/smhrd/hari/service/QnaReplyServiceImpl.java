package com.smhrd.hari.service;

import com.smhrd.hari.dto.QnaReplyDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {
    @Autowired
    SqlSessionTemplate sql;

    @Override
    public int qnaReplyInsert(QnaReplyDTO qnaReplyDTO) {
        return sql.insert("QnaReply.qnaReplyInsert", qnaReplyDTO);
    }

    @Override
    public List<QnaReplyDTO> qnaReplySelect(int qNo) {
        return sql.selectList("QnaReply.qnaReplySelect", qNo);
    }

    @Override
    public int qnaReplyUpdate(QnaReplyDTO qnaReplyDTO) {
        return sql.update("QnaReply.qnaReplyUpdate", qnaReplyDTO);
    }

    @Override
    public int qnaReplyDelete(int rNo) {
        return sql.delete("Qnareply.qnareplyDelete", rNo);
    }
}
