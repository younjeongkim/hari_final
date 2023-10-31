package com.smhrd.hari;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("logId");
        String logStatus = (String) session.getAttribute("logStatus");

        if(userId == null || logStatus == null || userId.equals("") || logStatus.equals("Y")) {
            response.sendRedirect("/hari/register/login");

            return false;
        }

        return true;
    }
}
