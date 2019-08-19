package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.BookImgDaoI;
import org.songjianxi.books.domain.BookImg;
import org.songjianxi.books.driven.BookImgDTO;
import org.songjianxi.books.service.BookImgServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "bookImgService")
public class BookImgServiceImpl implements BookImgServiceI {
    private BookImgDaoI bookImgDao;

    public BookImgDaoI getBookImgDao() {
        return bookImgDao;
    }

    @Autowired
    public void setBookImgDao(BookImgDaoI bookImgDao) {
        this.bookImgDao = bookImgDao;
    }

    @Override
    public List<String> getBookImgs(String bid) {
        List<String> list = new ArrayList<String>(0);
        String hql = "from BookImg book where book.bid = :bid";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("bid", bid);
        List<BookImg> imgs = bookImgDao.find(hql, params);
        if (imgs != null && imgs.size() > 0) {
            for (int i = 0; i < imgs.size(); i++) {
                list.add(imgs.get(i).getImgUrl());
            }
        }
        return list;
    }


    @Override
    public DataGridTip<BookImgDTO> getBookImgsByConditon(BookImgDTO bookImgDTO) {
        Map<String, Object> params = new HashMap<String, Object>();
        DataGridTip<BookImgDTO> dataGridTip = new DataGridTip<BookImgDTO>();
        String hql = " from BookImg b where 1=1 ";
        int pageIndex = 1;
        int pageSize = 10;
        if (bookImgDTO.getPage() != null) {
            pageIndex = bookImgDTO.getPage();
        }
        if (bookImgDTO.getRows() != null) {
            pageSize = bookImgDTO.getRows();
        }
        if (bookImgDTO.getBid() != null) {
            hql += " and b.bookBaseInfo.bid = :bid order by b.orderBy";
            params.put("bid", bookImgDTO.getBid());
        }
        List<BookImg> list = bookImgDao.find(hql, params, pageIndex, pageSize);
        List<BookImgDTO> rList = new ArrayList<BookImgDTO>();
        BookImgDTO resbBookImgDTO = null;
        // List<BookImgDTO> rList = (List<BookImgDTO>) ConvertUtil.convertModel(list, BookImgDTO.class);
        System.out.println("kllllll");
        System.out.println(list.size());
        if (EmptyUtil.isNotEmpty(list)) {
            for (int i = 0; i < list.size(); i++) {
                resbBookImgDTO = new BookImgDTO();
                BeanUtils.copyNotNullProperties(list.get(i), resbBookImgDTO);
                resbBookImgDTO.setBid(list.get(i).getBookBaseInfo().getBid());
                rList.add(resbBookImgDTO);
                System.out.println(resbBookImgDTO);
                System.out.println("2545lllkkkkjjj");
            }
        }
        dataGridTip.setTotal(bookImgDao.count("select count(*) " + hql, params));
        dataGridTip.setRows(rList);
        return dataGridTip;
    }


    @Override
    public Integer updateImgs(BookImgDTO bookImgDTO) {
        String hql = "update BookImg book set book.orderBy = :orderBy where book.imgId = :imgId";
        Map<String, Object> params = null;
        String[] ids = bookImgDTO.getImgIds().split(",");
        String[] orderBys = bookImgDTO.getOrderBys().split(",");
        if (ids.length > 0) {
            try {
                for (int i = 0; i < ids.length; i++) {
                    params = new HashMap<String, Object>();
                    params.put("orderBy", Integer.valueOf(orderBys[i]));
                    params.put("imgId", ids[i]);
                    bookImgDao.update(hql, params);
                }
                return 1;
            } catch (Exception e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    @Override
    public Integer deleteImgsByIds(String ids) {
        String hql = "delete BookImg book where book.imgId in ";
        String[] imgIdsTmp = ids.split(",");
        String imgIds = "(";
        for (int i = 0; i < imgIdsTmp.length; i++) {
            if (i > 0) {
                imgIds += ",";
            }
            imgIds += "'" + imgIdsTmp[i] + "'";
        }
        imgIds += ")";
        hql += imgIds;
        System.out.println(hql);
        return bookImgDao.executeHql(hql);
    }


    @Override
    public Integer countImgsByBookId(String id) {
        String hql = "select count(*) from BookImg book where book.bookBaseInfo.bid = :bookId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("bookId", id);
        Long count = bookImgDao.count(hql, params);
        return Integer.valueOf(count.toString());
    }

    @Override
    public Serializable save(BookImg bookImg) {
        return bookImgDao.save(bookImg);
    }
}
