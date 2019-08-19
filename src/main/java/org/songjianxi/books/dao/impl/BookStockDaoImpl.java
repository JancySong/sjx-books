package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.BookStockDaoI;
import org.songjianxi.books.domain.BookStock;
import org.springframework.stereotype.Repository;


@Repository(value="bookStockDao")
public class BookStockDaoImpl extends BasicDaoImpl<BookStock> implements BookStockDaoI{

}
