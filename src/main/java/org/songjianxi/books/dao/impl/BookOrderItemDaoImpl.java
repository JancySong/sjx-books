package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.BookOrderItemDaoI;
import org.songjianxi.books.domain.BookOrderItem;
import org.springframework.stereotype.Repository;


@Repository(value="bookOrderItemDao")
public class BookOrderItemDaoImpl extends BasicDaoImpl<BookOrderItem> implements BookOrderItemDaoI{

}
