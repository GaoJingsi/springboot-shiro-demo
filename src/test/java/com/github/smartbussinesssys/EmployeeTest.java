package com.github.smartbussinesssys;

import com.github.smartbussinesssys.domain.Employee;
import com.github.smartbussinesssys.service.IEmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SmartbussinesssysApplication.class)
public class EmployeeTest {

    @Autowired
    private IEmployeeService employeeService;

    @Test
    public void testFindAll(){
        List<Employee> employees = employeeService.findAll();
        System.out.println(employees);
    }
}
