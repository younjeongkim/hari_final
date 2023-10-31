package com.smhrd.hari.controller;

import com.smhrd.hari.dto.PagingDTO;
import com.smhrd.hari.dto.QnaDTO;
import com.smhrd.hari.service.QnaReplyService;
import com.smhrd.hari.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hari")
public class QnaController {
    @Autowired
    QnaService qnaService;
    @Autowired
    QnaReplyService qnaReplyService;

    @GetMapping("/qnaList")
    public ModelAndView qnaList(PagingDTO pagingDTO) {
        pagingDTO.setTotalRecord(qnaService.totalRecord(pagingDTO));

        List<QnaDTO> list = qnaService.qnaList(pagingDTO);

        ModelAndView mav = new ModelAndView();

        mav.addObject("list", list);
        mav.addObject("pagingDTO", pagingDTO);
        mav.setViewName("qna/qnaList");

        return mav;
    }

    @GetMapping("/qnaWrite")
    public ModelAndView qnaWrite() {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("qna/qnaWrite");

        return mav;
    }

//    @PostMapping("/qnaWriteOk")
//    public ResponseEntity<String> qnaWriteOk(QnaDTO qnaDTO, HttpServletRequest request) {
//        qnaDTO.setUserId((String) request.getSession().getAttribute("logId"));
//
//        int result = 0;
//
//        try {
//            result = qnaService.qnaWrite(qnaDTO);
//        } catch (Exception e) {
//            System.out.println("문의 글 등록 예외 발생!" + e.getMessage());
//        }
//
//        String tag = "<script>";
//
//        if (result > 0) {
//            tag += "location.href='/hari/qnaList';";
//        } else {
//            tag += "alert('글 등록이 실패하였습니다.');";
//            tag += "history.back();";
//        }
//
//        tag += "</script>";
//
//        HttpHeaders headers = new HttpHeaders();
//
//        headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
//
//        return new ResponseEntity<String>(tag, headers, HttpStatus.OK);
//    }
//
    @GetMapping("/qnaView")
    public ModelAndView qnaView(int qNo, PagingDTO pagingDTO) {
        QnaDTO qnaDTO = qnaService.qnaSelect(qNo);

        ModelAndView mav = new ModelAndView();

        mav.addObject("qnaDTO", qnaDTO);
        mav.addObject("pagingDTO", pagingDTO);
        mav.setViewName("qna/qnaView");

        return mav;
    }

    @PostMapping("/qnaWriteOk")
    public ResponseEntity<String> qnaWriteOk(QnaDTO qnaDTO, HttpServletRequest request) {
        qnaDTO.setUserId((String) request.getSession().getAttribute("logId"));

        int result = 0;

        try {
            result = qnaService.qnaWrite(qnaDTO);
        } catch (Exception e) {
            System.out.println("문의 글 등록 예외 발생!" + e.getMessage());
        }

        String tag = "<script>";

        if (result > 0) {
            tag += "location.href='/hari/qnaList';";
        } else {
            tag += "alert('글 등록이 실패하였습니다.');";
            tag += "history.back();";
        }

        tag += "</script>";

        HttpHeaders headers = new HttpHeaders();

        headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

        return new ResponseEntity<String>(tag, headers, HttpStatus.OK);
    }

    @GetMapping("/qnaDelete")
    public ModelAndView qnaDelete(@RequestParam int qNo) {
        int result = qnaService.qnaDelete(qNo);

        ModelAndView mav = new ModelAndView();

        if (result > 0) {
            mav.setViewName("redirect:/hari/qnaList");
        } else {
            mav.setViewName("redirect:/hari/qnaView/" + qNo);
        }
        return mav;
    }

    @GetMapping("/qnaEdit")
    public ModelAndView qnaEdit(int qNo) {
        QnaDTO qnaDTO = qnaService.qnaSelect(qNo);

        ModelAndView mav = new ModelAndView();

        mav.addObject("qnaDTO", qnaDTO);
        mav.setViewName("qna/qnaEdit");

        return mav;
    }

//    @PostMapping("/qnaEditOk")
//    public ModelAndView qnaEditOk(QnaDTO qnaDTO, HttpSession session) {
//        qnaDTO.setUserId((String) session.getAttribute("logId"));
//
//        int result = qnaService.qnaEdit(qnaDTO);
//
//        ModelAndView mav = new ModelAndView();
//
//        mav.addObject("qNo", qnaDTO.getqNo());
//
//        if (result > 0) {
//            mav.setViewName("redirect:/hari/qnaView");
//        } else {
//            mav.setViewName("redirect:/hari/qnaEdit");
//        }
//
//        return mav;
//    }

    @PostMapping("/qnaEditOk")
    @ResponseBody
    public Map<String, Object> qnaEditOk(@RequestBody QnaDTO qnaDTO, HttpSession session) {
        qnaDTO.setUserId((String) session.getAttribute("logId"));

        int result = qnaService.qnaEdit(qnaDTO);

        Map<String, Object> response = new HashMap<>();

        if (result > 0) {
            response.put("success", true);
            response.put("message", "수정되었습니다.");
        } else {
            response.put("success", false);
            response.put("message", "수정에 실패했습니다.");
        }

        return response;
    }

}
