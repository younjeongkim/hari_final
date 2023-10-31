package com.smhrd.hari.controller;

import com.smhrd.hari.dto.PagingDTO;
import com.smhrd.hari.dto.QnaReplyDTO;
import com.smhrd.hari.service.QnaReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/hari")
public class QnaReplyController {
    @Autowired
    QnaReplyService qnaReplyService;

    @ResponseBody
    @PostMapping("/qnaReplyWrite")
    public String qnaReplyWrite(@RequestParam("rContent") String rContent, QnaReplyDTO qnareplyDTO, PagingDTO pagingDTO, HttpSession session) {
        qnareplyDTO.setUserId((String)session.getAttribute("logId"));
        qnareplyDTO.setrContent(rContent);
        int result = qnaReplyService.qnaReplyInsert(qnareplyDTO);
        return result + "";
    }

    @GetMapping("/qnaReplyList")
    @ResponseBody   // 해당 어노테이션을 추가하여 JSON 데이터를 반환하도록 설정
    public List<QnaReplyDTO> qnaReplyList(@RequestParam int qNo) {
        return qnaReplyService.qnaReplySelect(qNo);
    }

    @PostMapping("/qnaReplyEditOk")
    // 댓글 수정(DB: update)
    public String qnaReplyEditOk(QnaReplyDTO qnaReplyDTO) {
        return String.valueOf(qnaReplyService.qnaReplyUpdate(qnaReplyDTO));
    }

    @GetMapping("/qnaReplyDelete")
    // 댓글 삭제
    public String qnaReplyDel(@RequestParam int rNo) {
        return String.valueOf(qnaReplyService.qnaReplyDelete(rNo));
    }
}
