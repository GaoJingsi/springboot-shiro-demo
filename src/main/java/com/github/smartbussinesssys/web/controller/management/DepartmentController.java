package com.github.smartbussinesssys.web.controller.management;

import com.github.smartbussinesssys.domain.Department;
import com.github.smartbussinesssys.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/management/department")
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;

    @PostMapping("/getdepartments")
    @ResponseBody
    public List<Department> getDepartments(){
        return departmentService.findAll();
    }
}
