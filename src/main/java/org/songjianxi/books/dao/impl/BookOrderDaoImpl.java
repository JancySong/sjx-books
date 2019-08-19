package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.BookOrderDaoI;
import org.songjianxi.books.domain.BookOrder;
import org.springframework.stereotype.Repository;


@Repository(value="bookOrderDao")
public class BookOrderDaoImpl extends BasicDaoImpl<BookOrder> implements BookOrderDaoI{

}
