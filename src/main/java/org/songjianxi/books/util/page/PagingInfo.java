package org.songjianxi.books.util.page;

import java.io.Serializable;

public class PagingInfo implements Serializable {
    /**
	 * 
	 */
    private static final long serialVersionUID = 7690242205825198477L;
    private int currentPage;
    private int totalPage;
    private int currentCount;
    private int limitCount;
    private int totalCount;
    private int prevPage;
    private int nextPage;
    private int pageSize = 10;

    public int getCurrentPage() {
        return this.currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPage() {
        return this.totalPage;
    }

    public void setTotalPage(int totalPage) {
        int mod = getTotalCount() % getPageSize();
        int _totalPage = getTotalCount() / getPageSize();
        if (mod == 0) {
            this.totalPage = _totalPage;
        } else {
            this.totalPage = _totalPage + 1;
        }
        setPrevPage(1);
    }

    public int getCurrentCount() {
        return this.currentCount;
    }

    public void setCurrentCount(int currentCount) {
        this.currentCount = currentCount;
    }

    public int getLimitCount() {
        return this.limitCount;
    }

    public void setLimitCount(int limitCount) {
        this.limitCount = limitCount;
    }

    public int getTotalCount() {
        return this.totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        setTotalPage(1);
        setNextPage(1);
    }

    public int getPrevPage() {
        return prevPage;
    }

    public void setPrevPage(int prevPage) {
        if (getCurrentPage() - 1 <= 0) {
            this.prevPage = 1;
        } else {
            this.prevPage = prevPage;
        }
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        if (getCurrentPage() + 1 > getTotalPage()) {
            this.nextPage = getTotalPage();
        } else {
            this.nextPage = getCurrentPage() + 1;
        }
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
