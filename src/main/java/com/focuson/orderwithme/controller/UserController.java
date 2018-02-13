package com.focuson.orderwithme.controller;

import com.focuson.orderwithme.model.User;
import com.focuson.orderwithme.service.IUserSignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
public class UserController {
    @Autowired
    private IUserSignUpService userSignUpService;

    @GetMapping("/usersignup")
    public String showForm(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "usersignup";
    }

    @PostMapping("/addUser")
    public ResponseEntity<Void> addUser(@ModelAttribute("user") User user, UriComponentsBuilder builder){
        System.out.println(user.toString());
        boolean success = userSignUpService.addUser(user);
        if(!success){
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("user/{id}").buildAndExpand(user.getUseruuid()).toUri());
        return new ResponseEntity<>(headers, HttpStatus.CREATED);
    }


}
