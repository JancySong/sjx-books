package org.songjianxi.books.service;

import org.songjianxi.books.driven.BookStockDTO;
import org.songjianxi.books.util.tips.DataGridTip;

public interface BookStockServiceI {

    public DataGridTip<BookStockDTO> getBooKStockByCondition(BookStockDTO bookStockDTO);

    public Integer updateBookStock(BookStockDTO bookStockDTO);

    public Integer updateBookStockForOrder(BookStockDTO bookStockDTO);
}
