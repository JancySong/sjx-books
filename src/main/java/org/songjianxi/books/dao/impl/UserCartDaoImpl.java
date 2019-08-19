package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.UserCartDaoI;
import org.songjianxi.books.domain.UserCart;
import org.springframework.stereotype.Repository;

@Repository(value="userCartDao")
public class UserCartDaoImpl extends BasicDaoImpl<UserCart> implements UserCartDaoI {


}
