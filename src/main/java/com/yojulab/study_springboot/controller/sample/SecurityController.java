package com.yojulab.study_springboot.controller.sample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SecurityController {

    // @GetMapping({"/loginForm"})     // 로그인 폼 작성
    // public ModelAndView loginForm(ModelAndView modelAndView){
    //     String viewName = "/WEB-INF/sample/views/security/loginForm.jsp";
    //     modelAndView.setViewName(viewName);
    //     return modelAndView;
    // }

    // @GetMapping({"/logoutForm"})     // 로그아웃 폼 작성
    // public ModelAndView logoutForm(ModelAndView modelAndView){
    //     String viewName = "/WEB-INF/sample/views/security/logoutForm.jsp";
    //     modelAndView.setViewName(viewName);
    //     return modelAndView;
    // }
}