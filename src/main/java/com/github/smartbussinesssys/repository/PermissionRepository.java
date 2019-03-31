package com.github.smartbussinesssys.repository;

import com.github.smartbussinesssys.domain.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PermissionRepository extends JpaRepository<Permission, Long>, JpaSpecificationExecutor<Permission> {

    @Query("select p from Employee e join e.roles r join r.permissions p where e.id=:id")
    List<Permission> findPermissionsByEmployeeId(Long id);
}
