package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.BookImgDaoI;
import org.songjianxi.books.domain.BookImg;
import org.springframework.stereotype.Repository;

@Repository(value = "bookImgDao")
public class BookImgDaoImpl extends BasicDaoImpl<BookImg> implements BookImgDaoI {

}
