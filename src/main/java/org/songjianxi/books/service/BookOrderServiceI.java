package org.songjianxi.books.service;

import java.io.Serializable;
import java.util.List;

import org.songjianxi.books.domain.BookOrder;
import org.songjianxi.books.driven.BookOrderDTO;
import org.songjianxi.books.util.tips.DataGridTip;

public interface BookOrderServiceI {

    public DataGridTip<BookOrderDTO> getBookOrderByCondition(BookOrderDTO bookOrderDTO);

    public Integer batchUpdateOrderStatus(BookOrderDTO bookOrderDTO);

    public Serializable generateOrder(BookOrder bookOrder);

    public Integer updateTotal(BookOrderDTO bookOrderDTO);

    public List<BookOrder> getBookOrdersByUserId(BookOrderDTO bookOrderDTO);

    public BookOrderDTO getBookOrderToPay(BookOrderDTO bookOrderDTO);
}
