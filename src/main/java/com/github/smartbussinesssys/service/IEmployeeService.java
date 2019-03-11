package com.github.smartbussinesssys.service;

import com.github.smartbussinesssys.domain.Employee;
import com.github.smartbussinesssys.domain.UIPage;

import java.util.List;

public interface IEmployeeService extends IBaseService<Employee, Long> {
    UIPage<Employee> search_Page(int currentPageIndex, int pageSize, String username, String email, Integer departmentId);
    List<Employee> findByUsername(String username);
}
