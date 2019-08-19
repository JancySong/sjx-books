package org.songjianxi.books.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tb_bookorder")
public class BookOrder implements Serializable {
    private static final long serialVersionUID = -4094695715354563688L;

    private String orderId;
    private User user;
    private Timestamp orderTime;
    private Double total;
    private Integer status;
    private String address;
    private Set<BookOrderItem> bookOrderItems = new HashSet<BookOrderItem>(0);

    @Id
    @Column(name = "orderId", unique = true, nullable = false, length = 40)
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "uid", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "orderTime", nullable = false, length = 19)
    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    @Column(name = "total", nullable = false, precision = 22, scale = 0)
    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name = "address", nullable = false, length = 100)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "bookOrder")
    public Set<BookOrderItem> getBookOrderItems() {
        return bookOrderItems;
    }

    public void setBookOrderItems(Set<BookOrderItem> bookOrderItems) {
        this.bookOrderItems = bookOrderItems;
    }



    public BookOrder() {}

    public BookOrder(String orderId, User user, Timestamp orderTime, Double total, Integer status, String address) {
        super();
        this.orderId = orderId;
        this.user = user;
        this.orderTime = orderTime;
        this.total = total;
        this.status = status;
        this.address = address;
    }



}
