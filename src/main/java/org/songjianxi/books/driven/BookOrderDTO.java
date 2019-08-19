package org.songjianxi.books.driven;

import java.io.Serializable;
import java.sql.Timestamp;

public class BookOrderDTO implements Serializable {
    private static final long serialVersionUID = -3045414032195821016L;


    private String orderId;

    private String orderIds;
    private Timestamp orderTime;
    private Double total;
    private Integer status;
    private String address;

    private Timestamp orderTimeFrom;
    private Timestamp orderTimeTo;
    private String username;

    private String cartIds;
    private String userId;

    private Integer page;
    private Integer rows;
    private String bankNo;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderIds() {
        return orderIds;
    }

    public void setOrderIds(String orderIds) {
        this.orderIds = orderIds;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getOrderTimeFrom() {
        return orderTimeFrom;
    }

    public void setOrderTimeFrom(Timestamp orderTimeFrom) {
        this.orderTimeFrom = orderTimeFrom;
    }

    public Timestamp getOrderTimeTo() {
        return orderTimeTo;
    }

    public void setOrderTimeTo(Timestamp orderTimeTo) {
        this.orderTimeTo = orderTimeTo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getCartIds() {
        return cartIds;
    }

    public void setCartIds(String cartIds) {
        this.cartIds = cartIds;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBankNo() {
        return bankNo;
    }

    public void setBankNo(String bankNo) {
        this.bankNo = bankNo;
    }



}
