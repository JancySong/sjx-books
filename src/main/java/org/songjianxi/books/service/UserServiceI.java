package org.songjianxi.books.service;

import org.songjianxi.books.domain.User;
import org.songjianxi.books.driven.UserDTO;
import org.songjianxi.books.util.tips.DataGridTip;

public interface UserServiceI {

    public User checkUser(User user);

    public User isExistUserName(String username);

    public User addUser(User user);

    public DataGridTip<UserDTO> getUserByCondition(UserDTO userDTO);

    public Integer activeUser(UserDTO userDTO);

    public Integer userOnlineOrOutline(UserDTO userDTO);
}
