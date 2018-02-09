package com.focuson.orderwithme.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserLoginController {

    @RequestMapping("/userlogin")
    public String showUserLoginForm(){
        return "userlogin";
    }
}
