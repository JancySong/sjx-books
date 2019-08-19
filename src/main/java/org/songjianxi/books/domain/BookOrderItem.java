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
@Table(name = "tb_orderitem")
public class BookOrderItem implements Serializable{
	private static final long serialVersionUID = -8927383889912240657L;
	
	private String orderItemId;
	private BookBaseInfo bookBaseInfo;
	private BookOrder bookOrder;
	private Integer quantity;
	
	@Id
	@Column(name = "orderItemId", unique = true, nullable = false, length = 40)
	public String getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bid", nullable = false)
	public BookBaseInfo getBookBaseInfo() {
		return bookBaseInfo;
	}
	public void setBookBaseInfo(BookBaseInfo bookBaseInfo) {
		this.bookBaseInfo = bookBaseInfo;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "oid", nullable = false)
	public BookOrder getBookOrder() {
		return bookOrder;
	}
	public void setBookOrder(BookOrder bookOrder) {
		this.bookOrder = bookOrder;
	}
	
	@Column(name = "quantity", nullable = false)
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
	
	public BookOrderItem() {
	}

}
