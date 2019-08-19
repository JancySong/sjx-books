package org.songjianxi.books.driven;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserCommentDTO implements Serializable {
    private static final long serialVersionUID = -4644808871523165968L;

    private String commId;
    private String content;
    private Timestamp commTime;

    private String bookId;

    private Timestamp commTimeFrom;
    private Timestamp commTimeTo;

    private String bookName;
    private String userName;
    private Integer page;
    private Integer rows;

    public String getCommId() {
        return commId;
    }

    public void setCommId(String commId) {
        this.commId = commId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCommTime() {
        return commTime;
    }

    public void setCommTime(Timestamp commTime) {
        this.commTime = commTime;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public Timestamp getCommTimeFrom() {
        return commTimeFrom;
    }

    public void setCommTimeFrom(Timestamp commTimeFrom) {
        this.commTimeFrom = commTimeFrom;
    }

    public Timestamp getCommTimeTo() {
        return commTimeTo;
    }

    public void setCommTimeTo(Timestamp commTimeTo) {
        this.commTimeTo = commTimeTo;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

}
