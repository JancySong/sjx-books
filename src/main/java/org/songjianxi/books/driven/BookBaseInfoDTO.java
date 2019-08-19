package org.songjianxi.books.driven;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class BookBaseInfoDTO implements Serializable {
    private static final long serialVersionUID = -5600390315975820924L;

    private String bid;
    private String bookName;

    private Integer cid;


    private Integer cid2;

    private String bookType;

    private String author;
    private Double price;
    private Integer totalPages;
    private Timestamp publishDate;

    private Timestamp publishDateFrom;
    private Timestamp publishDateTo;

    private String press;
    private String coverImage;
    private String introduction;

    private String likeWhere;

    private Integer pageIndex;
    private Integer pageSize;

    private Integer page;
    private Integer rows;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCid2() {
        return cid2;
    }

    public void setCid2(Integer cid2) {
        this.cid2 = cid2;
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

    public Timestamp getPublishDateFrom() {
        return publishDateFrom;
    }

    public void setPublishDateFrom(Timestamp publishDateFrom) {
        this.publishDateFrom = publishDateFrom;
    }

    public Timestamp getPublishDateTo() {
        return publishDateTo;
    }

    public void setPublishDateTo(Timestamp publishDateTo) {
        this.publishDateTo = publishDateTo;
    }

    private List<String> imgUrls;

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public String getLikeWhere() {
        return likeWhere;
    }

    public void setLikeWhere(String likeWhere) {
        this.likeWhere = likeWhere;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Timestamp getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Timestamp publishDate) {
        this.publishDate = publishDate;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }


    public List<String> getImgUrls() {
        return imgUrls;
    }

    public void setImgUrls(List<String> imgUrls) {
        this.imgUrls = imgUrls;
    }

    @Override
    public String toString() {
        return "BookBaseInfoDTO [bid=" + bid + ", bookName=" + bookName + ", cid=" + cid + ", cid2=" + cid2 + ", bookType=" + bookType
                + ", author=" + author + ", price=" + price + ", totalPages=" + totalPages + ", publishDate=" + publishDate
                + ", publishDateFrom=" + publishDateFrom + ", publishDateTo=" + publishDateTo + ", press=" + press + ", coverImage="
                + coverImage + ", introduction=" + introduction + ", likeWhere=" + likeWhere + ", pageIndex=" + pageIndex + ", pageSize="
                + pageSize + ", page=" + page + ", rows=" + rows + ", imgUrls=" + imgUrls + "]";
    }


}
