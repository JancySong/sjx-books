package org.songjianxi.books.service;

import java.io.Serializable;
import java.util.List;

import org.songjianxi.books.domain.BookCategory;
import org.songjianxi.books.driven.BookCategoryDTO;
import org.songjianxi.books.util.tips.DataGridTip;

public interface BookCategoryServiceI {

    public List<BookCategory> getBookCategory(Integer pid);

    public BookCategory getBookCategoryById(Serializable id);

    public DataGridTip<BookCategoryDTO> getCategoryByLevel(BookCategoryDTO bookCategoryDTO);

    public Serializable saveBookCategory(BookCategoryDTO bookCategoryDTO);
}
