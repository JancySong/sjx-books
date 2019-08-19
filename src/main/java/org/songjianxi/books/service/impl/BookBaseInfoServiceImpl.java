package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.BookBaseInfoDaoI;
import org.songjianxi.books.dao.BookStockDaoI;
import org.songjianxi.books.domain.BookBaseInfo;
import org.songjianxi.books.domain.BookCategory;
import org.songjianxi.books.domain.BookStock;
import org.songjianxi.books.driven.BookBaseInfoDTO;
import org.songjianxi.books.service.BookBaseInfoServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.common.IDUtil;
import org.songjianxi.books.util.page.PageData;
import org.songjianxi.books.util.page.PagingInfo;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "bookBaseInfoService")
public class BookBaseInfoServiceImpl implements BookBaseInfoServiceI {

    private BookBaseInfoDaoI bookBaseInfoDao;

    public BookBaseInfoDaoI getBookBaseInfoDao() {
        return bookBaseInfoDao;
    }

    @Autowired
    public void setBookBaseInfoDao(BookBaseInfoDaoI bookBaseInfoDao) {
        this.bookBaseInfoDao = bookBaseInfoDao;
    }

    private BookStockDaoI bookStockDao;


    public BookStockDaoI getBookStockDao() {
        return bookStockDao;
    }

    @Autowired
    public void setBookStockDao(BookStockDaoI bookStockDao) {
        this.bookStockDao = bookStockDao;
    }

    @Override
    public List<BookBaseInfoDTO> queryBaseInfo() {
        List<BookBaseInfo> list = bookBaseInfoDao.find(" from BookBaseInfo", null);
        List<BookBaseInfoDTO> listDTO = new ArrayList<BookBaseInfoDTO>();
        if (list != null && list.size() > 0) {
            for (BookBaseInfo bookBaseInfo : list) {
                BookBaseInfoDTO baseInfoDTO = new BookBaseInfoDTO();
                BeanUtils.copyNotNullProperties(bookBaseInfo, baseInfoDTO);
                baseInfoDTO.setBookType(bookBaseInfo.getBookCategory().getCname().toString());
                listDTO.add(baseInfoDTO);
            }
        }
        return listDTO;
    }

    @Override
    public PageData<BookBaseInfoDTO> queryBooksLikeWhere(BookBaseInfoDTO baseInfoDTO) {
        PageData<BookBaseInfoDTO> pageData = new PageData<BookBaseInfoDTO>();
        PagingInfo pagingInfo = new PagingInfo();
        BookBaseInfoDTO baseInfoDTO2 = null;
        List<BookBaseInfoDTO> resList = new ArrayList<BookBaseInfoDTO>();
        String hql =
                "from BookBaseInfo as book where 1=1 and book.bookName LIKE :likeWhere or book.author LIKE :likeWhere"
                        + " OR book.press LIKE :likeWhere OR book.bookCategory.cname like :likeWhere "
                        + " OR book.bookCategory.bookCategory.cname like :likeWhere";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("likeWhere", "%%" + baseInfoDTO.getLikeWhere() + "%%");
        int pageIndex = 1;
        int pageSize = 10;
        long total = bookBaseInfoDao.count("select count(*) " + hql, params);
        if (baseInfoDTO.getPageIndex() != null) {
            pageIndex = baseInfoDTO.getPageIndex();
        }
        if (baseInfoDTO.getPageSize() != null) {
            pageSize = baseInfoDTO.getPageSize();
        }
        List<BookBaseInfo> list = bookBaseInfoDao.find(hql, params, pageIndex, pageSize);
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                baseInfoDTO2 = new BookBaseInfoDTO();
                BeanUtils.copyNotNullProperties(list.get(i), baseInfoDTO2);
                baseInfoDTO2.setBookType(list.get(i).getBookCategory().getCname());
                resList.add(baseInfoDTO2);
            }
        }
        pagingInfo.setPageSize(pageSize);
        pagingInfo.setCurrentPage(pageIndex);
        pagingInfo.setTotalCount(Integer.valueOf(Long.toString(total)));
        pageData.setList(resList);
        pageData.setPage(pagingInfo);
        return pageData;
    }

    @Override
    public BookBaseInfo getBookById(Serializable id) {
        return bookBaseInfoDao.get(BookBaseInfo.class, id);
    }

    @Override
    public DataGridTip<BookBaseInfoDTO> findBooksByCondition(BookBaseInfoDTO bookBaseInfoDTO) {
        DataGridTip<BookBaseInfoDTO> dataGridTip = new DataGridTip<BookBaseInfoDTO>();
        String hql = " from BookBaseInfo book where 1=1 ";
        Map<String, Object> params = new HashMap<String, Object>();
        int pageIndex = 1;
        int pageSize = 10;
        if (bookBaseInfoDTO.getPage() != 0) {
            pageIndex = bookBaseInfoDTO.getPage();
        }
        if (bookBaseInfoDTO.getRows() != 0) {
            pageSize = bookBaseInfoDTO.getRows();
        }
        if (EmptyUtil.isNotEmpty(bookBaseInfoDTO.getBookName())) {
            hql += " and book.bookName like :bookName ";
            params.put("bookName", "%%" + bookBaseInfoDTO.getBookName() + "%%");
        }
        if (EmptyUtil.isNotEmpty(bookBaseInfoDTO.getAuthor())) {
            hql += " and book.author like :author ";
            params.put("author", "%%" + bookBaseInfoDTO.getAuthor() + "%%");
        }
        if (EmptyUtil.isNotEmpty(bookBaseInfoDTO.getPress())) {
            hql += " and book.press like :press ";
            params.put("press", "%%" + bookBaseInfoDTO.getPress() + "%%");
        }
        if (bookBaseInfoDTO.getPublishDateFrom() != null && bookBaseInfoDTO.getPublishDateTo() != null) {
            hql += " and book.publishDate BETWEEN :publishDateFrom AND :publishDateTo ";
            params.put("publishDateFrom", bookBaseInfoDTO.getPublishDateFrom());
            params.put("publishDateTo", bookBaseInfoDTO.getPublishDateTo());
        }
        List<BookBaseInfo> list = bookBaseInfoDao.find(hql, params, pageIndex, pageSize);
        List<BookBaseInfoDTO> resLit = new ArrayList<BookBaseInfoDTO>();
        BookBaseInfoDTO tmpBaseInfoDTO = null;
        if (EmptyUtil.isNotEmpty(list)) {
            for (int i = 0; i < list.size(); i++) {
                tmpBaseInfoDTO = new BookBaseInfoDTO();
                BeanUtils.copyNotNullProperties(list.get(i), tmpBaseInfoDTO);
                tmpBaseInfoDTO.setBookType(list.get(i).getBookCategory().getCname());
                resLit.add(tmpBaseInfoDTO);
            }
        }
        String totalHql = "select count(*) " + hql;
        dataGridTip.setTotal(bookBaseInfoDao.count(totalHql, params));
        dataGridTip.setRows(resLit);
        return dataGridTip;
    }

    @Override
    public JSONTips savdeBookBaseInfo(BookBaseInfoDTO baseInfoDTO) {
        System.out.println("enter the method.......");
        JSONTips jsonTips = new JSONTips();
        String bid = IDUtil.generateID();
        BookBaseInfo bookBaseInfo = new BookBaseInfo();
        // BeanUtils.copyNotNullProperties(baseInfoDTO, bookBaseInfo);
        BeanUtils.copyNotNullProperties(baseInfoDTO, bookBaseInfo, new String[] {"price"});

        if (baseInfoDTO.getPrice() != null) {
            Double pri = Double.valueOf(baseInfoDTO.getPrice());
            // System.out.println("long..........");
            // System.out.println(pri);
            // System.out.println("long..........");
            bookBaseInfo.setPrice(pri);
        }
        bookBaseInfo.setBid(bid);
        BookStock bookStock = new BookStock();
        bookStock.setBid(bid);
        bookStock.setApplyCount(0);
        bookStock.setBookStock(0);
        // System.out.println("kkkkkkkkkkk");
        // System.out.println(bookBaseInfo);
        // System.out.println("lllllllllmmmm");
        // bookBaseInfo.setBookStock(bookStock);

        BookCategory bookCategory = new BookCategory();
        if (baseInfoDTO.getCid2() != null) {
            bookCategory.setCid(baseInfoDTO.getCid2());
        } else {
            bookCategory.setCid(baseInfoDTO.getCid());
        }
        bookBaseInfo.setBookCategory(bookCategory);
        try {
            bookBaseInfoDao.save(bookBaseInfo);
            bookStockDao.save(bookStock);

        } catch (Exception e) {
            // TODO: handle exception
        }
        return jsonTips;
    }


    @Override
    public Integer updateBook(BookBaseInfoDTO bookBaseInfoDTO) {
        String hql = "update BookBaseInfo book set book.bid = :bookId ";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("bookId", bookBaseInfoDTO.getBid());
        if (EmptyUtil.isNotEmpty(bookBaseInfoDTO.getBookName())) {
            hql += " ,book.bookName = :bookName ";
            params.put("bookName", bookBaseInfoDTO.getBookName());
        }
        if (EmptyUtil.isNotEmpty(bookBaseInfoDTO.getCoverImage())) {
            hql += " ,book.coverImage = :coverImage ";
            params.put("coverImage", bookBaseInfoDTO.getCoverImage());
        }
        hql += " where book.bid = :bookId ";
        return bookStockDao.update(hql, params);
    }
}
