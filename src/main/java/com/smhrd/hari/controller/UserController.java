package com.smhrd.hari.controller;

import com.smhrd.hari.dto.RegisterUserDTO;
import com.smhrd.hari.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/hari")
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    JavaMailSenderImpl mailSender;

    @GetMapping("/totalSignIn")
    public String totalSignIn() {
        return "register/totalSignIn";
    }

    @PostMapping("/userSignInOk")
    public ModelAndView userSignInOk(RegisterUserDTO registerUserDTO) {
        int result = 0;

        try {
            result = userService.userInsert(registerUserDTO);
        } catch(Exception e) {
            System.out.println("회원가입 실패!" + e.getMessage());
        }

        ModelAndView mav = new ModelAndView();

        if(result > 0) {
            System.out.println("registerUserDTO : " + registerUserDTO);
            // 회원가입 성공 시, 홈으로 이동
            mav.setViewName("register/totalLogIn");
        } else {
            System.out.println("registerUserDTO : " + registerUserDTO);
            // 회원가입 실패 시, 다시 회원가입으로 이동
            mav.setViewName("register/registerResult");
        }

        return mav;
    }

    @GetMapping("/totalLogIn")
    public String totalLogIn() {
        return "register/totalLogIn";
    }

    @PostMapping("/userLogInOk")
    public ModelAndView userLogInOk(RegisterUserDTO registerUserDTO, HttpSession session) {
        RegisterUserDTO loginResult = userService.userSelect(registerUserDTO);

        ModelAndView mav = new ModelAndView();

        if(loginResult != null) {
            session.setAttribute("logId", registerUserDTO.getUserId());
            session.setAttribute("logStatus", "Y");
            session.setAttribute("logType", "U");

//            System.out.println("logId : " + session.getAttribute("logId"));

            mav.setViewName("main");
        } else {
            mav.setViewName("register/loginResult");
        }

        return mav;
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();

        ModelAndView mav = new ModelAndView();

        mav.setViewName("redirect:/");

        return mav;
    }

    @GetMapping("/idSearchForm")
    public String idSearchForm() {
        return "register/idSearchForm";
    }

    @PostMapping("/userIdSearchOk")
    @ResponseBody
    public String idSearchOk(RegisterUserDTO registerUserDTO) {
        RegisterUserDTO resultDTO = userService.userIdSearch(registerUserDTO);

//        System.out.println(resultDTO.getEmail());
        String resultTxt = "N";

        if(resultDTO != null) {
            String subject = "아이디 찾기 결과";
            String content = "<div style='background:pink; border:1px solid #ddd; padding:50px; text-align:center;'>";

            content += "검색한 아이디 : " + resultDTO.getUserId();
            content += "</div>";

            try {
                MimeMessage message = mailSender.createMimeMessage();
//                System.out.println(message);
                MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

                messageHelper.setFrom("hariproject@naver.com");
//                System.out.println(resultDTO.getEmail());
                messageHelper.setTo(resultDTO.getEmail());
                messageHelper.setSubject(subject);
                messageHelper.setText("text/html; charset=UTF-8", content);

                System.out.println(mailSender);
//                mailSender.send(message);

                resultTxt = "Y";
                System.out.println(resultTxt);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            resultTxt = "N";
        }

        return resultTxt;
    }

    @GetMapping("/pwdSearchForm")
    public String pwdSearchForm() {
        return "register/pwdSearchForm";
    }

//    @PostMapping ("/totalEdit")
//    public ModelAndView totalMyPage(RegisterUserDTO registerUserDTO, HttpSession session) {
//       String userId = (String) session.getAttribute("logId");
//
//       ModelAndView mav = new ModelAndView();
//
//       registerUserDTO.setUserId(userId);
//
//       RegisterUserDTO user = userService.userSelect(registerUserDTO);
//
//       if (user != null) {
//           mav.setViewName("register/totalEdit");
//           mav.addObject("dto", user);
//       } else {
//           mav.setViewName("main");
//       }
//
//       return mav;
//    }

    @GetMapping("/userEdit")
    public String userEdit(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("logId");

        RegisterUserDTO registerUserDTO = userService.userSelectOne(userId);

        model.addAttribute("user", registerUserDTO);

        return "register/userEdit";
    }

    @PostMapping("/userEditOk")
    public ModelAndView userEditOk(RegisterUserDTO registerUserDTO) {
        int result = userService.userUpdate(registerUserDTO);

        ModelAndView mav = new ModelAndView();

        if(result > 0) {
            mav.setViewName("main");
        } else {
            mav.setViewName("redirect:/hari/userEdit");
        }

        return mav;
    }
}
