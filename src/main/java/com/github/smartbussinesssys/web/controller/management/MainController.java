package com.github.smartbussinesssys.web.controller.management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/management")
public class MainController {

    @GetMapping("/main")
    public String index(){
        return "management/main";
    }
}
