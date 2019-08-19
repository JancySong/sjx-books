package org.songjianxi.books.dao.impl;

import org.songjianxi.books.dao.UserCommentDaoI;
import org.songjianxi.books.domain.UserComment;
import org.springframework.stereotype.Repository;


@Repository(value="userCommentDao")
public class UserCommentDaoImpl extends BasicDaoImpl<UserComment> implements UserCommentDaoI{

}
