package com.github.smartbussinesssys.service.impl;

import com.github.smartbussinesssys.domain.Permission;
import com.github.smartbussinesssys.domain.UIPage;
import com.github.smartbussinesssys.repository.PermissionRepository;
import com.github.smartbussinesssys.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    private PermissionRepository permissionRepository;

    public PermissionServiceImpl(){
        System.out.println("11111111111111111111111111111111111111111111111111111111111");
    }

    @Override
    public void save(Permission entity) {
        permissionRepository.save(entity);
    }

    @Override
    public void delete(Long id) {
        permissionRepository.deleteById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Permission find(Long id) {
        return permissionRepository.findById(id).get();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Permission> findAll() {
        return permissionRepository.findAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public UIPage<Permission> find_Page(int currentPageIndex, int pageSize) {
        Page<Permission> permissions = permissionRepository.findAll(PageRequest.of(currentPageIndex, pageSize));
        return new UIPage<>(permissions.getTotalElements(), permissions.getContent());
    }

    @Override
    public List<Permission> findPermissionsByEmpId(Long id) {
        return permissionRepository.findPermissionsByEmployeeId(id);
    }
}
