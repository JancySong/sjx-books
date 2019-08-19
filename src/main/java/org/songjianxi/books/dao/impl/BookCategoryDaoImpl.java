package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.BookCategoryDaoI;
import org.songjianxi.books.domain.BookCategory;
import org.springframework.stereotype.Repository;


@Repository(value="bookCategoryDao")
public class BookCategoryDaoImpl extends BasicDaoImpl<BookCategory> implements BookCategoryDaoI{

}
