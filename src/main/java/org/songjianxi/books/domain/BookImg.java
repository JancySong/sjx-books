package org.songjianxi.books.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "tb_bookimg")
public class BookImg implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 7758239856288595476L;

    private String imgId;
    private BookBaseInfo bookBaseInfo;
    private String imgUrl;
    private Integer orderBy;

    // private String bid;

    @Id
    @Column(name = "imgId", unique = true, nullable = false, length = 40)
    public String getImgId() {
        return this.imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bid")
    public BookBaseInfo getBookBaseInfo() {
        return bookBaseInfo;
    }

    public void setBookBaseInfo(BookBaseInfo bookBaseInfo) {
        this.bookBaseInfo = bookBaseInfo;
    }

    @Column(name = "imgUrl", length = 200)
    public String getImgUrl() {
        return this.imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    @Column(name = "orderBy")
    public Integer getOrderBy() {
        return this.orderBy;
    }

    public void setOrderBy(Integer orderBy) {
        this.orderBy = orderBy;
    }

    // @Column(name = "bid", length = 40)
    // public String getBid() {
    // return bid;
    // }
    //
    // public void setBid(String bid) {
    // this.bid = bid;
    // }

    public BookImg() {
        // TODO Auto-generated constructor stub
    }
}
