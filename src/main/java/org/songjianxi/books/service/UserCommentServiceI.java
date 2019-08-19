package org.songjianxi.books.service;

import java.io.Serializable;

import org.songjianxi.books.domain.UserComment;
import org.songjianxi.books.driven.UserCommentDTO;
import org.songjianxi.books.util.page.PageData;
import org.songjianxi.books.util.tips.DataGridTip;

public interface UserCommentServiceI {

    public DataGridTip<UserCommentDTO> getUserCommentsByCondition(UserCommentDTO userCommentDTO);

    public PageData<UserCommentDTO> getUserCommentsByBookId(UserCommentDTO userCommentDTO);

    public Serializable saveUserComment(UserComment userComment);
}
