package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public String goHome(Map<String, Object> map) {
        return "textcounter";
    }

}
