package com.github.smartbussinesssys.service;


import com.github.smartbussinesssys.domain.Permission;

import java.util.List;

public interface IPermissionService extends IBaseService<Permission, Long> {
    List<Permission> findPermissionsByEmpId(Long id);
}
