package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.BookOrderDaoI;
import org.songjianxi.books.domain.BookOrder;
import org.songjianxi.books.driven.BookOrderDTO;
import org.songjianxi.books.service.BookOrderServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "bookOrderService")
public class BookOrderServiceImpl implements BookOrderServiceI {

    private BookOrderDaoI bookOrderDao;

    public BookOrderDaoI getBookOrderDao() {
        return bookOrderDao;
    }

    @Autowired
    public void setBookOrderDao(BookOrderDaoI bookOrderDao) {
        this.bookOrderDao = bookOrderDao;
    }



    @Override
    public DataGridTip<BookOrderDTO> getBookOrderByCondition(BookOrderDTO bookOrderDTO) {
        DataGridTip<BookOrderDTO> dataGridTip = new DataGridTip<BookOrderDTO>();
        String hql = "from BookOrder order where 1=1 ";
        Map<String, Object> params = new HashMap<String, Object>();
        if (bookOrderDTO.getStatus() != null && bookOrderDTO.getStatus() != 0) {
            hql = hql + "and order.status = :status ";
            params.put("status", bookOrderDTO.getStatus());
        }
        hql = hql + " and order.orderTime between :orderTimeFrom and :orderTimeTo ";
        if (bookOrderDTO.getOrderTimeFrom() != null) {
            params.put("orderTimeFrom", bookOrderDTO.getOrderTimeFrom());
            params.put("orderTimeTo", bookOrderDTO.getOrderTimeTo());
        } else {
            Calendar calendar = Calendar.getInstance();
            params.put("orderTimeTo", calendar.getTime());
            calendar.add(Calendar.DAY_OF_MONTH, -7);
            params.put("orderTimeFrom", calendar.getTime());
        }
        Integer page = bookOrderDTO.getPage() == null ? 1 : bookOrderDTO.getPage();
        Integer rows = bookOrderDTO.getRows() == null ? 10 : bookOrderDTO.getRows();
        List<BookOrder> list = bookOrderDao.find(hql, params, page, rows);
        List<BookOrderDTO> resultList = new ArrayList<BookOrderDTO>();
        if (EmptyUtil.isNotEmpty(list)) {
            BookOrderDTO resBookOrderDTO = null;
            for (int i = 0; i < list.size(); i++) {
                resBookOrderDTO = new BookOrderDTO();
                BeanUtils.copyNotNullProperties(list.get(i), resBookOrderDTO);
                resBookOrderDTO.setUsername(list.get(i).getUser().getUsername());
                resultList.add(resBookOrderDTO);
            }
        }
        dataGridTip.setRows(resultList);
        dataGridTip.setTotal(bookOrderDao.count("select count(*) " + hql, params));
        return dataGridTip;
    }

    @Override
    public Integer batchUpdateOrderStatus(BookOrderDTO bookOrderDTO) {

        String hql = "update BookOrder set status = :status where orderId in ";
        String ids = bookOrderDTO.getOrderIds();
        String[] orderIdsTmp = ids.split(",");
        String orderIds = "(";
        for (int i = 0; i < orderIdsTmp.length; i++) {
            if (i > 0) {
                orderIds += ",";
            }
            orderIds += "'" + orderIdsTmp[i] + "'";
        }
        orderIds = orderIds + ")";
        hql = hql + orderIds;
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("status", bookOrderDTO.getStatus());
        return bookOrderDao.update(hql, params);
    }

    @Override
    public Serializable generateOrder(BookOrder bookOrder) {
        return bookOrderDao.save(bookOrder);
    }

    @Override
    public Integer updateTotal(BookOrderDTO bookOrderDTO) {
        String hql = "update BookOrder bOrder set bOrder.total = :total where bOrder.orderId = :orderId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("total", bookOrderDTO.getTotal());
        params.put("orderId", bookOrderDTO.getOrderId());
        return bookOrderDao.update(hql, params);
    }

    @Override
    public List<BookOrder> getBookOrdersByUserId(BookOrderDTO bookOrderDTO) {
        List<BookOrder> list = new ArrayList<BookOrder>();
        Map<String, Object> params = new HashMap<String, Object>();
        String hql = "from BookOrder order where order.user.userId = :userId";
        params.put("userId", bookOrderDTO.getUserId());
        list = bookOrderDao.find(hql, params);
        return list;
    }


    @Override
    public BookOrderDTO getBookOrderToPay(BookOrderDTO bookOrderDTO) {
        BookOrder bookOrder = bookOrderDao.get(BookOrder.class, bookOrderDTO.getOrderId());
        BookOrderDTO bookOrderDTO2 = new BookOrderDTO();
        BeanUtils.copyNotNullProperties(bookOrder, bookOrderDTO2);
        return bookOrderDTO2;
    }
}
