package com.smhrd.hari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/hari/mainNav")
    public String mainNav() {
        return "mainNav";
    }
}
