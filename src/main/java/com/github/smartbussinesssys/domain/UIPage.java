package com.github.smartbussinesssys.domain;

import java.util.List;

public class UIPage<T> {
    private Long total;
    private List<T> rows;

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public UIPage(Long total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }
}
