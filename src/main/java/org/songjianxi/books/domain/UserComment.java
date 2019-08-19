package org.songjianxi.books.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "tb_comment")
public class UserComment implements Serializable{
	private static final long serialVersionUID = -8055617687978539762L;

	private String commId;
	private BookBaseInfo bookBaseInfo;
	private User user;
	private String content;
	private Timestamp commTime;
	
	@Id
	@Column(name = "commentID", unique = true, nullable = false, length = 40)
	public String getCommId() {
		return commId;
	}
	public void setCommId(String commId) {
		this.commId = commId;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bookID", nullable = false)
	public BookBaseInfo getBookBaseInfo() {
		return bookBaseInfo;
	}
	public void setBookBaseInfo(BookBaseInfo bookBaseInfo) {
		this.bookBaseInfo = bookBaseInfo;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userID", nullable = false)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "commentContent", length = 1000)
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name = "commentDate", length = 19)
	public Timestamp getCommTime() {
		return commTime;
	}
	public void setCommTime(Timestamp commTime) {
		this.commTime = commTime;
	}

	
	
	public UserComment() {
	}
}
