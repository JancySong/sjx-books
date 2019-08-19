package org.songjianxi.books.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "tb_bookbaseinfo")
public class BookBaseInfo implements Serializable {
    private static final long serialVersionUID = 1046631870294704119L;

    private String bid;
    private BookCategory bookCategory;
    private String bookName;
    private String author;
    private Double price;
    private Integer totalPages;
    private Timestamp publishDate;
    private String press;
    private String coverImage;
    private String introduction;
    private BookStock bookStock;

    private List<BookImg> bookImgList = new ArrayList<BookImg>(0);

    @Id
    @Column(name = "bid", unique = true, nullable = false, length = 40)
    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cid", nullable = false)
    public BookCategory getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(BookCategory bookCategory) {
        this.bookCategory = bookCategory;
    }

    @Column(name = "bookName", nullable = false, length = 100)
    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    @Column(name = "author", nullable = false, length = 50)
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Column(name = "price", nullable = false)
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Column(name = "totalPages")
    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    @Column(name = "publishDate", nullable = false, length = 19)
    public Timestamp getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Timestamp publishDate) {
        this.publishDate = publishDate;
    }

    @Column(name = "press", nullable = false, length = 100)
    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    @Column(name = "coverImage", length = 100)
    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

    @Column(name = "introduction", length = 1000)
    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "bookBaseInfo")
    public BookStock getBookStock() {
        return bookStock;
    }

    public void setBookStock(BookStock bookStock) {
        this.bookStock = bookStock;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "bookBaseInfo")
    public List<BookImg> getBookImgList() {
        return bookImgList;
    }

    public void setBookImgList(List<BookImg> bookImgList) {
        this.bookImgList = bookImgList;
    }


    public BookBaseInfo() {}

    @Override
    public String toString() {
        return "BookBaseInfo [bid=" + bid + ", bookCategory=" + bookCategory + ", bookName=" + bookName + ", author=" + author + ", price="
                + price + ", totalPages=" + totalPages + ", publishDate=" + publishDate + ", press=" + press + ", coverImage=" + coverImage
                + ", introduction=" + introduction + ", bookStock=" + bookStock + ", bookImgList=" + bookImgList + "]";
    }



}
