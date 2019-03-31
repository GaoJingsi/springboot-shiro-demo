package com.github.smartbussinesssys.web.controller.management;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/management/account")
public class AccountController {

    @GetMapping("/login")
    public String login() {
        return "management/account/login";
    }

    @PostMapping("/login")
    public String login(String username, String password, HttpServletRequest request) {
        try {
            Subject subject = SecurityUtils.getSubject();
            if (!subject.isAuthenticated()) {
                subject.login(new UsernamePasswordToken(username, password));
            }
        } catch (UnknownAccountException e) {
            System.out.println("用户名不存在！！");
            e.printStackTrace();
        } catch (IncorrectCredentialsException e) {
            System.out.println("密码不存在！");
            e.printStackTrace();
        } catch (AuthenticationException e) {
            System.out.println("登录出错！");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("其他错误！");
            e.printStackTrace();
        }
        return "redirect:/management/main";
    }

    @GetMapping("/logout")
    public String logout() {
        SecurityUtils.getSubject().logout();
        return "management/account/login";
    }
}
