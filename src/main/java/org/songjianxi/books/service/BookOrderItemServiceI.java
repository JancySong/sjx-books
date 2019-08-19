package org.songjianxi.books.service;

import java.io.Serializable;
import java.util.List;

import org.songjianxi.books.domain.BookOrderItem;
import org.songjianxi.books.driven.BookOrderItemDTO;
import org.songjianxi.books.util.tips.DataGridTip;

public interface BookOrderItemServiceI {
    public DataGridTip<BookOrderItemDTO> getBookOrderItemByOrderId(BookOrderItemDTO bookOrderItemDTO);

    public Serializable saveOrderItems(BookOrderItem bookOrderItem);

    public List<BookOrderItemDTO> getBookOrderItemsById(BookOrderItemDTO bookOrderItemDTO);
}
