package com.github.smartbussinesssys.service.impl;

import com.github.smartbussinesssys.domain.Employee;
import com.github.smartbussinesssys.domain.UIPage;
import com.github.smartbussinesssys.repository.EmployeeRepository;
import com.github.smartbussinesssys.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeServiceImpl implements IEmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    @Transactional
    public void save(Employee entity) {
        employeeRepository.save(entity);
    }

    @Override
    @Transactional
    public void delete(Long aLong) {
        Employee employee = find(aLong);
        employeeRepository.delete(employee);
    }

    @Override
    public Employee find(Long aLong) {
        return employeeRepository.findById(aLong).get();
    }

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public UIPage<Employee> find_Page(int currentPageIndex, int pageSize) {
        Pageable pageable = PageRequest.of(currentPageIndex, pageSize);
        Page<Employee> employees = employeeRepository.findAll(pageable);
        UIPage<Employee> employeeUIPage = new UIPage<>(employees.getTotalElements(), employees.getContent());
        return employeeUIPage;
    }

    @Override
    public UIPage<Employee> search_Page(int currentPageIndex, int pageSize, String username, String email, Integer departmentId) {
        Page<Employee> employees = employeeRepository.findAll((root, criteriaQuery, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();

            //要操作的列
            Path<String> usernamePath = root.get("username");
            Path<String> emailPath = root.get("email");
            //员工要操作的员工对应的部门
            Join<Object, Object> departmentJoin = root.join("department", JoinType.INNER);

            //如果有用户名，则模糊查询
            if ((!"".equals(username)) && (username != null))
                predicates.add(criteriaBuilder.like(usernamePath, "%" + username + "%"));
            //如果有邮箱，则模糊查询
            if ((!"".equals(email)) && (email != null))
                predicates.add(criteriaBuilder.like(emailPath, "%" + email + "%"));
            //如果有部门ID，则模糊查询
            if (departmentId != null)
                predicates.add(criteriaBuilder.equal(departmentJoin.get("id"), departmentId));

            //之所以要从List转成Array，是因为Array的创建需要指定长度，而条件（predicates）定不了到底是多少个
            Predicate[] p = new Predicate[predicates.size()];
            criteriaQuery.where(criteriaBuilder.and(predicates.toArray(p)));

            return criteriaQuery.getRestriction();
        }, PageRequest.of(currentPageIndex, pageSize));
        UIPage<Employee> employeeUIPage = new UIPage<>(employees.getTotalElements(), employees.getContent());
        return employeeUIPage;
    }

    @Override
    public List<Employee> findByUsername(String username) {
        return employeeRepository.findByUsername(username);
    }
}
