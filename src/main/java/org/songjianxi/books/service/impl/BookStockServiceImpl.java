package org.songjianxi.books.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.BookStockDaoI;
import org.songjianxi.books.domain.BookStock;
import org.songjianxi.books.driven.BookStockDTO;
import org.songjianxi.books.service.BookStockServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("bookStockService")
public class BookStockServiceImpl implements BookStockServiceI {

    private BookStockDaoI bookStockDao;

    public BookStockDaoI getBookStockDao() {
        return bookStockDao;
    }

    @Autowired
    public void setBookStockDao(BookStockDaoI bookStockDao) {
        this.bookStockDao = bookStockDao;
    }


    @Override
    public DataGridTip<BookStockDTO> getBooKStockByCondition(BookStockDTO bookStockDTO) {
        String hql = "from BookStock stock where 1=1 ";
        Integer page = bookStockDTO.getPage() == null ? 1 : bookStockDTO.getPage();
        Integer rows = bookStockDTO.getRows() == null ? 10 : bookStockDTO.getRows();
        Map<String, Object> params = new HashMap<String, Object>();
        DataGridTip<BookStockDTO> dataGridTip = new DataGridTip<BookStockDTO>();
        if (EmptyUtil.isNotEmpty(bookStockDTO.getBookName())) {
            hql += " and stock.bookBaseInfo.bookName like :bookName ";
            params.put("bookName", "%%" + bookStockDTO.getBookName() + "%%");
        }
        if (EmptyUtil.isNotEmpty(bookStockDTO.getAuthor())) {
            hql += " and stock.bookBaseInfo.author like :author ";
            params.put("author", "%%" + bookStockDTO.getAuthor() + "%%");
        }
        if (bookStockDTO.getBookStockFrom() != null && bookStockDTO.getBookStockTo() != null) {
            hql += " and stock.bookStock between :bookStockFrom and :bookStockTo ";
            params.put("bookStockFrom", bookStockDTO.getBookStockFrom());
            params.put("bookStockTo", bookStockDTO.getBookStockTo());
        }
        List<BookStockDTO> resultList = new ArrayList<BookStockDTO>();
        List<BookStock> list = bookStockDao.find(hql, params, page, rows);
        if (EmptyUtil.isNotEmpty(list)) {
            BookStockDTO _bookBookStockDTO = null;
            BookStock bookStock = null;
            for (int i = 0; i < list.size(); i++) {
                _bookBookStockDTO = new BookStockDTO();
                bookStock = list.get(i);
                BeanUtils.copyNotNullProperties(bookStock, _bookBookStockDTO);
                _bookBookStockDTO.setBookName(bookStock.getBookBaseInfo().getBookName());
                _bookBookStockDTO.setAuthor(bookStock.getBookBaseInfo().getAuthor());
                _bookBookStockDTO.setPress(bookStock.getBookBaseInfo().getPress());
                resultList.add(_bookBookStockDTO);
            }
        }
        dataGridTip.setRows(resultList);
        dataGridTip.setTotal(bookStockDao.count("select count(*) " + hql, params));
        return dataGridTip;
    }

    @Override
    public Integer updateBookStock(BookStockDTO bookStockDTO) {
        String hql = "update BookStock stock set stock.bid = :bookId ,stock.bookStock = :bookStock where stock.bid = :bookId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("bookId", bookStockDTO.getBid());
        params.put("bookStock", bookStockDTO.getBookStock());
        return bookStockDao.update(hql, params);
    }

    @Override
    public Integer updateBookStockForOrder(BookStockDTO bookStockDTO) {
        String hql =
                "update BookStock stock set stock.bid = :bookId ,stock.bookStock = stock.bookStock - :bookStock where stock.bid = :bookId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("bookId", bookStockDTO.getBid());
        params.put("bookStock", bookStockDTO.getBookStock());
        return bookStockDao.update(hql, params);
    }
}
