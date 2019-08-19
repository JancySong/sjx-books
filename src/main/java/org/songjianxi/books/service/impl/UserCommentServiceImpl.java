package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.UserCommentDaoI;
import org.songjianxi.books.domain.UserComment;
import org.songjianxi.books.driven.UserCommentDTO;
import org.songjianxi.books.service.UserCommentServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.page.PageData;
import org.songjianxi.books.util.page.PagingInfo;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "userCommentService")
public class UserCommentServiceImpl implements UserCommentServiceI {

    private UserCommentDaoI userCommentDao;

    public UserCommentDaoI getUserCommentDao() {
        return userCommentDao;
    }

    @Autowired
    public void setUserCommentDao(UserCommentDaoI userCommentDao) {
        this.userCommentDao = userCommentDao;
    }


    @Override
    public DataGridTip<UserCommentDTO> getUserCommentsByCondition(UserCommentDTO userCommentDTO) {
        DataGridTip<UserCommentDTO> dataGridTip = new DataGridTip<UserCommentDTO>();
        Map<String, Object> params = new HashMap<String, Object>();
        Integer page = userCommentDTO.getPage() == null ? 1 : userCommentDTO.getPage();
        Integer rows = userCommentDTO.getRows() == null ? 10 : userCommentDTO.getRows();
        String hql = " from UserComment comment where 1=1 ";
        hql = hql + " and comment.commTime between :commTimeFrom and :commTimeTo ";
        if (userCommentDTO.getCommTimeFrom() != null) {
            params.put("commTimeFrom", userCommentDTO.getCommTimeFrom());
            params.put("commTimeTo", userCommentDTO.getCommTimeTo());
        } else {
            Calendar calendar = Calendar.getInstance();
            params.put("commTimeTo", calendar.getTime());
            calendar.add(Calendar.DAY_OF_MONTH, -7);
            params.put("commTimeFrom", calendar.getTime());
        }
        List<UserComment> list = userCommentDao.find(hql, params, page, rows);
        List<UserCommentDTO> resultList = new ArrayList<UserCommentDTO>();
        if (EmptyUtil.isNotEmpty(list)) {
            UserCommentDTO _userCommentDTO = null;
            for (int i = 0; i < list.size(); i++) {
                _userCommentDTO = new UserCommentDTO();
                UserComment userComment = list.get(i);
                BeanUtils.copyNotNullProperties(userComment, _userCommentDTO);
                _userCommentDTO.setBookName(userComment.getBookBaseInfo().getBookName());
                _userCommentDTO.setUserName(userComment.getUser().getUsername());
                resultList.add(_userCommentDTO);
            }
        }
        dataGridTip.setRows(resultList);
        dataGridTip.setTotal(userCommentDao.count("select count(*) " + hql, params));
        return dataGridTip;
    }


    @Override
    public PageData<UserCommentDTO> getUserCommentsByBookId(UserCommentDTO userCommentDTO) {
        String hql = "from UserComment comment where 1=1 and comment.bookBaseInfo.bid = :bookId order by comment.commTime desc ";
        Map<String, Object> params = new HashMap<String, Object>();
        PageData<UserCommentDTO> pageData = new PageData<UserCommentDTO>();
        PagingInfo pagingInfo = new PagingInfo();
        Integer page = userCommentDTO.getPage() == null ? 1 : userCommentDTO.getPage();
        Integer rows = userCommentDTO.getRows() == null ? 10 : userCommentDTO.getRows();
        if (EmptyUtil.isNotEmpty(userCommentDTO.getBookId())) {
            params.put("bookId", userCommentDTO.getBookId());
        }
        List<UserComment> list = userCommentDao.find(hql, params, page, rows);
        Long totalCount = userCommentDao.count("select count(*) " + hql, params);
        List<UserCommentDTO> resultList = new ArrayList<UserCommentDTO>();

        if (EmptyUtil.isNotEmpty(list)) {
            UserCommentDTO _userCommentDTO = null;
            for (int i = 0; i < list.size(); i++) {
                _userCommentDTO = new UserCommentDTO();
                BeanUtils.copyNotNullProperties(list.get(i), _userCommentDTO);
                _userCommentDTO.setUserName(list.get(i).getUser().getUsername());
                resultList.add(_userCommentDTO);
            }
        }
        pagingInfo.setPageSize(rows);
        pagingInfo.setCurrentPage(page);
        pagingInfo.setTotalCount(Integer.valueOf(Long.toString(totalCount)));
        pageData.setPage(pagingInfo);
        pageData.setList(resultList);
        return pageData;
    }

    @Override
    public Serializable saveUserComment(UserComment userComment) {
        return userCommentDao.save(userComment);
    }
}
