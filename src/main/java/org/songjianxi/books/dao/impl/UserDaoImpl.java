package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.UserDaoI;
import org.songjianxi.books.domain.User;
import org.springframework.stereotype.Repository;

@Repository(value="userDao")
public class UserDaoImpl extends BasicDaoImpl<User> implements UserDaoI{

}
