package org.songjianxi.books.driven;

import java.io.Serializable;

public class BookImgDTO implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 4943677363670153328L;

    private String imgId;
    private String bid;
    private String imgUrl;
    private Integer orderBy;

    private String imgIds;
    private String orderBys;


    public String getImgIds() {
        return imgIds;
    }

    public void setImgIds(String imgIds) {
        this.imgIds = imgIds;
    }

    public String getOrderBys() {
        return orderBys;
    }

    public void setOrderBys(String orderBys) {
        this.orderBys = orderBys;
    }

    private Integer page;
    private Integer rows;

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Integer getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(Integer orderBy) {
        this.orderBy = orderBy;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "BookImgDTO [imgId=" + imgId + ", bid=" + bid + ", imgUrl=" + imgUrl + ", orderBy=" + orderBy + ", page=" + page + ", rows="
                + rows + "]";
    }

}
