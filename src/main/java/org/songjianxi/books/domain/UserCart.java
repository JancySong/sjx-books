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
@Table(name = "tb_cart")
public class UserCart implements Serializable{
	private static final long serialVersionUID = -6778832487770703236L;

	private String cartId;
	private User user;
	private BookBaseInfo bookBaseInfo;
	private Integer quantity;
	
	@Id
	@Column(name = "cartId", unique = true, nullable = false, length = 40)
	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "uid", nullable = false)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bid", nullable = false)
	public BookBaseInfo getBookBaseInfo() {
		return bookBaseInfo;
	}
	public void setBookBaseInfo(BookBaseInfo bookBaseInfo) {
		this.bookBaseInfo = bookBaseInfo;
	}
	
	@Column(name = "quantity", nullable = false)
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
	
	public UserCart() {
	}
}
