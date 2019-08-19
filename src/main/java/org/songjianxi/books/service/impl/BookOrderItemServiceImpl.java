package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.BookOrderItemDaoI;
import org.songjianxi.books.domain.BookOrderItem;
import org.songjianxi.books.driven.BookOrderItemDTO;
import org.songjianxi.books.service.BookOrderItemServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service(value = "bookOrderItemService")
public class BookOrderItemServiceImpl implements BookOrderItemServiceI {

    private BookOrderItemDaoI bookOrderItemDao;

    public BookOrderItemDaoI getBookOrderItemDao() {
        return bookOrderItemDao;
    }

    @Autowired
    public void setBookOrderItemDao(BookOrderItemDaoI bookOrderItemDao) {
        this.bookOrderItemDao = bookOrderItemDao;
    }


    @Override
    public DataGridTip<BookOrderItemDTO> getBookOrderItemByOrderId(BookOrderItemDTO bookOrderItemDTO) {
        DataGridTip<BookOrderItemDTO> dataGridTip = new DataGridTip<BookOrderItemDTO>();
        List<BookOrderItemDTO> resultList = new ArrayList<BookOrderItemDTO>();
        String hql = "from BookOrderItem item where 1=1 and item.bookOrder.orderId = :orderId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("orderId", bookOrderItemDTO.getOrderId());
        Integer page = 1;
        Integer rows = 10;
        if (bookOrderItemDTO.getPage() != null && bookOrderItemDTO.getPage() != 0) {
            page = bookOrderItemDTO.getPage();
        }
        if (bookOrderItemDTO.getRows() != null && bookOrderItemDTO.getRows() != 0) {
            rows = bookOrderItemDTO.getRows();
        }
        List<BookOrderItem> list = bookOrderItemDao.find(hql, params, page, rows);
        if (EmptyUtil.isNotEmpty(list)) {
            BookOrderItemDTO _bookOrderItemDTO = null;
            for (int i = 0; i < list.size(); i++) {
                _bookOrderItemDTO = new BookOrderItemDTO();
                BeanUtils.copyNotNullProperties(list.get(i), _bookOrderItemDTO);
                _bookOrderItemDTO.setBookName(list.get(i).getBookBaseInfo().getBookName());
                _bookOrderItemDTO.setPrice(list.get(i).getBookBaseInfo().getPrice());
                resultList.add(_bookOrderItemDTO);
            }
        }
        dataGridTip.setRows(resultList);
        dataGridTip.setTotal(bookOrderItemDao.count("select count(*) " + hql, params));
        return dataGridTip;
    }

    @Override
    public Serializable saveOrderItems(BookOrderItem bookOrderItem) {
        return bookOrderItemDao.save(bookOrderItem);
    }

    @Override
    public List<BookOrderItemDTO> getBookOrderItemsById(BookOrderItemDTO bookOrderItemDTO) {
        String hql = "from BookOrderItem item where item.bookOrder.orderId = :orderId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("orderId", bookOrderItemDTO.getOrderId());
        List<BookOrderItem> list = bookOrderItemDao.find(hql, params);
        List<BookOrderItemDTO> resultList = null;
        if (EmptyUtil.isNotEmpty(list)) {
            resultList = new ArrayList<BookOrderItemDTO>();
            BookOrderItemDTO _bookOrderItemDTO = null;
            for (BookOrderItem bookOrderItem : list) {
                _bookOrderItemDTO = new BookOrderItemDTO();
                BeanUtils.copyNotNullProperties(bookOrderItem, _bookOrderItemDTO);
                _bookOrderItemDTO.setBookName(bookOrderItem.getBookBaseInfo().getBookName());
                _bookOrderItemDTO.setBookId(bookOrderItem.getBookBaseInfo().getBid());
                _bookOrderItemDTO.setPrice(bookOrderItem.getBookBaseInfo().getPrice());
                resultList.add(_bookOrderItemDTO);
            }
        }
        return resultList;
    }
}
