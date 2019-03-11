package com.github.smartbussinesssys.web.controller.management;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/management")
public class MenuController {

    @PostMapping("/getmenudata")
    public void getMenuData(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print("[{\n" +
                    "  \"id\":1,\n" +
                    "  \"text\":\"基本数据\",\n" +
                    "  \"iconCls\":\"icon-save\",\n" +
                    "  \"children\":[{\n" +
                    "    \"text\":\"用户管理\",\n" +
                    "    \"url\":\"" + request.getContextPath() + "/management/employee/index\"\n" +
                    "  },{\n" +
                    "    \"text\":\"部门管理\",\n" +
                    "    \"url\":\"" + request.getContextPath() + "/management/department/index\"\n" +
                    "  }]\n" +
                    "}]");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
