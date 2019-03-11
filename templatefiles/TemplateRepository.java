package com.github.smartbussinesssys.repository;

import com.github.smartbussinesssys.domain.${Template};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ${Template}Repository extends JpaRepository<${Template}, Long>, JpaSpecificationExecutor<${Template}> {
}
