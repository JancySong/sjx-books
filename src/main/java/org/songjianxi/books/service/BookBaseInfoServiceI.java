package org.songjianxi.books.service;

import java.io.Serializable;
import java.util.List;

import org.songjianxi.books.domain.BookBaseInfo;
import org.songjianxi.books.driven.BookBaseInfoDTO;
import org.songjianxi.books.util.page.PageData;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;

public interface BookBaseInfoServiceI {

    public List<BookBaseInfoDTO> queryBaseInfo();

    public PageData<BookBaseInfoDTO> queryBooksLikeWhere(BookBaseInfoDTO baseInfoDTO);

    public BookBaseInfo getBookById(Serializable id);

    public DataGridTip<BookBaseInfoDTO> findBooksByCondition(BookBaseInfoDTO baseInfoDTO);

    public JSONTips savdeBookBaseInfo(BookBaseInfoDTO baseInfoDTO);

    public Integer updateBook(BookBaseInfoDTO bookBaseInfoDTO);
}
