package com.github.smartbussinesssys.service;

import com.github.smartbussinesssys.domain.UIPage;

import java.util.List;

public interface IBaseService<T, ID> {
    void save(T entity);

    void delete(ID id);

    T find(ID id);

    List<T> findAll();

    UIPage<T> find_Page(int currentPageIndex, int pageSize);
}
