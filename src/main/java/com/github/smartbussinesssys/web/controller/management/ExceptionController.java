package com.github.smartbussinesssys.web.controller.management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExceptionController {

    @GetMapping("/403")
    public String unauthenrized(){
        return "403";
    }
}
