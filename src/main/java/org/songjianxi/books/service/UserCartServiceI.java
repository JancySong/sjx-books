package org.songjianxi.books.service;

import java.io.Serializable;
import java.util.List;

import org.songjianxi.books.domain.UserCart;
import org.songjianxi.books.driven.UserCartDTO;

public interface UserCartServiceI {

    public List<UserCartDTO> getUserCart(UserCartDTO userCartDTO);

    public Integer deleteByCartId(UserCartDTO userCartDTO);

    public Integer deleteByCartIds(UserCartDTO userCartDTO);

    public Integer updateUserCartById(UserCartDTO userCartDTO);

    public Integer countUserCarts(UserCartDTO userCartDTO);

    public List<UserCartDTO> getUserCartByCartIds(UserCartDTO userCartDTO);

    public UserCart getUserCartByUserIdAndBookId(UserCartDTO userCartDTO);

    public Serializable saveUserCart(UserCart userCart);
}
