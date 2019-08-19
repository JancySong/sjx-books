package org.songjianxi.books.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tb_bookcategory")
public class BookCategory implements Serializable {
    private static final long serialVersionUID = 7130671093796502155L;

    private Integer cid;
    private BookCategory bookCategory;
    private String cname;
    private Set<BookCategory> bookCategories = new HashSet<BookCategory>(0);
    private Set<BookBaseInfo> bookBaseInfos = new HashSet<BookBaseInfo>(0);

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "cid", unique = true, nullable = false)
    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pid")
    public BookCategory getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(BookCategory bookCategory) {
        this.bookCategory = bookCategory;
    }

    @Column(name = "cname", nullable = false, length = 40)
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "bookCategory")
    public Set<BookCategory> getBookCategories() {
        return bookCategories;
    }

    public void setBookCategories(Set<BookCategory> bookCategories) {
        this.bookCategories = bookCategories;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "bookCategory")
    public Set<BookBaseInfo> getBookBaseInfos() {
        return bookBaseInfos;
    }

    public void setBookBaseInfos(Set<BookBaseInfo> bookBaseInfos) {
        this.bookBaseInfos = bookBaseInfos;
    }



    public BookCategory() {}
}
