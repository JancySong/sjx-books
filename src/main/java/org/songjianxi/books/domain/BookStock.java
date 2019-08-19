package org.songjianxi.books.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


@Entity
@Table(name = "tb_bookstock")
public class BookStock implements Serializable {
    private static final long serialVersionUID = 4386922652492861313L;

    private String bid;
    private BookBaseInfo bookBaseInfo;
    private Integer bookStock;
    private Integer applyCount;
    private String applyContent;

    @Id
    @Column(name = "bid", unique = true, nullable = false, length = 40)
    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    @OneToOne(fetch = FetchType.LAZY)
    @PrimaryKeyJoinColumn
    public BookBaseInfo getBookBaseInfo() {
        return bookBaseInfo;
    }

    public void setBookBaseInfo(BookBaseInfo bookBaseInfo) {
        this.bookBaseInfo = bookBaseInfo;
    }

    @Column(name = "bookStock")
    public Integer getBookStock() {
        return bookStock;
    }

    public void setBookStock(Integer bookStock) {
        this.bookStock = bookStock;
    }

    @Column(name = "applyCount")
    public Integer getApplyCount() {
        return applyCount;
    }

    public void setApplyCount(Integer applyCount) {
        this.applyCount = applyCount;
    }

    @Column(name = "applyContent", length = 100)
    public String getApplyContent() {
        return applyContent;
    }

    public void setApplyContent(String applyContent) {
        this.applyContent = applyContent;
    }



    public BookStock() {}
}
