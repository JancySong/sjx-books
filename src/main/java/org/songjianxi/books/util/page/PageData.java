package org.songjianxi.books.util.page;

import java.io.Serializable;
import java.util.List;

public class PageData<T> implements Serializable {
    /**
	 * 
	 */
    private static final long serialVersionUID = -197215061175684072L;
    private PagingInfo page;
    private List<T> list;

    public PagingInfo getPage() {
        return this.page;
    }

    public void setPage(PagingInfo page) {
        this.page = page;
    }

    public List<T> getList() {
        return this.list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
