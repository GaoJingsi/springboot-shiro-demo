package com.github.smartbussinesssys.service;

import com.github.smartbussinesssys.domain.${Template};
import com.github.smartbussinesssys.domain.UIPage;

import java.util.List;

public interface I${Template}Service extends IBaseService<${Template}, Long> {
    UIPage<${Template}> search_Page(int currentPageIndex, int pageSize);
}
