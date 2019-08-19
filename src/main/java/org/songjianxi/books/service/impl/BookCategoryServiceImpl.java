package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.BookCategoryDaoI;
import org.songjianxi.books.domain.BookCategory;
import org.songjianxi.books.driven.BookCategoryDTO;
import org.songjianxi.books.service.BookCategoryServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.Constants;
import org.songjianxi.books.util.ConvertUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "bookCategoryService")
public class BookCategoryServiceImpl implements BookCategoryServiceI {

    private BookCategoryDaoI bookCategoryDao;

    public BookCategoryDaoI getBookCategoryDao() {
        return bookCategoryDao;
    }

    @Autowired
    public void setBookCategoryDao(BookCategoryDaoI bookCategoryDao) {
        this.bookCategoryDao = bookCategoryDao;
    }


    @Override
    public List<BookCategory> getBookCategory(Integer pid) {
        String hql = " from BookCategory category where 1=1 ";
        Map<String, Object> params = new HashMap<String, Object>();
        if (null != pid && pid != 0) {
            hql += "and category.bookCategory.cid = :pid";
            params.put("pid", pid);
        } else {
            hql += " and category.bookCategory.cid is null";
        }
        return bookCategoryDao.find(hql, params);
    }

    @Override
    public BookCategory getBookCategoryById(Serializable id) {
        return bookCategoryDao.get(BookCategory.class, id);
    }

    @SuppressWarnings("unchecked")
    @Override
    public DataGridTip<BookCategoryDTO> getCategoryByLevel(BookCategoryDTO bookCategoryDTO) {
        DataGridTip<BookCategoryDTO> dataGridTip = new DataGridTip<BookCategoryDTO>();
        String hql = " from BookCategory category where 1=1 ";
        Map<String, Object> params = new HashMap<String, Object>();
        int pageIndex = 1;
        int pageSize = 10;
        if (bookCategoryDTO.getPage() != null && bookCategoryDTO.getPage() != 0) {
            pageIndex = bookCategoryDTO.getPage();
        }
        if (bookCategoryDTO.getRows() != null && bookCategoryDTO.getRows() != 0) {
            pageSize = bookCategoryDTO.getRows();
        }

        if (bookCategoryDTO.getPid() != null && bookCategoryDTO.getPid() != 0) {
            hql += "and category.bookCategory.cid = :pid";
            params.put("pid", bookCategoryDTO.getPid());
        } else if (bookCategoryDTO.getLevel() == null && bookCategoryDTO.getPid() == null) {
            hql += " and category.bookCategory.cid is null";
        } else {
            if (Constants.LEVEL_ONE == bookCategoryDTO.getLevel()) {
                hql += " and category.bookCategory.cid is null";
            } else {
                hql += " and category.bookCategory.cid is not null";
            }
        }
        List<BookCategory> list = bookCategoryDao.find(hql, params, pageIndex, pageSize);

        List<BookCategoryDTO> rows = (List<BookCategoryDTO>) ConvertUtil.convertModel(list, BookCategoryDTO.class);
        dataGridTip.setTotal(bookCategoryDao.count("select count(*) " + hql, params));
        dataGridTip.setRows(rows);
        return dataGridTip;
    }

    @Override
    public Serializable saveBookCategory(BookCategoryDTO bookCategoryDTO) {
        BookCategory bookCategory = new BookCategory();
        BeanUtils.copyNotNullProperties(bookCategoryDTO, bookCategory);
        Serializable id;
        if (bookCategoryDTO.getPid() != null) {
            bookCategory.setBookCategory(getBookCategoryById(bookCategoryDTO.getPid()));
        }
        id = bookCategoryDao.save(bookCategory);
        return id;
    }

}
