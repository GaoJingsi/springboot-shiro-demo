package com.github.smartbussinesssys.service.impl;

import com.github.smartbussinesssys.domain.${Template};
import com.github.smartbussinesssys.domain.UIPage;
import com.github.smartbussinesssys.repository.${Template}Repository;
import com.github.smartbussinesssys.service.I${Template}Service;
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
public class ${Template}ServiceImpl implements I${Template}Service {

    @Autowired
    private ${Template}Repository ${template}Repository;

    @Override
    @Transactional
    public void save(${Template} entity) {
        ${template}Repository.save(entity);
    }

    @Override
    @Transactional
    public void delete(Long aLong) {
        ${Template} ${template} = find(aLong);
        ${template}Repository.delete(${template});
    }

    @Override
    public ${Template} find(Long aLong) {
        return ${template}Repository.findById(aLong).get();
    }

    @Override
    public List<${Template}> findAll() {
        return ${template}Repository.findAll();
    }

    @Override
    public UIPage<${Template}> find_Page(int currentPageIndex, int pageSize) {
        Pageable pageable = PageRequest.of(currentPageIndex, pageSize);
        Page<${Template}> ${template}s = ${template}Repository.findAll(pageable);
        UIPage<${Template}> ${template}UIPage = new UIPage<>(${template}s.getTotalElements(), ${template}s.getContent());
        return ${template}UIPage;
    }

    @Override
    public UIPage<${Template}> search_Page(int currentPageIndex, int pageSize, String username, String email, Integer departmentId) {
        Page<${Template}> ${template}s = ${template}Repository.findAll((root, criteriaQuery, criteriaBuilder) -> {
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
        UIPage<${Template}> ${template}UIPage = new UIPage<>(${template}s.getTotalElements(), ${template}s.getContent());
        return ${template}UIPage;
    }

    @Override
    public List<${Template}> findByUsername(String username) {
        return ${template}Repository.findByUsername(username);
    }
}
