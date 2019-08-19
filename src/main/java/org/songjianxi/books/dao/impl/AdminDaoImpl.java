package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.AdminDaoI;
import org.songjianxi.books.domain.Admin;
import org.springframework.stereotype.Repository;

@Repository(value="adminDao")
public class AdminDaoImpl extends BasicDaoImpl<Admin> implements AdminDaoI{

}
