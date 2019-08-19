package org.songjianxi.books.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.songjianxi.books.dao.UserCartDaoI;
import org.songjianxi.books.domain.UserCart;
import org.songjianxi.books.driven.UserCartDTO;
import org.songjianxi.books.service.UserCartServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.common.EmptyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "userCartService")
public class UserCartServiceImpl implements UserCartServiceI {

    private UserCartDaoI userCartDao;

    public UserCartDaoI getUserCartDao() {
        return userCartDao;
    }

    @Autowired
    public void setUserCartDao(UserCartDaoI userCartDao) {
        this.userCartDao = userCartDao;
    }

    @Override
    public List<UserCartDTO> getUserCart(UserCartDTO userCartDTO) {
        String hql = " from UserCart u where u.user.userId = :userId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", userCartDTO.getUserId());
        List<UserCart> list = userCartDao.find(hql, params);
        List<UserCartDTO> resultList = new ArrayList<UserCartDTO>();
        if (EmptyUtil.isNotEmpty(list)) {
            UserCartDTO _userCartDTO = null;
            for (int i = 0; i < list.size(); i++) {
                _userCartDTO = new UserCartDTO();
                UserCart userCart = list.get(i);
                BeanUtils.copyNotNullProperties(userCart, _userCartDTO);
                _userCartDTO.setBookId(userCart.getBookBaseInfo().getBid());
                _userCartDTO.setBookPrice(userCart.getBookBaseInfo().getPrice());
                _userCartDTO.setUserId(userCart.getUser().getUserId());
                _userCartDTO.setBookName(userCart.getBookBaseInfo().getBookName());
                resultList.add(_userCartDTO);
            }
        }
        return resultList;
    }

    @Override
    public Integer deleteByCartId(UserCartDTO userCartDTO) {
        String hql = "delete from UserCart cart where cart.cartId = :cartId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("cartId", userCartDTO.getCartId());
        return userCartDao.update(hql, params);
    }

    @Override
    public Integer deleteByCartIds(UserCartDTO userCartDTO) {
        String hql = "delete from UserCart cart where cart.cartId in ";

        String[] idsArr = userCartDTO.getCartIds().split(",");
        String cartIds = "(";
        for (int i = 0; i < idsArr.length; i++) {
            if (i > 0) {
                cartIds += ",";
            }
            cartIds += "'" + idsArr[i] + "'";
        }
        cartIds += ")";
        hql = hql + cartIds;
        return userCartDao.update(hql, null);
    }

    @Override
    public Integer updateUserCartById(UserCartDTO userCartDTO) {
        String hql = "update UserCart cart ";
        if ("add".equalsIgnoreCase(userCartDTO.getOperation())) {
            hql += " set cart.quantity = cart.quantity + 1 ";
        } else {
            hql += " set cart.quantity = cart.quantity - 1 ";
        }
        hql += " where cart.cartId = :cartId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("cartId", userCartDTO.getCartId());
        return userCartDao.update(hql, params);
    }

    @Override
    public Integer countUserCarts(UserCartDTO userCartDTO) {
        String hql = "select count(*) from UserCart cart where cart.user.userId = :userId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", userCartDTO.getUserId());
        Long count = userCartDao.count(hql, params);
        return Integer.valueOf(count.toString());
    }

    @Override
    public List<UserCartDTO> getUserCartByCartIds(UserCartDTO userCartDTO) {
        String hql = " from UserCart cart where cart.cartId in ";

        String[] idsArr = userCartDTO.getCartIds().split(",");
        String cartIds = "(";
        for (int i = 0; i < idsArr.length; i++) {
            if (i > 0) {
                cartIds += ",";
            }
            cartIds += "'" + idsArr[i] + "'";
        }
        cartIds += ")";
        hql = hql + cartIds;

        List<UserCart> list = userCartDao.find(hql, null);
        List<UserCartDTO> resultList = new ArrayList<UserCartDTO>();
        if (EmptyUtil.isNotEmpty(list)) {
            UserCartDTO _userCartDTO = null;
            for (int i = 0; i < list.size(); i++) {
                _userCartDTO = new UserCartDTO();
                UserCart userCart = list.get(i);
                BeanUtils.copyNotNullProperties(userCart, _userCartDTO);
                _userCartDTO.setBookId(userCart.getBookBaseInfo().getBid());
                _userCartDTO.setBookPrice(userCart.getBookBaseInfo().getPrice());
                _userCartDTO.setUserId(userCart.getUser().getUserId());
                _userCartDTO.setBookName(userCart.getBookBaseInfo().getBookName());
                resultList.add(_userCartDTO);
            }
        }
        return resultList;
    }

    @Override
    public UserCart getUserCartByUserIdAndBookId(UserCartDTO userCartDTO) {
        String hql = " from UserCart cart where cart.user.userId = :userId and cart.bookBaseInfo.bid = :bookId";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", userCartDTO.getUserId());
        params.put("bookId", userCartDTO.getBookId());
        List<UserCart> list = userCartDao.find(hql, params);
        if (EmptyUtil.isNotEmpty(list)) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public Serializable saveUserCart(UserCart userCart) {
        return userCartDao.save(userCart);
    }
}
