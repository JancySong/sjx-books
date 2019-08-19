package org.songjianxi.books.driven;

import java.io.Serializable;

public class BookStockDTO implements Serializable {
    private static final long serialVersionUID = -8968733980375623222L;

    private String bid;
    private Integer bookStock;
    private Integer bookStockFrom;
    private Integer bookStockTo;
    private Integer applyCount;
    private String applyContent;

    private String bookName;
    private String author;
    private String press;
    private Integer page;
    private Integer rows;

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public Integer getBookStock() {
        return bookStock;
    }

    public void setBookStock(Integer bookStock) {
        this.bookStock = bookStock;
    }

    public Integer getApplyCount() {
        return applyCount;
    }

    public void setApplyCount(Integer applyCount) {
        this.applyCount = applyCount;
    }

    public String getApplyContent() {
        return applyContent;
    }

    public void setApplyContent(String applyContent) {
        this.applyContent = applyContent;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public Integer getBookStockFrom() {
        return bookStockFrom;
    }

    public void setBookStockFrom(Integer bookStockFrom) {
        this.bookStockFrom = bookStockFrom;
    }

    public Integer getBookStockTo() {
        return bookStockTo;
    }

    public void setBookStockTo(Integer bookStockTo) {
        this.bookStockTo = bookStockTo;
    }

}
