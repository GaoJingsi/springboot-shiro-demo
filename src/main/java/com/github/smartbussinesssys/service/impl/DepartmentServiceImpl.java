package com.github.smartbussinesssys.service.impl;

import com.github.smartbussinesssys.domain.Department;
import com.github.smartbussinesssys.domain.Employee;
import com.github.smartbussinesssys.domain.UIPage;
import com.github.smartbussinesssys.repository.DepartmentRepository;
import com.github.smartbussinesssys.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;

    @Override
    @Transactional
    public void save(Department entity) {
        departmentRepository.save(entity);
    }

    @Override
    @Transactional
    public void delete(Long aLong) {
        Department employee = find(aLong);
        departmentRepository.delete(employee);
    }

    @Override
    public Department find(Long aLong) {
        Optional<Department> department = departmentRepository.findById(aLong);
        return department.get();
    }

    @Override
    public List<Department> findAll() {
        List<Department> departments = departmentRepository.findAll();
        return departments;
    }

    @Override
    public UIPage<Department> find_Page(int currentPageIndex, int pageSize) {
        return null;
    }
}
