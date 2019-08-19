package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.BookBaseInfoDaoI;
import org.songjianxi.books.domain.BookBaseInfo;
import org.springframework.stereotype.Repository;


@Repository(value="bookBaseInfoDao")
public class BookBaseInfoDaoImpl extends BasicDaoImpl<BookBaseInfo> implements BookBaseInfoDaoI{

}
